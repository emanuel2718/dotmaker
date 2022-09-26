function nvim_config()
  local config_path = vim.fn.stdpath('config')
  vim.cmd('cd ' .. config_path)
  vim.cmd('e init.lua')
end
