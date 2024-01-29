return {
  "neovim/nvim-lspconfig",
  event = {
    "BufNewFile",
    "BufReadPre",
  },
  dependencies = "hrsh7th/cmp-nvim-lsp",
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local opts = {
      noremap = true,
      silent = true,
    }

    local on_attach = function(_, bufnr)
      opts.buffer = bufnr

      vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()

    local languages = {
        "cssls",
        "emmet_ls",
        "gopls",
        "html",
        "lua_ls",
        "rust_analyzer",
        "tsserver",
    }

    for _, language in ipairs(languages) do
      local language_options = {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      if language == "lua_ls" then
        language_options.settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        }
      end

      lspconfig[language].setup(language_options)
    end
  end,
}
