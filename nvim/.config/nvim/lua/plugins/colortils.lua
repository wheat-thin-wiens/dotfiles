return {
  "max397574/colortils.nvim",
  cmd = "Colortils",
  config = function ()
    require("colortils").setup({
      mappings = {
      replace_default_format = "rdf",
      replace_choose_format = "rcf",
      }
    })
  end,
}
