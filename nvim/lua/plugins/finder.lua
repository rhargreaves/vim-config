return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "FzfLua",
  keys = {
    { "<C-p>", "<cmd>FzfLua files<CR>", desc = "Find files" },
    { "<leader>ff", "<cmd>FzfLua files<CR>", desc = "Find files" },
    { "<leader>fg", "<cmd>FzfLua live_grep<CR>", desc = "Search project" },
    { "<leader>fb", "<cmd>FzfLua buffers<CR>", desc = "Find buffers" },
    { "<leader>fh", "<cmd>FzfLua helptags<CR>", desc = "Find help" },
  },
  opts = {
    files = {
      hidden = true,
      rg_opts = '--color=never --files --hidden -g "!.git" -g "!node_modules" -g "!target" -g "!dist"',
    },
    grep = {
      hidden = true,
      rg_glob = true,
    },
  },
}
