return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    config = function()
      local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
      ft_to_parser.mdx = "markdown"
      --vim.treesitter.language.register('mdx', 'markdown')
      require("nvim-treesitter.configs").setup({
        -- one of "all"
        -- 安装 language parser
        -- :TSInstallInfo 命令查看支持的语言
        -- ensure_installed = "maintained",
        ensure_installed = {
          "javascript",
          "css",
          "scss",
          "typescript",
          "tsx",
          "json",
          "vue",
          "python",
          "html",
          "lua",
          "svelte",
          "vim",
--          "help",
          "astro",
          "markdown",
          "markdown_inline",
          "bash",
          "fish",
          "prisma",
          "java",
          "go",
          "rust",
          "php",
        },
        sync_install = true,
        ignore_install = { "php", "phpdoc" },
        -- 启用代码高亮模块
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = true,
        },
        -- 启用增量选择模块
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            node_decremental = "<BS>",
            scope_incremental = "<TAB>",
          },
        },
        -- 启用代码缩进模块 (=)
        -- 用 = 格式化代码
        indent = {
          enable = true,
        },
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
        -- p00f/nvim-ts-rainbow
        rainbow = {
          enable = true,
          -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
          extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
          max_file_lines = nil, -- Do not enable for files with more than n lines, int
          -- colors = {}, -- table of hex strings
          colors = {
            "#95ca60",
            "#ee6985",
            "#D6A760",
            "#7794f4",
            "#b38bf5",
            "#7cc7fe",
          }, -- table of hex strings
          -- termcolors = {} -- table of colour name strings
        },
      })
      -- 开启 Folding 模块
      -- zc， zo 会 折叠 {} 里的内容
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
      -- 默认不要折叠
      -- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
      vim.opt.foldlevel = 99
    end,
  },
}
