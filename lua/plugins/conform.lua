return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        r = { "styler" },
        python = { "ruff_fix", "ruff_format", },
      },
      format_on_save = {
        timeout_ms = 10000,
        lsp_fallback = true,
      },
    },
  },
}
