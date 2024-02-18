return {
  "nvim-treesitter/nvim-treesitter",
  event = {
    "BufNewFile",
    "BufReadPre",
  },
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      auto_install = true,
      sync_install = true,
      ensure_installed = {
        "lua",
        "vim",
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    })
  end,
}
