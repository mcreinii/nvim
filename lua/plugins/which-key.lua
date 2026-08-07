return {
  "folke/which-key.nvim",
  event = "VeryLazy",

opts = {
  delay = 250,

  icons = {
    mappings = false,
  },

  preset = "helix",

  win = {
    border = "single",
    padding = { 0, 1 },
  },

  layout = {
    width = { min = 18 },
  },
}
}
