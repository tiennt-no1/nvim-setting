require "nvchad.mappings"
-- Mở giao diện GrugFar ở chế độ bình thường (Normal Mode)
local map = vim.keymap.set
map("n", "<leader>sf", function()
  require("grug-far").open()
end, { desc = "GrugFar: Mở trình tìm kiếm và thay thế" })

map("n", "<leader>sw", function()
  require("grug-far").open { prefills = { search = vim.fn.expand "<cword>" } }
end, { desc = "GrugFar: Tìm từ dưới con trỏ" })

-- Mở GrugFar với đoạn VĂN BẢN đang được bôi đen (Visual Mode)
map("v", "<leader>sf", function()
  require("grug-far").with_visual_selection()
end, { desc = "GrugFar: Tìm đoạn văn bản được chọn" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
-- Gán Space + f + s để mở Document Symbols qua Telescope
-- map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Telescope LSP symbols" })
-- Tìm kiếm Symbol trên TOÀN BỘ WORKSPACE
-- map("n", "<leader>fS", "<cmd>Telescope lsp_workspace_symbols<CR>", { desc = "Telescope LSP workspace symbols" })
-- Gán phím tắt Space + g + g để mở Neogit
map("n", "<leader>gg", "<cmd>Neogit<CR>", { desc = "Mở giao diện Neogit (Git Control)" })
-- Nhấn ESC để thoát chế độ nhập liệu trong Terminal
map("t", "<leader>qt", [[<C-\><C-n>]], { desc = "Thoát chế độ nhập liệu Terminal" })
-- Chia màn hình dọc bằng Space + wv
map("n", "<leader>wv", "<cmd>vsplit<CR>", { desc = "Chia màn hình Dọc" })

-- Chia màn hình ngang bằng Space + ws
map("n", "<leader>s", "<cmd>split<CR>", { desc = "Chia màn hình Ngang" })

-- Đóng ô màn hình hiện tại bằng Space + q
map("n", "<leader>x", "<cmd>close<CR>", { desc = "Đóng ô màn hình hiện tại" })
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

-- Gán Ctrl + Shift + P (và Ctrl + P, do terminal không phân biệt) để mở Commands Palette
map({ "n", "i", "v" }, "<C-S-p>", "<cmd>Telescope cmdline<CR>", { desc = "Search Commands Palette" })
map("n", "<leader>fc", "<cmd>Telescope cmdline<CR>", { desc = "Search Commands" })

-- Tìm kiếm nhanh các Phím tắt (Keymaps) đang hoạt động
map("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "Search Keymaps" })

map("n", "<leader>gb", function()
  require("gitsigns").toggle_current_line_blame()
end, { desc = "Git: Bật/Tắt Git Blame dòng hiện tại" })

-- ==========================================================================
-- CẤU HÌNH PHÍM TẮT COC.NVIM VỚI VIM.KEYMAP.SET
-- ==========================================================================

-- 1. Các hàm phụ trợ cho Phím Tab và phím K
local function check_backspace()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s" ~= nil
end

local function show_documentation()
  if vim.fn.CocAction("hasProvider", "hover") == 1 then
    vim.fn.CocActionAsync "doHover"
  else
    vim.fn.feedkeys("K", "in")
  end
end

-- 2. Định nghĩa phím tắt sử dụng local map
local expr_opts = { silent = true, expr = true, replace_keycodes = false }

-- --- Chế độ Insert (Auto-complete) ---
-- Dùng Tab / Shift-Tab để điều hướng danh sách gợi ý
map("i", "<TAB>", function()
  if vim.fn["coc#pum#visible"]() == 1 then
    return vim.fn["coc#pum#next"](1)
  elseif check_backspace() then
    return "<Tab>"
  else
    return vim.fn["coc#refresh"]()
  end
end, expr_opts)

map("i", "<S-TAB>", function()
  if vim.fn["coc#pum#visible"]() == 1 then
    return vim.fn["coc#pum#prev"](1)
  else
    return "<C-h>"
  end
end, expr_opts)

-- Nhấn Enter để chọn từ đang chọn
map("i", "<CR>", function()
  if vim.fn["coc#pum#visible"]() == 1 then
    return vim.fn["coc#pum#confirm"]()
  else
    return "<C-g>u<CR><c-r>=coc#on_enter()<CR>"
  end
end, expr_opts)

-- --- Chế độ Normal (Điều hướng & Sửa lỗi) ---
-- Định nghĩa vị trí Code (Go to Definition, References...)
map("n", "gd", "<Plug>(coc-definition)", { silent = true })
map("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
map("n", "gi", "<Plug>(coc-implementation)", { silent = true })
map("n", "gr", "<Plug>(coc-references)", { silent = true })

-- Xem tài liệu giải thích hàm (Hover)
map("n", "K", show_documentation, { silent = true })

-- Đổi tên biến/hàm trên toàn dự án (Rename)
map("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })

-- Sửa lỗi nhanh tại vị trí con trỏ (Quick Fix / Code Action)
map("n", "<leader>ac", "<Plug>(coc-codeaction-cursor)", { silent = true })
map("n", "<leader>qf", "<Plug>(coc-fix-current)", { silent = true })

-- Di chuyển qua lại giữa các lỗi (Diagnostics)
map("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
map("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })
map("n", "<leader>fs", ":<C-u>CocList outline<CR>", { silent = true })

-- <leader>sp : Tìm hàm/biến trên TOÀN BỘ DỰ ÁN (Workspace Symbols)
map("n", "<leader>fS", ":<C-u>CocList -I symbols<CR>", { silent = true })
--- Tìm kiếm File trong dự án ---
-- <leader><space> : Tìm kiếm file nhanh (tương tự như Telescope find_files hoặc CtrlP)
map("n", "<leader><space>", ":<C-u>CocList files<CR>", { silent = true })

-- [<leader>tt] : Ẩn / Hiện Terminal hiện tại (Toggle)
map("n", "<leader>tt", ":CocCommand terminal.Toggle<CR>", { silent = true })
map("t", "<leader>tt", "<C-\\><C-n>:CocCommand terminal.Toggle<CR>", { silent = true })

-- [<leader>tn] : Tạo một Terminal MỚI hoàn toàn (Terminal New)
map("n", "<leader>tn", ":CocCommand terminal.Create<CR>", { silent = true })
map("t", "<leader>tn", "<C-\\><C-n>:CocCommand terminal.Create<CR>", { silent = true })

-- Cửa sổ quản lý danh sách: Xem và chọn Terminal đang chạy
map("n", "<leader>tl", ":CocList terminals<CR>", {silent = true })
