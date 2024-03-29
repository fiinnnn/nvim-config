(local alpha (require :alpha))
(local dashboard (require :alpha.themes.dashboard))

(set dashboard.section.header.val
     {1 "                                   "
      2 "                                   "
      3 "                                   "
      4 "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          "
      5 "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       "
      6 "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     "
      7 "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    "
      8 "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   "
      9 "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  "
      10 "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   "
      11 " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  "
      12 " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ "
      13 "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     "
      14 "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     "
      15 "                                   "})

(set dashboard.section.header.opts.hl :Conceal)

(set dashboard.section.buttons.val
     {1 (dashboard.button :e "  New file" "<cmd>ene <CR>")
      2 (dashboard.button :p "  Projects" "<cmd>Telescope projects<CR>")
      3 (dashboard.button :f "  Find file" "<cmd>Telescope find_files<CR>")
      4 (dashboard.button :t "  Find text" "<cmd>Telescope live_grep<CR>")
      5 (dashboard.button :u "  Update plugins" "<cmd>PackerSync<CR>")})

(set dashboard.section.footer.val
     (string.format " %d plugins loaded"
                    (length (vim.tbl_keys _G.packer_plugins))))
(set dashboard.section.footer.opts.hl :Conceal)

(alpha.setup {:layout {1 {:type :padding :val 4}
                       2 dashboard.section.header
                       3 {:type :padding :val 2}
                       4 dashboard.section.buttons
                       5 dashboard.section.footer}
              :opts {:margin 5}})
