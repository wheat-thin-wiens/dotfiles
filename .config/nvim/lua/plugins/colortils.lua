return {
  "max397574/colortils.nvim",
  cmd = "Colortils",
  config = function ()
    require("colortils").setup({
      replace_choose_format = "g<C-CR>"
    })
  end,
}
