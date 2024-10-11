# hyprsea_nvim_config

My current configuration for neovim

## How to install

Navigate to `~/.config`. Then enter the command below :
```bash
git clone git@github.com:sohukia/hyprsea_nvim_config.git nvim
```

## **Project Structure**

```txt
.
├── cheatset.md
├── init.lua
├── lazy-lock.json
├── LICENSE
├── lua
│   └── core
│       ├── keymaps.lua
│       ├── plugins.lua
│       └── settings.lua
├── README.md
└── stderr
```

### **File Descriptions**
- **`cheatset.md`**: Contains a cheat sheet of keybindings and commonly used commands for quick reference.
- **`init.lua`**: The main configuration file for initializing the Neovim setup.
- **`lazy-lock.json`**: This file locks the state of `lazy.nvim` plugins, ensuring consistent builds across environments.
- **`LICENSE`**: The licensing information for this project.
- **`lua/core/keymaps.lua`**: Defines custom keybindings for various functions like file management, window navigation, and others.
- **`lua/core/plugins.lua`**: Manages all the plugin configurations, including LSP, completion, Git integration, and more.
- **`lua/core/settings.lua`**: General editor settings such as line numbers, indentation, clipboard usage, and other visual/editor preferences.
- **`README.md`**: Project's main README file (to be detailed later).
- **`stderr`**: Captures error outputs (if any) during the execution of Neovim commands.

---

## **Key Features and Configurations**

### **Keymaps**
Keybindings are an essential part of this configuration, enabling efficient navigation and workflow. These are defined in `lua/core/keymaps.lua`.

Example keybindings include:
- **File Search (Telescope)**: `<leader>ff` to find files, `<leader>fg` to search text within files.
- **Window Management**: `<leader>ñ` to open vertical splits, `<leader>p` for horizontal splits.
- **Terminal**: Open horizontal terminal with `<leader>th`, and vertical terminal with `<leader>tv`.
- **Exiting Insert Mode**: Press `jk` to quickly exit insert mode.

### **Plugins**
The configuration makes use of `lazy.nvim` for managing plugins, ensuring efficient and optimized loading. The plugin list is maintained in `lua/core/plugins.lua` and covers a wide range of functionalities:
- **LSP Support**: `nvim-lspconfig`, `mason.nvim`, `cmp-nvim-lsp`, etc., for autocompletion and language support.
- **Syntax Highlighting**: `nvim-treesitter` for better syntax awareness and code folding.
- **Git Integration**: `vim-fugitive` and `gitsigns.nvim` for handling Git operations within Neovim.
- **UI Enhancements**: 
  - `lualine.nvim` for a customized statusline.
  - `indent-blankline.nvim` for indentation guides.
  - `nvim-tree.lua` as a file explorer.
  - `toggleterm.nvim` for terminal integration.

The theme chosen is **Catppuccin**, providing a visually appealing color scheme throughout.

### **General Settings**
General settings related to editor behavior, indentation, appearance, and more can be found in `lua/core/settings.lua`. Notable settings include:
- **Relative Line Numbers**: Enabled to make navigation more intuitive.
- **Auto Indentation**: Ensures consistent indentation based on the current file settings.
- **Clipboard**: Configured to use the system clipboard for seamless copying/pasting.
- **Mouse Support**: Full mouse integration across all Neovim modes.
- **Folding**: Folding is based on `nvim-treesitter` for accurate code folding, with `foldlevelstart` set to 99 for unfolded code on start.

### **Session Management**
Sessions are handled via the `auto-session` plugin, which allows automatic saving and restoring of sessions. This enables users to pick up right where they left off.

---

## **Plugin Installation and Management**
This configuration uses `lazy.nvim` as the plugin manager. If `lazy.nvim` is not installed, it is automatically cloned and set up.

To add new plugins, modify the `plugins.lua` file and add your desired plugins in the `require("lazy").setup()` section. Once changes are made, run `:Lazy sync` to install or update plugins.

---

## **Theme and Aesthetics**
- **Color Scheme**: The project utilizes the **Catppuccin** color theme, which is applied across the UI including the statusline.
- **Indentation and Highlighting**: The configuration uses **nvim-treesitter** for syntax highlighting, and **indent-blankline.nvim** for clean indentation levels with color-coded guides.

---

## **Common Keybindings**
Here’s a list of frequently used keybindings:

| Key Combination | Action                               |
|-----------------|--------------------------------------|
| `<leader>ff`    | Find files using Telescope           |
| `<leader>fg`    | Search text within files             |
| `<leader>w`     | Save file                            |
| `<leader>q`     | Quit Neovim                          |
| `<leader>e`     | Toggle file explorer (NeoTree)       |
| `<leader>th`    | Open horizontal terminal             |
| `<leader>tv`    | Open vertical terminal               |
| `jk`            | Exit insert mode                     |
| `<C-h>`         | Move to left window                  |
| `<C-l>`         | Move to right window                 |
| `<C-k>`         | Move to upper window                 |
| `<C-j>`         | Move to lower window                 |
| `<TAB>`         | Switch to next buffer                |
| `<S-TAB>`       | Switch to previous buffer            |

---

## **Future Improvements**
- Adding more language-specific configurations for enhanced developer productivity.
- Expanding session management features to allow multiple session states.
- Customizing dashboard content for a more tailored startup experience.

