return {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()

    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    vim.lsp.config("pyright", {
      capabilities = capabilities,
      settings = {
        python = {
          analysis = {
            diagnosticMode = "workspace",
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
          },
          venvPath = ".",
        }
      }
    })

    vim.lsp.config("r_language_server", {
      cmd = {
        "C:/Program Files/R/R-4.5.1/bin/x64/R.exe",
        "--no-echo",
        "-e",
        "languageserver::run()",
      },
      filetypes = {
        "r",
        "rmd",
        "quarto",
      },
      capabilities = capabilities,
      settings = {
        r = {
          lsp = {
            diagnostics = true,
            rich_documentation = false,
          },
        },
      },
    })
    vim.lsp.enable("pyright")
    vim.lsp.enable("r_language_server")
  end,
}
