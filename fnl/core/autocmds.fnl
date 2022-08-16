(require-macros :hibiscus.vim)

(augroup! :highlight-yank
          [[TextYankPost] * #(vim.highlight.on_yank {:higroup :Search :timeout 150})])

(augroup! :auto-resize
          [[VimResized] * "tabdo wincmd ="])

(augroup! :clean-dashboard
          [[User] "AlphaReady" (fn [] (set! showtabline 0)
                                      (set! showmode false)
                                      (set! laststatus 0)
                                      (set! showcmd false)
                                      (set! ruler false))]

          [[BufUnload] "<buffer>" (fn [] (set! showtabline 2)
                                         (set! showmode true)
                                         (set! laststatus 2)
                                         (set! showcmd true)
                                         (set! ruler true))])
