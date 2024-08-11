vim.api.nvim_create_user_command('Fr', function(opts)
  local template = ':%s/'
  local cmd = string.format("%s/%s/gc", opts.fargs[1], opts.fargs[2])
  local returnValue = string.format('%s%s', template, cmd)
  vim.cmd(returnValue)
end, { desc = "Find and Replace", nargs = '*' })
