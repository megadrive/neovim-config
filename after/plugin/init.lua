
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

require('lualine').setup {
  options = {
    theme = 'gruvbox-baby'
  }
}

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

-- autopairs
require("nvim-autopairs").setup()

-- nvim-cmp setup
local cmp = require("cmp")

local lsp_servers = {
  powershell_es,
  rust_analyzer,
  tailwindcss,
  tsserver
}

cmp.setup({
  snippet = {
    expand = function(args)
      require('snippy').expand_snippet(args.body) 
    end
  },
  window = {},
  mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'snippy' }
  },
  {
    { name = buffer },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
for _, lsp in ipairs(lsp_servers) do
  require('lspconfig')[lsp].setup {
    capabilities = capabilities
  }
end