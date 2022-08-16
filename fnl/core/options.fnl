(require-macros :hibiscus.vim)

;; quicker refresh
(set! updatetime 200)
(set! timeoutlen 500)

;; shortmess setup
(set! shortmess :filnxtToOFatsIc)

;; fillchar setup
(set! fillchars {:eob " "
                 :horiz "─"
                 :horizup "┴"
                 :horizdown "┬"
                 :vert "│"
                 :vertleft "┤"
                 :vertright "├"
                 :verthoriz "┼"
                 :fold " "
                 :diff "─"
                 :msgsep "‾"
                 :foldsep "│"
                 :foldopen "▾"
                 :foldclose "▸"})

;; use system clipboard
(set! clipboard :unnamedplus)

;; enable mouse input
(set! mouse :a)

;; disable swapfiles, enable undofiles
(set! noswapfile)
(set! undofile)

;;; ui options

;; ui font
(set! guifont "FiraCode Nerd Font:h11")

;; line numbers
(set! number)

;; smart search
(set! smartcase)

;; indentation
(set! copyindent)
(set! smartindent)
(set! preserveindent)

(set! expandtab)
(set! tabstop 4)
(set! shiftwidth 4)
(set! softtabstop 4)

;; enable concealing
(set! conceallevel 2)

;; split locations
(set! splitright)
(set! splitbelow)

;; scroll offset
(set! scrolloff 8)

;; cmp options
(set! completeopt [:menu :menuone :preview :noinsert])

;; set cmdheight if available
(if (= 1 (vim.fn.has :nvim-0.8.0))
    (set! cmdheight 0))
