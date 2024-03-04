local plugins = {
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end
  },
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter'
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },
  {
    "mistricky/codesnap.nvim",
    build = "make",
    lazy = true,
    cmd = { "CodeSnap", "CodeSnapPreviewOn" },
    config = function(_, opts)
      require("codesnap").setup(opts)
    end
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require('rust-tools').setup(opts)
    end
  },
  { "folke/neodev.nvim", opts = {} },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require('custom.configs.dap')
      require('core.utils').load_mappings('dap')
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require('custom.configs.dapui')
    end
  },
  {
    "mxsdev/nvim-dap-vscode-js",
    dependencies = "mfussenegger/nvim-dap",
    run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "rust-analyzer",
        "prettierd",
        "stylua",
        "eslint-lsp",
        "typescript-language-server",
        "tailwindcss-language-server",
        "css-lsp",
        "prisma-language-server",
        "cssmodules-language-server",
        "graphql-language-service-cli",
        "js-debug-adapter",
        "php-debug-adapter",
        "pretty-php",
        "phpactor",
        "php-cs-fixer",
        "phpstan",
        "protolint"

      }
    }
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javasciptreact",
      "typescript",
      "php",
      "html",
      "typescriptreact"
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      local opts = require "plugins.configs.treesitter"

      opts.ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "rust",
        "go",
        "cpp",
        "css",
        "html",
        "c",
        "json",
        "zig",
        "prisma"
      }

      return opts
    end
  }
}
return plugins
