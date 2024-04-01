local logo = {
  "                 ▄   ▄                 ",
  "             ▄█▄ █▀█▀█ ▄█▄             ",
  "            ▀▀████▄█▄████▀▀            ",
  "                 ▀█▀█▀                 ",
  "                                       ",
  "                                       ",
  "    █▀▀ █░█ █ █░░ ▀█▀ █ ▀█▀ █▀▀ █▀█    ",
  "▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀",
  "    █▄█ █▄█ █ █▄▄ ░█░ █ ░█░ ██▄ █▀▄    ",
}

return {
  "goolord/alpha-nvim",
  opts = function(_, opts)
    opts.section.header.val = logo
    opts.section.buttons.val = {
      opts.button("LDR o", "  " .. "File Manager"),
      opts.button("LDR f T", "  " .. "TODOs"),
    }
  end,
  enabled = false,
}
