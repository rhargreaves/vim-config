return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "FzfLua",
  keys = {
    { "<C-p>", "<cmd>FzfLua files<CR>", desc = "Find files" },
    { "<leader>p", "<cmd>FzfLua files<CR>", desc = "Find files" },
    { "<leader>g", "<cmd>FzfLua live_grep<CR>", desc = "Search project" },
    { "<leader>b", "<cmd>FzfLua buffers<CR>", desc = "Find buffers" },
    { "<leader>h", "<cmd>FzfLua helptags<CR>", desc = "Find help" },
  },
  opts = {
    files = {
      hidden = true,
      rg_opts = '--color=never --files --hidden -g "!.git" -g "!node_modules" -g "!target" -g "!dist"',
    },
    grep = {
      hidden = true,
      rg_glob = true,
      rg_opts = '--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -g "!.git" -e',
    },
  },
}
