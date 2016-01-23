(require 'exec-path-from-shell)

;; (setq magit-last-seen-setup-instructions "1.4.0")

(defun load-ssh-agent-variable ()
  (exec-path-from-shell-copy-env "SSH_AGENT_PID")
  (exec-path-from-shell-copy-env "SSH_AUTH_SOCK"))

(add-hook 'magit-mode-hook
          'load-ssh-agent-variable)
