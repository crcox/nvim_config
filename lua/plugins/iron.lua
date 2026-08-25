return {
  "Vigemus/iron.nvim",
  config = function()
    local iron = require("iron.core")

    vim.g.iron_map_defaults = 0

    local r_cmd
    if vim.fn.has("win32") == 1 then
      r_cmd = "C:/Program Files/R/R-4.5.2/bin/x64/R.exe"
      py_cmd =  ".venv/Scripts/python.exe"
    else
      r_cmd = "R"
      py_cmd = "python"
    end

    iron.setup({
      config = {
        repl_definition = {
          r = {
            command = { r_cmd },
          },
          python = {
            command = { py_cmd, "-i" },
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
