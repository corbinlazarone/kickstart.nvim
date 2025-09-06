-- github.com/catppuccin/nvim

return {
  {
    'catppuccin/nvim',
    name = 'catppuccin', -- This renames the plugin directory for easier management
    priority = 1000, -- Optional: Ensures colorschemes load early
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha',
        float = {
          transparent = true, -- enable transparent floating windows
          solid = false, -- use solid styling for floating windows, see |winborder|
        },
        -- transparent_background = true,
        auto_integrations = true,
      }
      vim.cmd.colorscheme 'catppuccin' -- Or whichever flavour you want
    end,
  },
}
