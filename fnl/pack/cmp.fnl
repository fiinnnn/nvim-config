(local cmp (require :cmp))
(local {: setup
        : mapping
        :config {: compare}} cmp)

(local types (require :cmp.types))

(local luasnip (require :luasnip))

(local icons {:Text ""
              :Method ""
              :Function ""
              :Constructor ""
              :Field "ﰠ"
              :Variable ""
              :Class "ﴯ"
              :Interface ""
              :Module ""
              :Unit "塞"
              :Property "ﰠ"
              :Value ""
              :Enum ""
              :Keyword ""
              :Snippet ""
              :Color ""
              :File ""
              :Reference ""
              :Folder ""
              :EnumMember ""
              :Constant ""
              :Struct "פּ"
              :Event ""
              :Operator ""
              :TypeParameter ""})

(setup {:preselect types.cmp.PreselectMode.None
        :experimental {:ghost_text true}
        :window {:documentation {:border :solid} :completion {:border :solid}}
        :snippet {:expand (fn [args]
                            (luasnip.lsp_expand args.body))}
        :mapping (mapping.preset.insert {:<C-b> (mapping.scroll_docs -4)
                                         :<C-f> (mapping.scroll_docs 4)
                                         :<C-e> (mapping.abort)
                                         :<Tab> (mapping (fn [fallback]
                                                           (if (cmp.visible)
                                                               (cmp.select_next_item {:behavior cmp.InsertBehavior})
                                                               (luasnip.expand_or_jumpable)
                                                               (luasnip.expand_or_jump)
                                                               (fallback)))
                                                         [:i :s])
                                         :<S-Tab> (mapping (fn [fallback]
                                                             (if (cmp.visible)
                                                                 (cmp.select_prev_item {:behavior cmp.InsertBehavior})
                                                                 (luasnip.jumpable -1)
                                                                 (luasnip.jump -1)
                                                                 (fallback)))
                                                           [:i :s])
                                         :<CR> (mapping.confirm {:select false})})
        :sources [{:name :nvim_lsp}
                  {:name :luasnip}
                  {:name :path}
                  {:name :buffer}]
        :sorting {:comparators [compare.offset
                                compare.exact
                                compare.score
                                compare.kind
                                compare.sort_text
                                compare.length
                                compare.order]}
        :formatting {:fields {1 :kind 2 :abbr 3 :menu}
                     :format (fn [_ vim-item]
                               (set vim-item.menu vim-item.kind)
                               (set vim-item.kind (. icons vim-item.kind))
                               vim-item)}})

(setup.cmdline ":"
               {:view {:separator "|"}
               :mapping (mapping.preset.cmdline)
               :sources [{:name :path} {:name :cmdline}]})
