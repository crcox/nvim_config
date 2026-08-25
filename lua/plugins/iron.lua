return {
  "Vigemus/iron.nvim",
  config = function()
    local iron = require("iron.core")

    vim.g.iron_map_defaults = 0

    iron.setup({
      config = {
        repl_definition = {
          r = {
            command = { "R.exe" },
          },
          python = {
            command = { ".venv/Scripts/python.exe", "-i" },
          },
        },
        repl_open_cmd = "vertical botright 80 split",
        scratch_repl = false,
      },
      keymaps = {
        send_line = "<leader>rr",
        visual_send = "<leader>rr",
        send_motion = "<leader>rm",
        send_file = "<leader>rf",
        send_until_cursor = "<leader>ru",
        send_mark = "<leader>rM",
        send_code_block = "<leader>rb",
        send_code_block_and_move = "<leader>rn",
        mark_motion = "<leader>mc",
        mark_visual = "<leader>mc",
        remove_mark = "<leader>md",
        cr = "<leader>ro",
        interrupt = "<leader>ri",
        exit = "<leader>rq",
        clear = "<leader>rC",
      },
    })
    vim.keymap.set(
      "n",
      "<leader>rp",
      "<cmd>IronSend paragraph<cr>"
    )
    vim.keymap.set("n", "<leader>rs", function()
      require("iron.core").repl_for(vim.bo.filetype)
    end)
  end,
}
