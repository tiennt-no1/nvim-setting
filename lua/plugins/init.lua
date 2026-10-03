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
