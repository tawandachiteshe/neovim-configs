local plugins = {
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()
    end,
  },
  { "nvim-neotest/nvim-nio" },
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require('core.utils').load_mappings('codeium')
    end
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
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require('ts_context_commentstring').setup({
        enable_autocmd = false
      })
    end
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
  { "folke/neodev.nvim",    opts = {} },
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
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      require('custom.configs.dapui')
    end
  },
  {
    "mxsdev/nvim-dap-vscode-js",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "gopls",
        "rust-analyzer",
        "prettierd",
        "stylua",
        "eslint-lsp",
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
        "protolint",
        "asm-lsp",

      }
    }
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javasciptreact",
      "typescript",
      "php",
      "html",
      "tsx",
      "typescriptreact"
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesitter-context").setup(
        {
          enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)
          max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.
          min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
          line_numbers = true,
          multiline_threshold = 20, -- Maximum number of lines to show for a single context
          trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
          mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'
          -- Separator between context and content. Should be a single character string, like '-'.
          -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
          separator = nil,
          zindex = 20,     -- The Z-index of the context window
          on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
        }
      )
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
        "tsx",
        "c",
        "json",
        "zig",
        "prisma",
        "nasm"
      }

      return opts
    end
  }
}
return plugins
