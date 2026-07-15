return {
  "mfussenegger/nvim-lint",
  config = function()
    local lint = require("lint")

    lint.linters.lintr = {
      cmd = "Rscript",
      stdin = false,
      args = {
        "-e",
        [[
        lintr::lint(commandArgs(TRUE)) |>
          unclass() |>
          jsonlite::toJSON(auto_unbox = TRUE)
        ]],
      },
      stream = "stdout",
      ignore_exitcode = true,
      parser = function(output)
        local ok, decoded = pcall(vim.json.decode, output)
        if not ok or not decoded then
          return {}
        end

        local diagnostics = {}
        for _, item in ipairs(decoded) do
          local severity = vim.diagnostic.severity.WARN
          if item.type == "error" then
            severity = vim.diagnostic.severity.ERROR
          end
          local end_col = item.column_number
          if item.ranges and item.ranges[1] and item.ranges[2] then
            end_col = item.ranges
          end
          table.insert(table.insert(diagnostics, {
            lnum = item.line_number - 1,
            col = item.column_number - 1,
            end_lnum = item.line_number - 1,
            end_col = end_col,
            severity = severity,
            message = string.format("[%s] %s", item.linter, item.message),
            source = "lintr",
          }))
        end
        return diagnostics
      end,
    }

    lint.linters_by_ft = {
      python = { "ruff" },
      r = { "lintr" },
    }

    vim.api.nvim_create_autocmd(
      { "BufWritePost", "InsertLeave" },
      {
        callback = function()
          lint.try_lint()
        end,
      }
    )
  end,
}
