-- ===============================
-- Auto install packer if not present
-- ===============================
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
fn.system({'git', 'clone', '--depth', '1', '[https://github.com/wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim)', install_path})
vim.cmd [[packadd packer.nvim]]
end

-- ===============================
-- Plugins
-- ===============================
require('packer').startup(function(use)
use 'wbthomason/packer.nvim'

-- File explorer + icons
use 'nvim-tree/nvim-tree.lua'
use 'nvim-tree/nvim-web-devicons'

-- Theme
use 'folke/tokyonight.nvim'

-- Treesitter
use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

-- LSP + Mason
use 'williamboman/mason.nvim'
use 'williamboman/mason-lspconfig.nvim'
use 'neovim/nvim-lspconfig'

-- Autocomplete
use 'hrsh7th/nvim-cmp'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'L3MON4D3/LuaSnip'

-- Statusline
use 'nvim-lualine/lualine.nvim'

-- Telescope
use 'nvim-telescope/telescope.nvim'
use 'nvim-lua/plenary.nvim'
end)

-- ===============================
-- Basic Settings
-- ===============================
vim.o.termguicolors = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.updatetime = 300

-- ===============================
-- Theme
-- ===============================
vim.cmd [[colorscheme tokyonight]]

-- ===============================
-- Nvim-tree
-- ===============================
require("nvim-tree").setup()
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- ===============================
-- Treesitter
-- ===============================
require('nvim-treesitter.configs').setup {
ensure_installed = { "python", "c", "rust", "lua", "bash", "json", "yaml" },
highlight = { enable = true },
indent = { enable = true },
}

-- ===============================
-- Mason + LSP
-- ===============================
-- ===============================
-- Mason + LSP (new API, warning-free)
-- ===============================
require("mason").setup()
require("mason-lspconfig").setup({
ensure_installed = { "pyright", "clangd" },
})

-- Python
vim.lsp.start({
name = "pyright",
cmd = { "pyright-langserver", "--stdio" },
filetypes = { "python" },
root_dir = vim.fs.dirname(vim.fs.find({ "pyproject.toml", "setup.py", ".git" }, { upward = true })[1] or vim.loop.cwd()),
})

-- Rust (auto-detect workspace, warning-free) (removed for now)


-- C/C++
vim.lsp.start({
name = "clangd",
cmd = { "clangd" },
filetypes = { "c", "cpp", "objc", "objcpp" },
root_dir = vim.fs.dirname(vim.fs.find({ "compile_commands.json", ".git" }, { upward = true })[1] or vim.loop.cwd()),
})


-- ===============================
-- Autocomplete (nvim-cmp + LuaSnip)
-- ===============================
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
snippet = {
expand = function(args)
luasnip.lsp_expand(args.body)
end,
},
mapping = cmp.mapping.preset.insert({
['<C-b>'] = cmp.mapping.scroll_docs(-4),
['<C-f>'] = cmp.mapping.scroll_docs(4),
['<C-Space>'] = cmp.mapping.complete(),
['<C-e>'] = cmp.mapping.abort(),
['<CR>'] = cmp.mapping.confirm({ select = true }),
}),
sources = cmp.config.sources({
{ name = 'nvim_lsp' },
{ name = 'buffer' },
})
})

-- ===============================
-- Lualine
-- ===============================
require('lualine').setup {
options = { theme = 'tokyonight', section_separators = '', component_separators = '' }
}

-- ===============================
-- Telescope
-- ===============================
local telescope = require("telescope")
telescope.setup{}
vim.keymap.set('n', '<Leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })

