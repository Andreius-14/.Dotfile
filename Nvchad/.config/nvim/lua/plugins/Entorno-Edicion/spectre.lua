return {
  {
    "nvim-pack/nvim-spectre",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = "Spectre",
    keys = {
      { "_S", "<cmd>lua require('spectre').toggle()<CR>", desc = "Toggle Spectre (Buscar y Reemplazar)" },
      { "_sw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", desc = "Buscar palabra actual" },
      { "_sp", "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>", desc = "Buscar en archivo actual" },
    },
    config = function()
      require("spectre").setup()
    end,
  },
}
