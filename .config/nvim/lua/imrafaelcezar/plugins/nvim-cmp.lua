return {
  "hrsh7th/nvim-cmp",
  event = {
    "InsertEnter",
  },
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip", 
  },
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ["<c-k>"] = cmp.mapping.select_prev_item(),
        ["<c-j>"] = cmp.mapping.select_next_item(),
        ["<c-space>"] = cmp.mapping.complete(),
        ["<c-e>"] = cmp.mapping.abort(),
        ["<cr>"] = cmp.mapping.confirm({ select = false }),
      }),
      sources = cmp.config.sources({
        { name = "buffer" },
        { name = "path" },
        { name = "luasnip" },
        { name = "nvim_lsp" },
      }),
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
    })
  end,
}
