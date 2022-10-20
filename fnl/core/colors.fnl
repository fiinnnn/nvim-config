(require-macros :hibiscus.vim)

(set! termguicolors)

(when (not vim.g.neovide)
  ((. (require :kanagawa) :setup) {:transparent true}))

(color! kanagawa)

(g! neovide_transparency 0.4)
