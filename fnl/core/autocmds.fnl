(require-macros :hibiscus.vim)

(augroup! :highlight-yank
          [[TextYankPost] * #(vim.highlight.on_yank {:higroup :Search :timeout 150})])

(augroup! :auto-resize
          [[VimResized] * "tabdo wincmd ="])
