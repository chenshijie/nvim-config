# 在Mac中安装和配置NeoVim

## 安装NeoVim

```
brew install neovim
```
安装后查看版本信息
```
 ~  nvim --version
NVIM v0.9.4
Build type: Release
LuaJIT 2.1.1700008891

     系统 vimrc 文件: "$VIM/sysinit.vim"
         $VIM 预设值: "/opt/homebrew/Cellar/neovim/0.9.4/share/nvim"

Run :checkhealth for more info
```

## ## 配置
### 配置入口文件
`Neovim`的配置入口文件并不是像vim一样放在用户目录的`.vimrc`中的，而是在`~/.config/nvim/init.lua`或`init.vim`

### 配置结构
虽然可以把所有配置写在一个文件里，但由于后续要配置很多东西，所以预先的规划是很有必要的，因为配置可能随时调整，需要随时打开、关闭某个功能的时候，尽量不要影响到其他功能。

整体结构：

```bash
.
├── init.lua
├── lazy-lock.json
└── lua
    ├── basic.lua
    ├── keybindings.lua
    ├── lsp
    │   ├── cmp.lua
    │   ├── config
    │   │   ├── bash.lua
    │   │   ├── css.lua
    │   │   ├── html.lua
    │   │   ├── json.lua
    │   │   ├── lua.lua
    │   │   ├── markdown.lua
    │   │   ├── pyright.lua
    │   │   ├── rust.lua
    │   │   └── ts.lua
    │   ├── formatter.lua
    │   ├── init.lua
    │   ├── null-ls.lua
    │   └── ui.lua
    ├── pluginmanager.lua
    └── plugins
        ├── alpla.lua
        ├── bufferline.lua
        ├── code-format.lua
        ├── colorscheme.lua
        ├── core.lua
        ├── gitsigns.lua
        ├── indent-blankline.lua
        ├── lsp.lua
        ├── lualine.lua
        ├── noice.lua
        ├── nvim-tree.lua
        ├── persistence.lua
        ├── treesitter.lua
        └── wtf.lua
```

- basic.lua： 基础配置，是对默认配置的一个重置。
- colorscheme.lua： 我们安装的主题皮肤配置，在这里切换主题。
- keybindings.lua： 快捷键的设置，所有插件的快捷键也都会放在这里。
- pluginmanager.lua： 插件安装管理。
- lsp 文件夹：
    是对 Neovim 内置 LSP 功能的配置，包括常见编程语言与语法提示等。
    - config ： 文件夹包含各种语言服务器单独的配置文件。
    - init.lua ： 内置 LSP 的配置。
    - cmp.lua ： 语法自动补全补全的配置，包括各种补全源，与自定义代码段。
    - ui.lua： 对内置 LSP 功能增强和 UI 美化。
    - formatter.lua： 独立代码格式化功能。
- plugins 文件夹： 是对第三方插件的配置，每每个插件一个配置文件,也可以多个插件一个配置文件

### 基础配置
~/.config/nvim/lua/basic.lua

## 常用插件配置

### 1.alpla.lua
~/.config/nvim/lua/plugins/alpla.lua

### 2.colorscheme.lua
~/.config/nvim/lua/plugins/alpla.lua

### 3.nvim-treesitter
~/.config/nvim/lua/plugins/treesitter.lua

### 4.nvim-tree
~/.config/nvim/lua/plugins/vim-tree.lua

### 5.noice.lua
~/.config/nvim/lua/plugins/noice.lua

### 6.lualine
~/.config/nvim/lua/plugins/lualine.lua

## LSP
在lua/plugins/lsp.lua中添加相关插件
在lua/lsp/init.lua中配置自动lsp server
在lua/lsp/config/*.lua中配置歌语言的lsp配置
在lus/keybindings.lua中添加快捷键配置

```lua
-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
  -- rename
  mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  -- code action
  mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  -- go xx
  mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  -- diagnostic
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
  -- 没用到
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

```

```lua
    -- 绑定快捷键
    require("keybindings").mapLSP(buf_set_keymap)
    client.resolved_capabilities.document_formatting·=·false
    client.resolved_capabilities.document_range_formatting = false
```
以上两行代码要放到绑定快捷键之后,否则绑定快捷键不生效

