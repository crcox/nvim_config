return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "python",
      "lua",
      "vimdoc",
      "yaml",
      "r",
      "markdown",
      "markdown_inline",
    },
    textobjects = {
      select = {
        enable = true,

        lookahead = true,

        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",

          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",

          ["ab"] = "@block.outer",
          ["ib"] = "@block.inner",
        },
      },
    },
    highlight = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter").setup(opts)
  end,
}
