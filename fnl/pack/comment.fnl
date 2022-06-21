(local {: setup} (require :Comment))

(setup {:active true
        :padding true
        :ignore "^$"
        :mappings {:basic false :extra false}
        :pre_hook (fn [_ctx] (. (require :ts_context_commentstring.internal) :calculate_commentstring))})
