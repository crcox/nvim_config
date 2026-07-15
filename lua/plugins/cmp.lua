return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    --"L3MON4DE/LuaSnip",
    --"saadparwaiz1/cmp_luasnip",
    --"rafamadriz/friendly-snippets",
  },
  event = "InsertEnter",
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      formatting = {
        format = function(entry, vim_item)
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
          })[entry.source.name]
          return vim_item
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
      }),
      sorting = {
        priority_weight = 2,
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
      sources = {
        { name = "nvim_lsp" },
      },
    })
  end,
}
