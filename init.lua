local lua_path = vim.fn.stdpath("config") .. "/lua/?.lua"
local langs_path = vim.fn.stdpath("config") .. "/lua/plugins/?.lua"
package.path = package.path .. ";" .. lua_path .. ";" .. langs_path

require("settings")
require("lazy_config")
