(require-macros :hibiscus.packer)

(packer-setup {:autoremove true
               :git {:clone_timeout 300}
               :profile {:enable true}
               :display {:header_lines 2
                         :title " packer.nvim"}})

(packer
  ;; let packer manage itself
  (use! :wbthomason/packer.nvim)

  ;; improve startup time
  (use! :lewis6991/impatient.nvim)

  ;; key mappings
  (use! :folke/which-key.nvim
        :config #(let [w (require :which-key)]
                    (w.setup {})))

  ;; fennel config
  (use! :udayvir-singh/tangerine.nvim)
  (use! :udayvir-singh/hibiscus.nvim
	:requires ["udayvir-singh/tangerine.nvim"])

  ;; statusline
  (use! :nvim-lualine/lualine.nvim
        :requires ["kyazdani42/nvim-web-devicons"]
        :config #(require :pack.lualine))

  ;; colorscheme
  (use! :eddyekofo94/gruvbox-flat.nvim)

  ;; file navigation
  (use! :kyazdani42/nvim-tree.lua
        :cmd :NvimTreeToggle
        :config #(require :pack.nvimtree)
        :requires ["kyazdani42/nvim-web-devicons"])

  (use! :akinsho/bufferline.nvim
        :event :BufEnter
        :config #(require :pack.bufferline))
  (use! :ojroques/nvim-bufdel
        :config #(require :pack.bufdel))

  (use! :nvim-lua/telescope.nvim
        :config #(require :pack.telescope)
        :cmd :Telescope
        :requires [:nvim-lua/plenary.nvim
                   :nvim-telescope/telescope-fzf-native.nvim])
  (use! :nvim-lua/plenary.nvim
        :module :plenary)
  (use! :nvim-telescope/telescope-fzf-native.nvim
        :module :telescope._extensions.fzf
        :run :make)
 
  ;; utilities
  (use! :ggandor/lightspeed.nvim
        :event [:BufRead])

  (use! :numToStr/Comment.nvim
        :config #(require :pack.comment))

  (use! :lewis6991/gitsigns.nvim
        :config #(let [g (require :gitsigns)]
                   (g.setup {})))

  ;; treesitter
  (use! :nvim-treesitter/nvim-treesitter
        :run ":TSUpdate"
        :event [:BufRead :BufNewFile]
        :config #(require :pack.treesitter)
        :requires [:nvim-treesitter/playground
                   :JoosepAlviste/nvim-ts-context-commentstring])

  ;; lsp
  (use! :neovim/nvim-lspconfig
        :module :lspconfig
        :after :nvim-lsp-installer
        :config (fn []
                  (require :pack.lspinstaller)
                  (require :pack.lspconfig)))

  (use! :williamboman/nvim-lsp-installer)

  (use! :ray-x/lsp_signature.nvim
        :module :lsp_signature)

  (use! :j-hui/fidget.nvim
        :after :nvim-lspconfig
        :config #(let [f (require :fidget)]
                   (f.setup {})))

  (use! :stevearc/dressing.nvim)

  ;; completion
  (use! :hrsh7th/nvim-cmp
        :config (fn []
                  (require :pack.cmp)
                  (require :pack.luasnip))
        :event [:InsertEnter :CmdlineEnter]
        :requires [:hrsh7th/cmp-path
                   :hrsh7th/cmp-buffer
                   :hrsh7th/cmp-cmdline
                   :hrsh7th/cmp-nvim-lsp
                   :saadparwaiz1/cmp_luasnip
                   :L3MON5D3/LuaSnip])

  (use! :L3MON4D3/LuaSnip
        :requires [:rafamadriz/friendly-snippets])

  ;; language specific
  ;; rust
  (use! :Saecki/crates.nvim
        :requires [:nvim-lua/plenary.nvim]
        :config #(let [c (require :crates)]
                   (c.setup {}))))
