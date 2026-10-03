require "nvchad.mappings"

-- add yours here

-- local map = vim.keymap.set

vim.keymap.set("n", ";", ":", { desc = "CMD enter command mode" })
vim.keymap.set("i", "jk", "<ESC>")
-- Gán Space + f + s để mở Document Symbols qua Telescope
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Telescope LSP symbols" })
-- Tìm kiếm Symbol trên TOÀN BỘ WORKSPACE
vim.keymap.set(
  "n",
  "<leader>fS",
  "<cmd>Telescope lsp_workspace_symbols<CR>",
  { desc = "Telescope LSP workspace symbols" }
)
-- Gán phím tắt Space + g + g để mở Neogit
vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<CR>", { desc = "Mở giao diện Neogit (Git Control)" })
-- Nhấn ESC để thoát chế độ nhập liệu trong Terminal
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Thoát chế độ nhập liệu Terminal" })
-- Chia màn hình dọc bằng Space + v
vim.keymap.set("n", "<leader>v", "<cmd>vsplit<CR>", { desc = "Chia màn hình Dọc" })

-- Chia màn hình ngang bằng Space + s
vim.keymap.set("n", "<leader>s", "<cmd>split<CR>", { desc = "Chia màn hình Ngang" })

-- Đóng ô màn hình hiện tại bằng Space + q
vim.keymap.set("n", "<leader>q", "<cmd>close<CR>", { desc = "Đóng ô màn hình hiện tại" })
-- Phóng to hết cỡ CHIỀU NGANG (Full Width) bằng Space + |
vim.keymap.set("n", "<leader>|", "<C-w>|", { desc = "Max width current panel" })

-- Phóng to hết cỡ CHIỀU CAO (Full Height) bằng Space + _
vim.keymap.set("n", "<leader>_", "<C-w>_", { desc = "Max height current panel" })

-- Chia đều lại tất cả các ô cửa sổ bằng Space + =
vim.keymap.set("n", "<leader>=", "<C-w>=", { desc = "Equalize all panels" })

-- Phóng to cửa sổ hiện tại thành 1 Tab riêng (Full screen)
vim.keymap.set("n", "<leader>z", "<cmd>tab split<CR>", { desc = "Zoom window into tab" })
-- Thu nhỏ lại (Thực chất là đóng tab đó đi để về layout cũ)
vim.keymap.set("n", "<leader>Z", "<cmd>tabclose<CR>", { desc = "Close zoomed tab" })
