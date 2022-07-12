(local {: setup} (require :toggleterm))

(setup {:size 20
        :open_mapping "<C-t>"
        :hide_numbers true
        :shade_terminals true
        :shading_factor 2
        :start_in_insert true
        :insert_mappings true
        :direction :horizontal
        :close_on_exit true})
