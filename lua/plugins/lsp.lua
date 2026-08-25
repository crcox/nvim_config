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

    local r_cmd
    if vim.fn.has("win32") == 1 then
      r_cmd = "R.exe"
    else
      r_cmd = "R"
    end

    vim.lsp.config("r_language_server", {
      cmd = {
        r_cmd,
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
