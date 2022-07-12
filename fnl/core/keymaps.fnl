(require-macros :hibiscus.vim)

(local which-key (require :which-key))
(λ key [tbl prop] [(. tbl prop) prop])

(g! mapleader " ")

;; general
(which-key.register {:<leader>w [:<cmd>w<CR> "Save"]})
(which-key.register {:<leader>q [:<cmd>q<CR> "Quit"]})

(which-key.register {:<leader>h [:<cmd>nohlsearch<CR> "No highlight"]})

(which-key.register {:<leader>/ ["<cmd>lua require('Comment.api').toggle_current_linewise()<CR>" "Comment"]} {:mode :n})
(which-key.register {:<leader>/ ["<ESC><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>" "Comment"]} {:mode :v})

(which-key.register {:<leader>o ["<cmd>SymbolsOutline<CR>" "Symbols outline"]})

;; trouble
(which-key.register {:<leader>t {:name "Trouble"
                                 :w ["<cmd>TroubleToggle workspace_diagnostics<CR>" "Workspace diagnostics"]
                                 :d ["<cmd>TroubleToggle document_diagnostics<CR>" "Document diagnostics"]
                                 :t ["<cmd>TodoTrouble<CR>" "TODOs"]}})

;; navigation
(which-key.register {:<C-h> [:<C-w>h "Switch window left"]})
(which-key.register {:<C-j> [:<C-w>j "Switch window down"]})
(which-key.register {:<C-k> [:<C-w>k "Switch window up"]})
(which-key.register {:<C-l> [:<C-w>l "Switch window right"]})

;; bufferline
(which-key.register {:<leader>c [:<cmd>BufDel<CR> "Close buffer"]})
(which-key.register {:<S-h> [:<cmd>BufferLineCyclePrev<CR> "Previous buffer"]})
(which-key.register {:<S-l> [:<cmd>BufferLineCycleNext<CR> "Next buffer"]})

;; nvim-tree
(which-key.register {:<leader>e [:<cmd>NvimTreeToggle<CR> "Toggle file explorer"]})

;; telescope
(which-key.register {:<leader>s {:name "Search"
                                 :f ["<cmd>Telescope find_files<CR>" "File"]
                                 :t ["<cmd>Telescope live_grep<CR>" "Text"]
                                 :k ["<cmd>Telescope keymaps<CR>" "Keymaps"]}})

;; git
(which-key.register {:<leader>g {:name "Git"
                                 :j ["<cmd>Gitsigns next_hunk<CR>" "Next hunk"]
                                 :k ["<cmd>Gitsigns prev_hunk<CR>" "Previous hunk"]
                                 :d ["<cmd>Gitsigns diffthis HEAD<CR>" "Diff"]
                                 :l ["<cmd>Gitsigns blame_line<CR>" "Blame"]
                                 :s ["<cmd>Telescope git_status<CR>" "Status"]
                                 :c ["<cmd>Telescope git_commits<CR>" "Commits"]
                                 :C ["<cmd>Telescope git_bcommits<CR>" "Commits (buffer)"]}})

;; lsp
(λ set-lsp-keys! [bufnr]
   (which-key.register {:<leader>l {:name "LSP"
                                     ; inspect
                                     "d" (key vim.lsp.buf :definition)
                                     "D" (key vim.lsp.buf :declaration)
                                     "i" (key vim.lsp.buf :implementation)
                                     "t" (key vim.lsp.buf :type_definition)
                                     "s" (key vim.lsp.buf :signature_help)
                                     "h" (key vim.lsp.buf :hover)
                                     "r" (key vim.lsp.buf :references)
                                     "ci" (key vim.lsp.buf :incoming_calls)
                                     "co" (key vim.lsp.buf :outgoing_calls)
                                     ; diagnostics
                                     "k" (key vim.diagnostic :goto_prev)
                                     "l" (key vim.diagnostic :goto_next)
                                     "w" (key vim.diagnostic :open_float)
                                     "q" (key vim.diagnostic :setloclist)
                                     ; code
                                     "r" (key vim.lsp.buf :rename)
                                     "a" (key vim.lsp.buf :code_action)}
                        "K" (key vim.lsp.buf :hover)
                        "gd" (key vim.lsp.buf :definition)
                        "gD" (key vim.lsp.buf :declaration)}
                    {:buffer bufnr}))

{: set-lsp-keys!}
