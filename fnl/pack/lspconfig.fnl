(local lsp (require :lspconfig))
(local {: set-lsp-keys!} (require :core.keymaps))

;;; diagnostics
(let [{: config : severity} vim.diagnostic
      {: sign_define} vim.fn]
  (config {:underline {:severity {:min severity.INFO}}
           :signs {:severity {:min severity.INFO}}
           :virtual_text true
           :update_in_insert true
           :severity_sort true
           :float {:show_header false :border :rounded}})
  (sign_define :DiagnosticSignError {:text "" :texthl :DiagnosticSignError})
  (sign_define :DiagnosticSignWarn {:text "" :texthl :DiagnosticSignWarn})
  (sign_define :DiagnosticSignInfo {:text "" :texthl :DiagnosticSignInfo})
  (sign_define :DiagnosticSignHint {:text "" :texthl :DiagnosticSignHint}))

;;; ui
(let [{: with : handlers} vim.lsp]
  (set vim.lsp.handlers.textDocument/signatureHelp
       (with handlers.signature_help {:border :solid}))
  (set vim.lsp.handlers.textDocument/hover
       (with handlers.hover {:border :solid})))

(let [navic (require :nvim-navic)]
  (navic.setup))

(fn on-attach [client bufnr]
  ;; set keymaps
  (set-lsp-keys! bufnr)

  ;; lsp_signature setup
  (let [signature (require :lsp_signature)]
    (signature.on_attach {:bind true
                          :fix_pos true
                          :floating_window_above_cur_line true
                          :doc_lines 0
                          :hint_enable false
                          :hint_prefix "● "
                          :hint_scheme :DiagnosticSignInfo}
                        bufnr))

  ;; nvim-navic setup
  (let [navic (require :nvim-navic)]
    (navic.attach client bufnr)))

;; lsp capabilities
(local capabilities (vim.lsp.protocol.make_client_capabilities))
(set capabilities.textDocument.completion.completionItem
   {:documentationFormat [:markdown :plaintext]
    :snippetSupport true
    :preselectSupport true
    :insertReplaceSupport true
    :labelDetailsSupport true
    :depecatedSupport true
    :commitCharactersSupport true
    :tagSupport {:valueSet {1 1}}
    :resolveSupport {:properties [:documentation
                                  :detail
                                  :additionalTextEdits]}})

;; setup servers
(local defaults {:on_attach on-attach
               : capabilities
               :flags {:debounce_text_changes 150}})

(let [servers [:rust_analyzer]]
(each [_ server (ipairs servers)]
  ((. (. lsp server) :setup) defaults)))

(lsp.sumneko_lua.setup {:on-attach on-attach
                        : capabilities
                        :settings {:lua {:diagnostics {:globals {1 :vim}}
                                         :workspace {:library {(vim.fn.expand :$VIMRUNTIME/lua) true
                                                               (vim.fn.expand :$VIMRUNTIME/lua/vim/lsp) true}
                                                     :maxPreload 100000
                                                     :preloadFileSize 10000}}}})
