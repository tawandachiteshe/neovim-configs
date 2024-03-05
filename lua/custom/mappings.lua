local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Run or continue the debugger"
    }
  },
}

M.codeium = {
  plugin = true,
  n = {
    ["<leader>ac"] = {
      function()
        return vim.fn['codeium#Accept']()
      end,
      "Accept codeium suggestion"
    }
  }
}

return M
