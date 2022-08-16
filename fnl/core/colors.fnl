(require-macros :hibiscus.vim)

(set! termguicolors)

(g! ayu_italic_comment 1)
(g! ayu_extended_palette 1)
(color! ayu)

(exec [[:call "ayu#hi('DiagnosticUnderlineError', 'common_error', '', 'undercurl')"]
       [:call "ayu#hi('DiagnosticUnderlineWarn', 'extended_warning', '', 'undercurl')"]
       [:call "ayu#hi('LspDiagnosticsUnderlineError', 'common_error', '', 'undercurl')"]
       [:call "ayu#hi('LspDiagnosticsUnderlineWarning', 'extended_warning', '', 'undercurl')"]])
