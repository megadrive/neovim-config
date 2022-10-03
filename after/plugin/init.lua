
-- colors!
-- vim.cmd[[colorscheme tokyonight-night]]
-- vim.g.catppuccin_flavour = "mocha"
-- require("catppuccin").setup {}
-- vim.cmd[[colorscheme catppuccin]]
vim.g.gruvbox_baby_background_color = "dark"
vim.g.gruvbox_baby_transparent_mode = false
vim.g.gruvbox_baby_telescope_theme = true
vim.cmd[[colorscheme gruvbox-baby]]

require('Telescope').setup {}

require('lualine').setup {}

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- treesitter
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "lua", "typescript" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

-- null-ls
require("null-ls").setup({
  sources = {
    require("null-ls").builtins.formatting.stylua,
    require("null-ls").builtins.diagnostics.eslint,
    require("null-ls").builtins.completion.spell,
  },
})

-- Mason
require("mason").setup()
require("mason-lspconfig").setup()

-- Nvim-Tree
require("nvim-tree").setup()
