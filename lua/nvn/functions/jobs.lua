local M = {}

function M.GenerateRustTags()
  vim.fn.jobstart(
    {
      'bash',
      '-c',
      [[
        echo '!*' > .ignore;
        rusty-tags vi -o -f --output="individual-tags";
        echo "" > new_tags;
        for i in `find . -type f -name individual-tags`; do cat $i >> new_tags; rm -f $i; done
        mv new_tags tags
      ]]
    }
  )
end

function M.GenerateCPPTags()
  vim.fn.jobstart(
    {
      'bash',
      '-c',
      [[
        echo '!*' > .ignore;
        grep '"file"' compile_commands.json | grep -v unit-test | grep -v packages | grep -v MISRA | grep -v objs | cut -d':' -f2 | cut -d'"' -f2 > filelist.tags
        ctags -L filelist.tags --language-force=c++
      ]]
    }
  )
end

function M.GenerateJavaTags()
  vim.fn.jobstart(
    {
      'bash',
      '-c',
      [[
        echo '!*' > .ignore;
        find . -type f -name '*.java' > filelist.tags
        ctags -L filelist.tags --language-force=java
      ]]
    }
  )
end

function M.GeneratePythonTags()
  vim.fn.jobstart(
    {
      'bash',
      '-c',
      [[
        echo '!*' > .ignore;
        find . -type f -name '*.py' > filelist.tags
        ctags -L filelist.tags --language-force=python
      ]]
    }
  )
end

return M

