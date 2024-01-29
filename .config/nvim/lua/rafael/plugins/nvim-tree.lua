return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        width = 45,
      },
      renderer = {
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = false,
            git = true
          },
        },
        indent_markers = {
          enable = true,
        },
      },
      git = {
        ignore = false,
      },
    })

    vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")
  end,
}
