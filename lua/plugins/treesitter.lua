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
    highlight = { enable = true },
  }
}
