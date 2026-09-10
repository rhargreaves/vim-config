return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    opts = {
      keymap = { preset = "default" },
      completion = { documentation = { auto_show = true } },
      sources = { default = { "lsp", "path", "snippets", "buffer" } },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
      "saghen/blink.cmp",
    },
    opts = {
      ensure_installed = { "lua_ls", "terraformls" },
    },
    config = function(_, opts)
      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { library = { vim.env.VIMRUNTIME } },
          },
        },
      })
      require("mason-lspconfig").setup(opts)
      vim.lsp.enable("clangd")
    end,
  },
}
