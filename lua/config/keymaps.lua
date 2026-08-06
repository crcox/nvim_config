vim.g.mapleader = " "

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local opts = { buffer = event.buf, silent = true }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

    vim.keymap.set("n", "<leader>q", function()
      vim.diagnostic.setqflist()
      vim.cmd("copen")
    end, opts)

    vim.keymap.set("n", "<leader>Q", function()
      vim.fn.setqflist({}, "r", {
        title = "Pyright",
        lines = vim.fn.systemlist("pyright")
      })
      vim.cmd("copen")
    end, opts)
  end,
})

-- Quickfix navigation
vim.keymap.set("n", "]q", ":cnext<CR>", { silent = true })
vim.keymap.set("n", "[q", ":cprev<CR>", { silent = true })
vim.keymap.set("n", "<leader>qc", ":cclose<CR>", { silent = true })
vim.keymap.set("n", "<leader>qo", ":copen<CR>", { silent = true })


-- Oil
vim.keymap.set(
  "n",
  "-",
  "<CMD>Oil<CR>",
  { desc = "Open parent directory" }
)

-- R Document
vim.keymap.set("n", "<leader>rd", ":RDocument<CR>", { desc = "Rebuild documentation and NAMESPACE" })

-- Conform
vim.keymap.set("n", "<leader>rf", function()
    require("conform").format({ async = true })
end, { desc = "Format buffer" })
