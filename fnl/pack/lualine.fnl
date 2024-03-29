(local {: setup} (require :lualine))
(local navic (require :nvim-navic))

(local kanagawa (require :lualine.themes.kanagawa))
(set kanagawa.normal.c.bg :NONE)
(set kanagawa.inactive.c.bg :NONE)

(setup {:options {:icons_enabled true
                  :theme kanagawa
                  :disabled_filetypes [:NvimTree]
                  :component_separators "|"
                  :section_separators ""}

        :sections {:lualine_a [:mode]
                   :lualine_b []
                   :lualine_c [:filename :diagnostics {1 navic.get_location :cond navic.is_available}]
                   :lualine_x [:%Y]
                   :lualine_y []
                   :lualine_z [:location]}})
