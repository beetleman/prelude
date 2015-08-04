;; company mode
(require 'company)

(set-face-attribute 'company-tooltip-selection nil
                    :inherit 'company-tooltip-selection
                    :underline t)
(setq company-dabbrev-downcase nil)
(setq company-tooltip-limit 20)
(setq company-idle-delay .3)
(setq company-echo-delay 0)
