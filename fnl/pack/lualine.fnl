(local {: setup} (require :lualine))

(setup {:options {:icons_enabled true
                  :theme :gruvbox-material
                  :disabled_filetypes [:NvimTree]
                  :component_separators "|"
                  :section_separators ""}

        :sections {:lualine_a [:mode]
                   :lualine_b []
                   :lualine_c [:filename :diagnostics]
                   :lualine_x [:%Y]
                   :lualine_y []
                   :lualine_z [:location]}})
