return {

  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    require("luasnip.loaders.from_vscode").lazy_load()
    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
    snippet = {
      expand = function(args)
        luasnip.lsp_expland(args.body)
      end,
    },
    sources = cmp.config.sources({
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
    }),
      mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    ['<C-e>'] = cmp.mapping.abort(),
    

  },
  })
  end,
}
