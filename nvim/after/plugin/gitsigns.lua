require('gitsigns').setup {
  signs = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged_enable = true,
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = true, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    follow_files = true
  },
  auto_attach = true,
  attach_to_untracked = false, 
  -- Preview changes in a floating window
  preview_config = {
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  
  -- Keymaps for additional git information
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    -- Show line blame (similar to VS Code's git lens)
    vim.keymap.set('n', '<leader>gb', function()
      gs.blame_line{full=true}
    end, {buffer = bufnr, desc = "Git Blame Line"})

    -- Show git diff preview
    vim.keymap.set('n', '<leader>gd', gs.preview_hunk, 
      {buffer = bufnr, desc = "Preview Git Hunk"})
  end,
  
  -- Git blame configuration (shows previous changes)
  current_line_blame = true, -- Turn on inline blame
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- End of line
    delay = 100, -- Show after 100ms
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%R> - <summary>'
}
