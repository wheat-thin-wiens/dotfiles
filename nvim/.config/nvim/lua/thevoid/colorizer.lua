return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require('colorizer').setup({
      '*';
    }, { names = false, mode = 'background', })
  end
}
