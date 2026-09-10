local formatters_by_ft = {
  c = { "clang_format" },
  cpp = { "clang_format" },
  javascript = { "prettierd", "prettier", stop_after_first = true },
  javascriptreact = { "prettierd", "prettier", stop_after_first = true },
  json = { "prettierd", "prettier", stop_after_first = true },
  lua = { "stylua" },
  terraform = { "terraform_fmt" },
  typescript = { "prettierd", "prettier", stop_after_first = true },
  typescriptreact = { "prettierd", "prettier", stop_after_first = true },
  yaml = { "prettierd", "prettier", stop_after_first = true },
}

return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = { "n", "v" },
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = formatters_by_ft,
    format_on_save = function(bufnr)
      if formatters_by_ft[vim.bo[bufnr].filetype] then
        return { timeout_ms = 1000, lsp_format = "fallback" }
      end
    end,
    notify_no_formatters = false,
  },
}
