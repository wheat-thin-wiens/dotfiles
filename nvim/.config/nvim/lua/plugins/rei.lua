return {
  "rei.nvim",
  dev = true,
  branch = "dev",
  opts = {
    styles ={
      functions = { italic = true, bold = true },
      comments = { italic = true },
      loops = { italic = true }
    },
    integrations = {
      telescope = "borderless",
    },
    transparency = true,
    highlight_overrides = {}
  }
}
