" This function regenerates the cscope.out file using cscope.files

function! ReDoListingJava()
cscope kill -1
silent !rm -f tags cscope.out cscope.files
silent !find -regextype posix-egrep -regex ".*\.(java)" > cscope.files
silent !sed -r -i'' -e'/ +/d' cscope.files
silent !ctags -R --python-kinds=-i --fields=+iaS --extra=+q --language-force=java -L cscope.files
silent !cscope -b -k
cscope add cscope.out
endfunction
command! ReDoListingJava : call ReDoListingJava()

function! ReDoListingPy()
cscope kill -1
silent !rm -f tags cscope.out cscope.files
silent !find -regextype posix-egrep -regex ".*\.(py)" > cscope.files
silent !sed -r -i'' -e'/ +/d' cscope.files
silent !ctags -R --python-kinds=-i --fields=+iaS --extra=+q --language-force=python -L cscope.files
silent !cscope -b -k
cscope add cscope.out
endfunction
command! ReDoListingPy : call ReDoListingPy()

function! LoadTagsC()
silent !cp ../vimfiles/tags .
silent !cp ../vimfiles/cscope.out .
silent !echo '!*' > $W/.ignore
silent !rusty-tags vi -o -f --output="individual-tags"
silent !echo "" > tags
silent !for i in `find . -type f -name individual-tags`; do cat $i >> tags; rm -f $i; done
cscope kill -1
cscope add cscope.out
let &path="."
exe 'redraw!'
endfunction

function! LoadTagsRust()
silent !echo '!*' > $W/.ignore
silent !rusty-tags vi -o -f --output="individual-tags"
silent !echo "" > tags
silent !for i in `find . -type f -name individual-tags`; do cat $i >> tags; rm -f $i; done
endfunction

command! LoadTagsC : call LoadTagsC()
command! LoadTagsRust : call LoadTagsRust()
