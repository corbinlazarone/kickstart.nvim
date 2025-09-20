-- github.com/catppuccin/nvim

return {
  {
    'catppuccin/nvim',
    name = 'catppuccin', -- This renames the plugin directory for easier management
    priority = 1000, -- Optional: Ensures colorschemes load early
    config = function()
      require('catppuccin').setup {
        flavour = 'frappe',
        float = {
          transparent = false, -- enable transparent floating windows
          solid = true, -- use solid styling for floating windows, see |winborder|
        },
        transparent_background = true,
        auto_integrations = true,
      }
      vim.cmd.colorscheme 'catppuccin' -- Or whichever flavour you want
    end,
  },
}
