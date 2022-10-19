(require-macros :hibiscus.vim)

(set! termguicolors)

(g! gruvbox_flat_style "hard")
(g! gruvbox_dark_sidebar false)
(g! gruvbox_dark_float false)
(g! gruvbox_colors {:bg_statusline "#1d2021"})

(when (not vim.g.neovide)
  (g! gruvbox_transparent true))

(color! gruvbox-flat)

(g! neovide_transparency 0.8)
