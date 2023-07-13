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

return M

