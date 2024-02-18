return {
  "neovim/nvim-lspconfig",
  event = {
    "BufNewFile",
    "BufReadPre",
  },
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local options = {
      noremap = true,
      silent = true,
    }

    local on_attach = function(_, bufnr)
      options.buffer = bufnr
      
      vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, options)
      vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, options)
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, options)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, options)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, options)
    end

    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })
  end,
}
