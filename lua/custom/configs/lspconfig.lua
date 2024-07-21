local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities
local util = require "lspconfig/util"

local lspconfig = require("lspconfig")

local servers = { "tsserver", "gopls", "tailwindcss", "eslint", "clangd", "cssls", "cssmodules_ls", "prismals",
  "graphql", "phpactor", "asm_lsp" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities
  }
end
