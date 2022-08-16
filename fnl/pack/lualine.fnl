(local {: setup} (require :lualine))
(local navic (require :nvim-navic))

(local custom-ayu (require :lualine.themes.ayu))
(set custom-ayu.normal.c.bg "#0d1016")

(setup {:options {:icons_enabled true
                  :theme :custom-ayu
                  :disabled_filetypes [:NvimTree]
                  :component_separators "|"
                  :section_separators ""}

        :sections {:lualine_a [:mode]
                   :lualine_b []
                   :lualine_c [:filename :diagnostics {1 navic.get_location :cond navic.is_available}]
                   :lualine_x [:%Y]
                   :lualine_y []
                   :lualine_z [:location]}})
