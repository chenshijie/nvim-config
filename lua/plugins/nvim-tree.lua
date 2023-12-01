return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      -- 完全禁止内置netrw
      disable_netrw = true,
      -- 不显示 git 状态图标
      git = {
        enable = false,
      },
      -- project plugin 需要这样设置
      update_cwd = true,
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
      sort = {
        sorter = "case_sensitive",
      },
      filters = {
        -- 隐藏 .文件
        dotfiles = true,
        -- 隐藏 .DS_Store 文件
        custom = { ".DS_Store" },
      },

      view = {
        -- 宽度
        width = 34,
        -- 也可以 'right'
        side = "left",
        -- 不显示行数
        number = false,
        relativenumber = false,
        -- 显示图标
        signcolumn = "yes",
      },
      renderer = {
        group_empty = true,
      },
      actions = {
        open_file = {
          -- 首次打开大小适配
          resize_window = true,
          -- 打开文件时关闭 tree
          quit_on_open = false,
        },
      },
      -- wsl install -g wsl-open
      -- https://github.com/4U6U57/wsl-open/
      system_open = {
        -- mac
        cmd = "open",
        -- windows
        -- cmd = "wsl-open",
      },
    }
  end,
}
