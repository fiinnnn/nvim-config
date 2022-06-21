(local {: setup} (require :nvim-tree))

(setup {:view {:side :left
               :width 30
               :mappings {:list [{:key [:l :<CR> :o] :action :edit :mode :n}
                                 {:key :h :action :close_node}
                                 {:key :v :action :vsplit}]}}
        :renderer {:add_trailing true
                   :group_empty true
                   :highlight_git true
                   :highlight_opened_files :all
                   :indent_markers {:enable true}
                   :root_folder_modifier ::t}
        :disable_netrw true
        :hijack_netrw true
        :hijack_cursor true
        :update_cwd true
        :git {:enable true :ignore false}})
