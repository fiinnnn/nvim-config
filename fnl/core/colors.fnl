(require-macros :hibiscus.vim)

(set! termguicolors)

(g! ayu_italic_comment 1)
(g! ayu_extended_palette 1)
(color! ayu)

(exec [[:call "ayu#hi('StatusLine', 'editor_bg', 'editor_bg')"]                           ;; these styles need to be different otherwise
       [:call "ayu#hi('StatusLineNC', 'editor_gutter_normal', 'editor_bg', 'underline')"] ;; vim will fill them with ^^^^^^^^^^^^^^^^^^^
       [:call "ayu#hi('VertSplit', 'editor_gutter_normal', 'editor_bg')"]
       [:call "ayu#hi('DiagnosticUnderlineError', 'common_error', '', 'undercurl')"]
       [:call "ayu#hi('DiagnosticUnderlineWarn', 'extended_warning', '', 'undercurl')"]
       [:call "ayu#hi('LspDiagnosticsUnderlineError', 'common_error', '', 'undercurl')"]
       [:call "ayu#hi('LspDiagnosticsUnderlineWarning', 'extended_warning', '', 'undercurl')"]])
