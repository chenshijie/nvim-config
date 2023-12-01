return {
  {
    "neovim/nvim-lspconfig",
  },
  {
    "williamboman/mason.nvim",
  },
  {
    "williamboman/mason-lspconfig.nvim",
  },
  {
    "williamboman/nvim-lsp-installer",
    config = function()
      require("nvim-lsp-installer").setup({
        automatic_installation = true,
      })
    end,
  },
  {
    "jose-elias-alvarez/nvim-lsp-ts-utils",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
  },
  -- 补全引擎
  {
      "hrsh7th/nvim-cmp",
  },
  -- Snippet 引擎
  {
      "hrsh7th/vim-vsnip",
  },
  -- 补全源
  {
    "hrsh7th/cmp-vsnip",
    "hrsh7th/cmp-nvim-lsp", -- { name = nvim_lsp }
    "hrsh7th/cmp-buffer", -- { name = 'buffer' },
    "hrsh7th/cmp-path", -- { name = 'path' }
    "hrsh7th/cmp-cmdline", -- { name = 'cmdline' }
    "hrsh7th/cmp-nvim-lsp-signature-help", -- { name = 'nvim_lsp_signature_help' }
  },

  -- 常见编程语言代码段
  {
    "rafamadriz/friendly-snippets",
  },
  -- UI 增强
  "onsails/lspkind-nvim",
  "tami5/lspsaga.nvim",
  -- Lua 增强
  "folke/neodev.nvim",
  -- JSON 增强
  "b0o/schemastore.nvim",
  -- Rust 增强
  "simrat39/rust-tools.nvim",
  -- Python 增强
  "mfussenegger/nvim-dap-python",
  "mfussenegger/nvim-dap",
}
