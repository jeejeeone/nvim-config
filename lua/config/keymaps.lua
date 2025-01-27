-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<Leader>Nk", function()
  local row = vim.api.nvim_win_get_cursor(0)[1] -- Get current cursor row
  vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, { "" }) -- Insert an empty line above
end, { desc = "Add new line above" })

vim.keymap.set("n", "<Leader>Nj", function()
  local row = vim.api.nvim_win_get_cursor(0)[1] -- Get current cursor row
  vim.api.nvim_buf_set_lines(0, row, row, false, { "" }) -- Insert an empty line above
end, { desc = "Add new line below" })

--[[
-- Function to toggle the terminal panel
local term_buf = nil -- Buffer ID for the terminal
local term_win = nil -- Window ID for the terminal

function ToggleTerminal()
  if term_win and vim.api.nvim_win_is_valid(term_win) then
    -- Close the terminal if it's open
    vim.api.nvim_win_close(term_win, true)
    term_win = nil
  else
    -- Open or reuse the terminal
    term_buf = vim.api.nvim_create_buf(false, true) -- Create a new buffer

    -- Open the terminal at the bottom
    vim.cmd("botright split")
    vim.cmd("resize 10") -- Adjust height as needed
    term_win = vim.api.nvim_get_current_win() -- Store the window ID
    vim.fn.termopen("poetry run") -- Run the command
    vim.api.nvim_win_set_buf(term_win, term_buf) -- Attach the terminal buffer
  end
end

-- Keybinding to toggle the terminal
vim.api.nvim_set_keymap("n", "<leader>pr", ":lua ToggleTerminal()<CR>", { noremap = true, silent = true })
]]
