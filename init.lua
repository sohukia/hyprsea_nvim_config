---------------------------------------------------------------
-- ██╗  ██╗██╗   ██╗██████╗ ██████╗ ███████╗███████╗ █████╗  --
-- ██║  ██║╚██╗ ██╔╝██╔══██╗██╔══██╗██╔════╝██╔════╝██╔══██╗ --
-- ███████║ ╚████╔╝ ██████╔╝██████╔╝███████╗█████╗  ███████║ --
-- ██╔══██║  ╚██╔╝  ██╔═══╝ ██╔══██╗╚════██║██╔══╝  ██╔══██║ --
-- ██║  ██║   ██║   ██║     ██║  ██║███████║███████╗██║  ██║ --
-- ╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝ --
---------------------------------------------------------------


-- KEYMAP AND SETTINGS
require("core.keymaps")
require("core.settings")

-- PLUGINS
require("core.plugins")
require("core.plugin_config")


-- colorscheme config: kanagawa
local themeStatus, catppuccin = pcall(require, "catppuccin")

if themeStatus then
    vim.cmd("colorscheme catppuccin-frappe")
else
    return
end