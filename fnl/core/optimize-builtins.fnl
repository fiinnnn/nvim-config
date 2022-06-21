(let [builtins [:gzip
                :zip
                :zipPlugin
                :tar
                :tarPlugin
                :getscript
                :getscriptPlugin
                :vimball
                :vimballPlugin
                :2html_plugin
                :matchit
                :matchparen
                :logiPat
                :rrhelper
                :netrw
                :netrwPlugin
                :netrwSettings
                :netrwFileHandlers]
    providers [:perl :node :ruby :python :python3]]
  (each [_ v (ipairs builtins)]
    (let [plugin (.. :loaded_ v)]
      (tset vim.g plugin 1)))
  (each [_ v (ipairs providers)]
    (let [provider (.. :loaded_ v :_provider)]
      (tset vim.g provider 0))))
