return {
  "Vigemus/iron.nvim",
  config = function()
    local iron = require("iron.core")

    vim.g.iron_map_defaults = 0

    iron.setup({
      config = {
        repl_definition = {
          python = {
            command = { ".venv/Scripts/python.exe", "-i" },
          },
        },
        repl_open_cmd = "botright 12 split",
        scratch_repl = true,
      },
      keymaps = {
        send_motion = "<leader>rc",
        visual_send = "<leader>rc",
        send_line = "<leader>rl",
        send_file = "<leader>rf",
        cr = "<leader>r<cr>",
        interrupt = "<leader>r<space>",
        exit = "<leader>rq",
        clear = "<leader>rC",
      },
    })
  end,
}
