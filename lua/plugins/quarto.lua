return {
    {
      "quarto-dev/quarto-nvim",
      ft = { "quarto" },
      dependencies = {
        "jmbuhr/otter.nvim",
        "nvim-treesitter/nvim-treesitter",
      },
      opts = {
        lspFeatures = {
          enabled = true,
          chunks = "curly",
          languages = { "r", "python" },
        },
        codeRunner = {
          enabled = true,
          default_method = "iron", -- "molten", "slime", "iron" or <function>
          ft_runners = {}, -- filetype to runner, ie. `{ python = "molten" }`.
          -- Takes precedence over `default_method`
          never_run = { 'yaml' }, -- filetypes which are never sent to a code runner
        },
      },
    }
}

