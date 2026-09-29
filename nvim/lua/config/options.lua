vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt
opt.number = true
opt.mouse = "a"
opt.report = 0
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
vim.api.nvim_create_autocmd("FileType", {
  pattern = "salt",
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})
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
opt.updatetime = 750
opt.timeoutlen = 300
opt.scrolloff = 4
opt.confirm = true
opt.clipboard = "unnamedplus"

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  callback = function()
    vim.schedule(function()
      vim.cmd("checktime")
    end)
  end,
  desc = "Reload files modified outside Neovim",
})

vim.fn.timer_start(2000, function()
  local bufnr = vim.api.nvim_get_current_buf()
  if vim.bo[bufnr].buftype == "" and not vim.bo[bufnr].modified and vim.api.nvim_buf_get_name(bufnr) ~= "" then
    vim.cmd("checktime " .. bufnr)
  end
end, { ["repeat"] = -1 })

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false, scope = "cursor" })
  end,
  desc = "Show diagnostics under the cursor",
})

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlighting" })
vim.keymap.set("n", "<F12>", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename symbol" })
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
