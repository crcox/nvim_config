-- Auto-Commands
vim.api.nvim_create_autocmd("FileType", {
  pattern = "quarto",
  callback = function()
    require("otter").activate()
  end,
})

-- User Commands
vim.api.nvim_create_user_command(
  "RDocument",
  function()

    if vim.fn.filereadable("DESCRIPTION") ~= 1 then
      vim.notify(
        "No DESCRIPTION found",
        vim.log.levels.WARN
      )
      return
    end

    vim.fn.system({
      "Rscript",
      "-e",
      "devtools::document()",
    })

    vim.notify("Documentation updated")
  end,
  {}
)

