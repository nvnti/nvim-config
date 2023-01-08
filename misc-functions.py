python3 << en

import  glob
import fileinput
import json
import os
import re
import sys
import vim
import yaml

from subprocess import Popen, PIPE

skipStartingWith = [ '/tmp/', 'term://' ]
skipContaining   = [ 'fugitiveblame', 'NERD', 'analysis-log.txt', '__Scratch__' ]

def getVimSettingVal(settingName):
    return vim.eval('&' + settingName)

####################################################################################
##################################### beautifyJSON #################################
####################################################################################

def removeComments(text):

    def replacer(match):
        s = match.group(0)
        if s.startswith('/'):
            return " " # note: a space and not an empty string
        else:
            return s
    pattern = re.compile(
        r'//.*?$|/\*.*?\*/|\'(?:\\.|[^\\\'])*\'|"(?:\\.|[^\\"])*"',
        re.DOTALL | re.MULTILINE
    )
    return re.sub(pattern, replacer, text)

def removeTrailingCommas(json_like):
    trailing_object_commas_re = re.compile(
        r'(,)\s*}(?=([^"\\]*(\\.|"([^"\\]*\\.)*[^"\\]*"))*[^"]*$)')
    trailing_array_commas_re = re.compile(
        r'(,)\s*\](?=([^"\\]*(\\.|"([^"\\]*\\.)*[^"\\]*"))*[^"]*$)')
    # Fix objects {} first
    objects_fixed = trailing_object_commas_re.sub("}", json_like)
    # Now fix arrays/lists [] and return the result
    fixed_data = trailing_array_commas_re.sub("]", objects_fixed)

    # This is a hack
    if fixed_data[-1] == ',':
        fixed_data = fixed_data[:-1]

    return fixed_data

def beautifyJSONFile(sortKeys = 0):
    lines = []
    buf   = vim.current.buffer

    # get tab stop width
    tabstop = int(getVimSettingVal('tabstop'))
    if sortKeys == 1:
        sortKeys = True
    else:
        sortKeys = False

    # read all the lines from files
    for line in buf[:]:
        lines.append(line)

    # Create a string for processing the content
    text   = '\n'.join(lines)
    # Remove C/C++ style comments.
    text   = removeComments(text)
    # Remove trailing commas
    text   = removeTrailingCommas(text)
    # Load the content as YAML and then dump it as JSON
    text   = json.dumps(yaml.load(text), indent = tabstop, sort_keys=sortKeys)

    # delete everything from the buffer
    buf[:] = None

    # Write lines back to buffer
    for line in text.split('\n'):
        buf.append(line)

    # Delete the first line if it is empty
    if len(buf[0]) == 0:
        del buf[0]

    # Add new line at the end of file
    buf.append('')

def beautifyJSON(sortKeys = 0):
    buf   = vim.current.buffer
    start = buf.mark("<")
    end   = buf.mark(">")

    # get tab stop width
    tabstop = int(getVimSettingVal('tabstop'))
    if sortKeys == 1:
        sortKeys = True
    else:
        sortKeys = False

    beforeLines   = []
    afterLines    = []
    selectedLines = []

    ndx = 0

    # read all the lines from files
    for line in buf[:]:
        ndx = ndx + 1
        if ndx < start[0]:
            beforeLines.append(line)
        if ndx < end[0] and ndx  > start[0]:
            selectedLines.append(line)

        if ndx == end[0] and ndx == start[0]:
            beforeLines.append(line)
            selectedLines.append(line)
            afterLines.append(line)
        elif ndx == start[0]:
            beforeLines.append(line)
            selectedLines.append(line)
        elif ndx == end[0]:
            selectedLines.append(line)
            afterLines.append(line)

        if ndx > end[0]:
            afterLines.append(line)

    if start[1] == 0:
        beforeLines = beforeLines[:-1]
    else:
        beforeLines[-1]   = beforeLines[-1][:start[1]]

    if end[1] == 0:
        selectedLines = selectedLines[:-1]
    elif end[1] > len(afterLines[0]):
        # Take whole selected line, remove from afterLines
        #selectedLines = selectedLines[:-1]
        afterLines = afterLines[1:]
    else:
        selectedLines[-1] = selectedLines[-1][:end[1]+1]
        afterLines[0]     = afterLines[0][end[1] + 1:]

    selectedLines[0]  = selectedLines[0][start[1]:]

    beforeText   = '\n'.join(beforeLines)
    selectedText = '\n'.join(selectedLines)
    afterText    = '\n'.join(afterLines)

    # Create a string for processing the content
    text   = '\n'.join(selectedLines)
    # Remove C/C++ style comments.
    text   = removeComments(text)
    # Remove trailing commas
    text   = removeTrailingCommas(text)
    # Load the content as YAML and then dump it as JSON
    text   = json.dumps(yaml.load(text), indent = tabstop, sort_keys=sortKeys)

    # delete everything from the buffer
    buf[:] = None

    text = beforeText + text + afterText

    # Write lines back to buffer
    for line in text.split('\n'):
        buf.append(line)

    # Delete the first line if it is empty
    if len(buf[0]) == 0:
        del buf[0]

    # Add new line at the end of file
    buf.append('')
####################################################################################
####################################################################################

def executeCommand(command, out=PIPE, err=PIPE):
    p = Popen(command, stdout=out, stderr=err, shell=True)
    output = p.communicate()

    data = dict()
    data['stdout']      = output[0]
    data['stderr']      = output[1]
    data['returncode']  = p.returncode

    return data

def getModuleNames(stdout):
    modules = []
    stdout = stdout.decode('utf-8')
    print(type(stdout))
    for line in stdout.split('\n'):
        print(line)
        if line.startswith('module = '):
            parts = line.split(',', 1)[0]
            moduleName = parts.replace('module = ', '')
            modules.append(moduleName)

    return modules

def showSummaryOfFunc(name, cff='$BIN/cov-find-function'):
    baseCmd = cff + ' --dir dir/dir '
    command = baseCmd + name

    output = executeCommand(command)
    modules = getModuleNames(output['stdout'])

    print(modules)
    for moduleName in modules:
        command = baseCmd + ' --module ' + moduleName + ' ' + name + ' --save'
        print(executeCommand(command))

def getListOfFilesFromPartName(partName):
    return glob.iglob(partName + '*')

def ExecuteVimCommand(cmd):
    vim.command('redir @z')
    vim.command('silent ' + cmd)
    vim.command('redir END')
    command_output = vim.eval('@z')
    return command_output

def WriteCommandOutputToFile(fname, command):
    with open(fname, "w") as fout:
        fout.write(ExecuteVimCommand(command))

def WriteVarOutputToFile(fname, command):
    with open(fname, "w") as fout:
        fout.write(vim.eval(command))

en
