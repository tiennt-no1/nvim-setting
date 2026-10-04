return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Plugin core bắt buộc
      "sindrets/diffview.nvim", -- Cực kỳ quan trọng để xem diff đẹp hơn
      "nvim-telescope/telescope.nvim", -- Tích hợp menu chọn branch/commit qua Telescope
    },
    config = function()
      require("neogit").setup {
        -- Giao diện mở full màn hình hoặc chia đôi
        kind = "tab",
        -- Sử dụng Telescope làm giao diện chọn (ví dụ khi chuyển nhánh)
        integrations = { telescope = true },
      }
    end,
    -- Chỉ tải plugin khi bạn gọi lệnh hoặc phím tắt để tối ưu tốc độ mở Neovim
    cmd = "Neogit",
  },
  -- Các plugin có sẵn của bạn...

  -- 1. Tự động lưu và khôi phục session (giống LazyVim)
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- chỉ load khi bắt đầu đọc file
    opts = { options = { "buffers", "curdir", "tabpages", "winsize" } },
    config = function(_, opts)
      require("persistence").setup(opts)
    end,
  },

  -- 2. Tự động chuyển thư mục gốc (root dir) khi mở dự án và tích hợp với Telescope
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    config = function()
      require("project_nvim").setup {
        -- Phát hiện thư mục dự án dựa trên các file/thư mục này
        detection_methods = { "lsp", "pattern" },
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
      }
      -- Tích hợp vào bộ tìm kiếm Telescope
      require("telescope").load_extension("projects")
    end,
  },
  -- Các plugin khác...

  {
    "nvim-pack/nvim-spectre",
    build = false,
    cmd = "Spectre",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("spectre").setup({
        open_cmd = "vnew", -- Mở giao diện ở thanh dọc bên cạnh giống VSCode Sidebar
        live_update = true, -- Xem kết quả thay đổi ngay khi gõ (Real-time)
        line_sep_start = '┌-----------------------------------------',
        result_padding = '│  ',
        line_sep       = '└-----------------------------------------',
      })
    end,
  },



  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
