return {
  'stevearc/oil.nvim',
  opts = {},
  config = function ()
    require("oil").setup()
    vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>")
  end,
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
