-- Adds git related signs to the gutter, as well as utilities for managing changes
-- NOTE: gitsigns is already included in init.lua but contains only the base
-- config. This will add also the recommended keymaps.

return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = {
          -- text = '▎', -- Custom symbol for added lines
          -- Alternative options:
          -- text = '│', -- Thin vertical line
          text = '█', -- Full block
          -- text = '┃', -- Double line
          -- text = '▌', -- Left half block
          -- text = '●', -- Bullet point
        },
        change = {
          text = '▎', -- Custom symbol for modified lines
          -- Alternative options:
          -- text = '▮', -- Vertical rectangle
          -- text = '◆', -- Diamond
          -- text = '◉', -- Circle with dot
        },
        delete = {
          text = '▸', -- Custom symbol for deleted lines
          -- Alternative options:
          -- text = '▶', -- Right arrow
          -- text = '◢', -- Lower right triangle
          -- text = '_', -- Underscore (default)
          -- text = '‾', -- Overline
        },
        topdelete = {
          text = '▾', -- Custom symbol for deleted at top
          -- Alternative options:
          -- text = '▼', -- Down arrow
          -- text = '‾', -- Overline
        },
        changedelete = {
          text = '▎', -- Custom symbol for lines that were changed and deleted
          -- Alternative options:
          -- text = '▮', -- Vertical rectangle
          -- text = '~', -- Tilde (default)
        },
        untracked = {
          text = '┆', -- Custom symbol for untracked files
          -- Alternative options:
          -- text = '┊', -- Dotted line
          -- text = '▎', -- Same as add
          -- text = '?', -- Question mark
        },
      },

      -- You can also customize sign highlighting
      signs_staged = {
        add = { text = '▎' },
        change = { text = '▎' },
        delete = { text = '▸' },
        topdelete = { text = '▾' },
        changedelete = { text = '▎' },
      },

      -- Customize sign highlight groups (colors)
      -- These reference your colorscheme's highlight groups
      sign_priority = 6, -- Priority of signs (higher = more important)
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'Jump to next git [c]hange' })

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Jump to previous git [c]hange' })

        -- Actions
        -- visual mode
        map('v', '<leader>hs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'git [s]tage hunk' })
        map('v', '<leader>hr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'git [r]eset hunk' })
        -- normal mode
        map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'git [s]tage hunk' })
        map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'git [r]eset hunk' })
        map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'git [S]tage buffer' })
        map('n', '<leader>hu', gitsigns.stage_hunk, { desc = 'git [u]ndo stage hunk' })
        map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'git [R]eset buffer' })
        map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'git [p]review hunk' })
        map('n', '<leader>hb', gitsigns.blame_line, { desc = 'git [b]lame line' })
        map('n', '<leader>hd', gitsigns.diffthis, { desc = 'git [d]iff against index' })
        map('n', '<leader>hD', function()
          gitsigns.diffthis '@'
        end, { desc = 'git [D]iff against last commit' })
        -- Toggles
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line' })
        map('n', '<leader>tD', gitsigns.preview_hunk_inline, { desc = '[T]oggle git show [D]eleted' })
      end,
    },
  },
}
