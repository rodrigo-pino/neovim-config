local lua_path = vim.fn.stdpath('config') .. '/lua'
package.path = package.path .. ';' .. lua_path

require('settings')
require('plugins')
require('themes')
require('mappings')

require('telescope_config')
require('nvim_tree')
require('lsp')
-- require('lua/dap_config')
