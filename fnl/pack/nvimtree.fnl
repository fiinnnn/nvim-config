(local {: setup} (require :nvim-tree))

(setup {:disable_netrw true
        :hijack_netrw true
        :hijack_cursor true
        :update_cwd true
        :auto_reload_on_write true
        :diagnostics {:enable true
                      :show_on_dirs true
                      :icons {:hint ""
                              :info ""
                              :warning ""
                              :error ""}}
        :update_focused_file {:enable true}
        :git {:enable true :ignore false}
        :view {:side :left
               :width 30
               :mappings {:list [{:key [:l :<CR> :o] :action :edit :mode :n}
                                 {:key :h :action :close_node}
                                 {:key :v :action :vsplit}]}}
        :renderer {:add_trailing true
                   :group_empty true
                   :highlight_git true
                   :indent_markers {:enable true}
                   :root_folder_modifier ::t
                   :icons {:glyphs {:git {:unstaged ""
                                          :staged "S"
                                          :unmerged ""
                                          :renamed "➜"
                                          :deleted ""
                                          :untracked "U"
                                          :ignored "◌"}}}}
        })

