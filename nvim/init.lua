-- vim bindings
vim.g.mapleader = " "

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Plugins list
local plugins = {
  "folke/tokyonight.nvim", -- colorscheme
  { 
    "nvim-telescope/telescope.nvim", 
    tag = "v0.2.0", 
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" }
}

local opts = {}

-- Setup lazy.nvim
require("lazy").setup(plugins, opts)

-- Treesitter configuration
local treesitter = require("nvim-treesitter.configs")
treesitter.setup({
  ensure_installed = { "c", "lua", "rust", "javascript", "typescript" },  -- Specify languages to install, can change to "all" if you want more
  highlight = { enable = true },
  indent = { enable = true }
})

-- Colorscheme setup
vim.cmd('colorscheme tokyonight')

-- Telescope keymaps
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", telescope.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", telescope.help_tags, { desc = "Telescope help tags" })

-- You can add more keymaps here as needed

