return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = "Neotree",
  keys = {
    { "<F2>", "<cmd>Neotree toggle<CR>", desc = "Toggle file tree" },
    { "<leader>e", "<cmd>Neotree reveal<CR>", desc = "Reveal file in tree" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    filesystem = {
      use_libuv_file_watcher = true,
      follow_current_file = {
        enabled = true,
      },
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = true,
      },
    },
  },
}
