return {
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
      require("telescope").load_extension "projects"
    end,
  },
  -- Các plugin khác...
 {
    'MagicDuck/grug-far.nvim',
    -- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
    -- additional lazy config to defer loading is not really needed...
    config = function()
      -- optional setup call to override plugin options
      -- alternatively you can set options with vim.g.grug_far = { ... }
      require('grug-far').setup({
        -- options, see Configuration section below
        -- there are no required options atm
      });
    end
  },
  {
    "prochri/telescope-all-recent.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "kkharji/sqlite.lua",
      "jonarrien/telescope-cmdline.nvim",

      -- optional, if using telescope for vim.ui.select
      "stevearc/dressing.nvim",
    },
    opts = {
      -- your config goes here
    },
  },
  -- Gỡ bỏ các plugin LSP/Cmp mặc định của NvChad
  { "williamboman/mason.nvim", enabled = false },
  { "neovim/nvim-lspconfig", enabled = false },
  { "hrsh7th/nvim-cmp", enabled = false },
  { "L3MON4D3/LuaSnip", enabled = false },
  { "hrsh7th/cmp-nvim-lsp", enabled = false },
  -- { "windwp/nvim-autopairs", enabled = false },


  -- Cài đặt CoC.nvim thay the
  {
    "neoclide/coc.nvim",
    branch = "release",
    lazy = false, -- CoC cần chạy ngay khi khởi động
  },
 }
