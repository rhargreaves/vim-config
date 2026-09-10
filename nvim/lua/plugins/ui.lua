return {
  {
    "arcticicestudio/nord-vim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("nord")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "nord",
        globalstatus = true,
      },
    },
  },
}
