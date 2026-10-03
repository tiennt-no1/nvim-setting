require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
-- Gán Space + f + s để mở Document Symbols qua Telescope
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Telescope LSP symbols" })
-- Tìm kiếm Symbol trên TOÀN BỘ WORKSPACE
map(
  "n",
  "<leader>fS",
  "<cmd>Telescope lsp_workspace_symbols<CR>",
  { desc = "Telescope LSP workspace symbols" }
)
-- Gán phím tắt Space + g + g để mở Neogit
map("n", "<leader>gg", "<cmd>Neogit<CR>", { desc = "Mở giao diện Neogit (Git Control)" })
