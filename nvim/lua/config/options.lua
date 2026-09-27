vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

local opt = vim.opt
opt.number = true
opt.mouse = "a"
opt.report = 0
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.list = true
opt.listchars = {
  tab = "→ ",
  space = "·",
  nbsp = "␣",
  trail = "•",
  precedes = "«",
  extends = "»",
}
opt.termguicolors = true
opt.signcolumn = "yes"
opt.ignorecase = true
opt.smartcase = true
opt.splitbelow = true
opt.splitright = true
opt.undofile = true
opt.updatetime = 250
opt.timeoutlen = 300
opt.scrolloff = 4
opt.confirm = true
opt.clipboard = "unnamedplus"

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  callback = function()
    vim.schedule(function()
      vim.cmd("checktime")
    end)
  end,
  desc = "Reload files modified outside Neovim",
})

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlighting" })
vim.keymap.set("n", "<F12>", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic list" })

vim.api.nvim_create_user_command("S", function(opts)
  local directory = vim.fn.expand("%:p:h")
  if directory == "" then
    directory = vim.fn.getcwd()
  end

  vim.cmd("!cd " .. vim.fn.shellescape(directory) .. " && " .. opts.args)
end, {
  nargs = "+",
  complete = "shellcmd",
  desc = "Run a shell command in the current file's directory",
})
