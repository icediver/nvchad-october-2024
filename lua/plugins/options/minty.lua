return {
  "nvchad/minty",
  lazy = true,
  dependencies = { "nvchad/volt" },
  keys = {
    {
      "<leader>oc",
      function()
        require("minty.huefy").open { border = true }
      end,
      desc = "Open color picker",
    },
    {
      "<leader>os",
      function()
        require("minty.shades").open()
      end,
      desc = "Open color shades",
    },
  },
}
