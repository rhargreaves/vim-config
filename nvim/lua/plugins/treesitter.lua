local parsers = {
  "bash",
  "c",
  "cpp",
  "go",
  "gomod",
  "gosum",
  "hcl",
  "html",
  "javascript",
  "json",
  "lua",
  "markdown",
  "markdown_inline",
  "python",
  "query",
  "rust",
  "terraform",
  "toml",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "yaml",
}

local filetypes = {
  "bash",
  "sh",
  "c",
  "cpp",
  "go",
  "gomod",
  "hcl",
  "html",
  "javascript",
  "javascriptreact",
  "json",
  "lua",
  "markdown",
  "python",
  "rust",
  "terraform",
  "toml",
  "typescript",
  "typescriptreact",
  "vim",
  "yaml",
}

return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install(parsers)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = filetypes,
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
