(local {: setup} (require :nvim-treesitter.configs))

(setup {:ensure_installed [:lua :vim :fennel :markdown :nix :rust]
        :highlight {:enable true :use_languagetree true}
        :indent {:enable true}})
