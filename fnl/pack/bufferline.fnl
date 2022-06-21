(require-macros :hibiscus.vim)

(local {: setup} (require :bufferline))

(setup {:options {:numbers :none
                  :offsets {1 {:filetype :NvimTree :text "" :padding 1}}
                  :view :multiwindow
                  :max_name_length 14
                  :max_prefix_length 13
                  :tab_size 18
                  :separator_style :thin
                  :sort_by :id}})
