---------------------------------------------------------------
-- ██╗  ██╗██╗   ██╗██████╗ ██████╗ ███████╗███████╗ █████╗  --
-- ██║  ██║╚██╗ ██╔╝██╔══██╗██╔══██╗██╔════╝██╔════╝██╔══██╗ --
-- ███████║ ╚████╔╝ ██████╔╝██████╔╝███████╗█████╗  ███████║ --
-- ██╔══██║  ╚██╔╝  ██╔═══╝ ██╔══██╗╚════██║██╔══╝  ██╔══██║ --
-- ██║  ██║   ██║   ██║     ██║  ██║███████║███████╗██║  ██║ --
-- ╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝ --
---------------------------------------------------------------

-- Treesitter configuration
local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
    return
end

ts.setup({
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    ensure_installed = {
        "markdown",
        "tsx",
        "typescript",
        "javascript",
        "toml",
        "c",
        "cpp",
        "python",
        "bash",
        "go",
        "java",
        "php",
        "ruby",
        "swift",
        "regex",
        "vue",
        "svelte",
        "graphql",
        "dockerfile",
        "dart",
        "nix",
        "c_sharp",
        "json",
        "yaml",
        "rust",
        "css",
        "html",
        "lua",
    },
    rainbow = {
        enable = true,
        extended_mode = false,
        max_file_lines = nil,
    },
    autotag = { enable = true },
    incremental_selection = { enable = true },
    indent = { enable = true },
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

