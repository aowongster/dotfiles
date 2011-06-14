;; using org-mode 7.5

;; need to choose emacs color
(setq org-directory "~/org")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-confirm-babel-confirm-evaluate nil)
(setq org-agenda-files (list org-directory))
(setq org-refile-targets '((org-agenda-files . (:level . 1))))
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler)) ;!!
(add-hook 'remember-mode-hook 'org-remember-apply-template)
;; (setq org-remember-templates
;;       '(("Todo" ?t "* TODO %?\n  %i\n  %a" "~/org/todo.org" "Tasks")
;;         ("Journal" ?j "* %U %?\n\n  %i\n  %a" "~/org/journal.org")
;;         ("Idea" ?i "* %?\n  %i\n  %a" "~/org/journal.org" "Ideas")))
(setq org-remember-templates
      (append
       (if (boundp 'org-remember-templates) org-remember-templates nil)
       '(("Todo" ?t "* TODO %^{Title} %^g\n%?\n  %i\n  %a\nAdded: %U" "~/org/tasks.org" "Tasks")
        ("Journal"   ?j "* %^{Title} %U %^g\n%?\n  %i\n  %a" "~/org/journal.org")
        ("Clip" ?x "* %^{Title} %U :xclip:\n%?\n  %x\n  %a" "~/org/journal.org")
        ("Clip" ?y "* %^{Title} %U :yclip:\n%?\n  %c\n  %a" "~/org/journal.org")
        ("Expenses"   ?e "* %^{Title} %U %^g\n%?"   "~/org/finance.org")
        ("Book" ?b "* %^{Title} %t :book: \n%[~/.emacs.d/org/.book.tmpl]\n" 
         "~/org/journal.org")
        ("Review" ?a "* Daily review %T :review: \n%[~/.emacs.d/org/.review.tmpl]\n"
         "~/org/journal.org")
        ("Idea" ?i "* %^{Title} %^g\n%?\n  %i\n  %x\n  %a\nAdded: %U"
         "~/org/journal.org" "Ideas"))))

(define-key global-map "\C-cr" 'org-remember)
(define-key global-map "\C-cc" 'org-capture)

(provide 'alistair-custom)
