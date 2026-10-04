require "nvchad.mappings"

local map = vim.keymap.set
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
-- Gán Space + f + s để mở Document Symbols qua Telescope
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Telescope LSP symbols" })
-- Tìm kiếm Symbol trên TOÀN BỘ WORKSPACE
map("n", "<leader>fS", "<cmd>Telescope lsp_workspace_symbols<CR>", { desc = "Telescope LSP workspace symbols" })
-- Gán phím tắt Space + g + g để mở Neogit
map("n", "<leader>gg", "<cmd>Neogit<CR>", { desc = "Mở giao diện Neogit (Git Control)" })
-- Nhấn ESC để thoát chế độ nhập liệu trong Terminal
map("t", "<leader>qt", [[<C-\><C-n>]], { desc = "Thoát chế độ nhập liệu Terminal" })
-- Chia màn hình dọc bằng Space + wv
map("n", "<leader>wv", "<cmd>vsplit<CR>", { desc = "Chia màn hình Dọc" })

-- Chia màn hình ngang bằng Space + ws
map("n", "<leader>ws", "<cmd>split<CR>", { desc = "Chia màn hình Ngang" })

-- Đóng ô màn hình hiện tại bằng Space + q
map("n", "<leader>wq", "<cmd>close<CR>", { desc = "Đóng ô màn hình hiện tại" })
-- Phóng to hết cỡ CHIỀU NGANG (Full Width) bằng Space + |
map("n", "<leader>|", "<C-w>|", { desc = "Max width current panel" })

-- Phóng to hết cỡ CHIỀU CAO (Full Height) bằng Space + _
map("n", "<leader>_", "<C-w>_", { desc = "Max height current panel" })

-- Chia đều lại tất cả các ô cửa sổ bằng Space + =
map("n", "<leader>=", "<C-w>=", { desc = "Equalize all panels" })

-- Phóng to cửa sổ hiện tại thành 1 Tab riêng (Full screen)
map("n", "<leader>z", "<cmd>tab split<CR>", { desc = "Zoom window into tab" })
-- Thu nhỏ lại (Thực chất là đóng tab đó đi để về layout cũ)
map("n", "<leader>Z", "<cmd>tabclose<CR>", { desc = "Close zoomed tab" })

-- Xem danh sách các project gần đây qua Telescope (Giống LazyVim <leader>fp)
map("n", "<leader>fp", "<cmd>Telescope projects<CR>", { desc = "Find recent projects" })

-- Khôi phục session của project hiện tại (Giống LazyVim <leader>qs)
map("n", "<leader>qs", function()
  require("persistence").load()
end, { desc = "Restore Session" })

-- Khôi phục session cuối cùng trước khi thoát (Giống LazyVim <leader>ql)
map("n", "<leader>ql", function()
  require("persistence").load { last = true }
end, { desc = "Restore Last Session" })

-- 1. Tìm kiếm & Thay thế TRÊN TOÀN PROJECT (Giống Ctrl+Shift+F trong VSCode)
map("n", "<leader>sp", '<cmd>lua require("spectre").open()<CR>', { desc = "Spectre: Open Project Search" })
map(
  "n",
  "<leader>sf",
  '<cmd>lua require("spectre").open_file_search()<CR>',
  { desc = "Spectre: Open Current File Search" }
)

map(
  "n",
  "<leader>sw",
  '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
  { desc = "Spectre: Search current word" }
)


-- Gán Ctrl + Shift + P (và Ctrl + P, do terminal không phân biệt) để mở Commands Palette
map({ "n", "i", "v" }, "<C-S-p>", "<cmd>Telescope commands<CR>", { desc = "Search Commands Palette" })
map("n", "<leader>sc", "<cmd>Telescope commands<CR>", { desc = "Search Commands" })


-- Tìm kiếm nhanh các Phím tắt (Keymaps) đang hoạt động
map("n", "<leader>sk", "<cmd>Telescope keymaps<CR>", { desc = "Search Keymaps" })
