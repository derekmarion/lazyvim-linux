-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Format git commit messages
vim.api.nvim_create_autocmd("FileType", {
  pattern = "gitcommit",
  callback = function()
    -- Enable spell checking
    vim.opt_local.spell = true
    -- Set the spell language to English (US)
    vim.opt_local.spelllang = { "en_us" }
    -- Enable word wrapping
    vim.opt_local.wrap = true
    -- Enable auto-wrap at text width
    vim.opt_local.formatoptions:append("t")
    -- Set the line length for wrapping
    vim.opt_local.linebreak = true
    -- Set the text width to 72 characters
    vim.opt_local.textwidth = 72
    -- Enable vertical rule at 72 characters
    vim.opt_local.colorcolumn = "72"
  end,
})

-- Enforce tabs instead of spaces for liveread code
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function(args)
    local fname = vim.api.nvim_buf_get_name(args.buf)
    if fname:find("/home/derek/code/liveread/backend/src") then
      vim.bo[args.buf].expandtab = false
      vim.bo[args.buf].tabstop = 4
      vim.bo[args.buf].shiftwidth = 4
      vim.bo[args.buf].softtabstop = 4
    end
  end,
})

