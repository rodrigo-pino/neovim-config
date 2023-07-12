local lua_path = vim.fn.stdpath('config') .. '/lua'
package.path = package.path .. ';' .. lua_path

require('settings')
require('plugins')
require('nvim_tree')
require('mappings')

require('telescope_config')
require('lsp')

-- require('lua/dap_config')
