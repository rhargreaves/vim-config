return {
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("duskfox")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "duskfox",
        globalstatus = true,
      },
      sections = {
        lualine_x = {
          function()
            return vim.bo.endofline and "" or "↵̸"
          end,
          "encoding",
          "fileformat",
          "filetype",
        },
      },
    },
  },
}
