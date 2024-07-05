(require-macros :hibiscus.vim)

(set! termguicolors)

((. (require :kanagawa) :setup) {:transparent (not vim.g.neovide)
                                 :colors {:theme {:all {:ui {:bg_gutter "none"}}}}})

(color! "kanagawa-wave")

(g! neovide_transparency 0.4)
