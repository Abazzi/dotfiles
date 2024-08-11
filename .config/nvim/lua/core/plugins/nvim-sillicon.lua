return {
  "michaelrommel/nvim-silicon",
  lazy = true,
  cmd = "Silicon",
  config = function()
    require("silicon").setup({
      -- Configuration here, or leave empty to use defaults
      font = "CodeNewRoman Nerd Font Mono=34;Noto Color Emoji=34",
      theme = "Dracula",
      background = "#181825",
    })
  end,
}
