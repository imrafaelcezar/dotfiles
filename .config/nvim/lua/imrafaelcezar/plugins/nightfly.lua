return {
  "bluz71/vim-nightfly-guicolors",
  config = function()
    vim.g.nightflyTransparent = true
    vim.cmd([[colorscheme nightfly]])
  end,
}
