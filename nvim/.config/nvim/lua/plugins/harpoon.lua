return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  settings = {
    save_on_toggle = false,
  },
  config = function()
    require("harpoon").setup {}
  end
}
