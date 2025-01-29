return {
  "javiorfo/nvim-ship",
  lazy = true,
  ft = "ship",
  build = function()
    -- Update the backend in every plugin change
    require("ship.commands").build()
  end,
  cmd = { "ShipBuild", "ShipCreate", "ShipCreateEnv" },
  dependencies = {
    "javiorfo/nvim-spinetta",
    "javiorfo/nvim-popcorn",
    "hrsh7th/nvim-cmp", -- nvim-cmp is optional
  },
  opts = {
    -- Not necessary. Only if you want to change the setup.
    -- The following are the default values
    view = {
      autocomplete = true,
    },
    request = {
      timeout = 30,
      autosave = true,
      insecure = false,
    },
    response = {
      show_headers = "all",
      window_type = "h",
      size = 20,
      redraw = true,
    },
    output = {
      save = false,
      override = true,
      folder = "output",
    },
    internal = {
      log_debug = false,
    },
  },
}
