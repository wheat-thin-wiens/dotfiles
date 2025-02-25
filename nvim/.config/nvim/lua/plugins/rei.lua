return {
	'rei.nvim',
	dev = true,
  opts = {
    styles = {
      functions = { italic = true, bold = true },
      loops = { italic = true },
      comments = { italic = true },
    },
    integrations = {
      telescope = "borderless",
    },
    highlight_overrides = {
      -- Normal = { bg = "none" },
      -- NormalFloat = { bg = "none" }
    }
  }
}
