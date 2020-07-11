;;; install-org-roam.el --- description -*- lexical-binding: t; -*-

;; Copyright (C) 2020 Noboru Ota

;; Author: Noboru Ota <https://github.com/nobiot>, <https://gitlab.com/nobiot>
;; Maintainer: Noboru Ota <me@nobiot.com>
;; Created: July 9, 2020
;; Modified: July 11, 2020
;; Version: 0.0.2
;; Keywords:
;; Homepage:
;; Package-Requires: ((emacs 26.3))
;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

(defvar url-on-sqlite-install
  "https://github.com/nobiot/Zero-to-Emacs-and-Org-roam/blob/master/30.Set-up-Org-roam.md#install-sqlite")

(defvar url-to-guide
  "https://github.com/nobiot/Zero-to-Emacs-and-Org-roam")

(if (executable-find "sqlite3")
    (message "SQLite found in %s" (executable-find "sqlite3"))
  (message "SQLite not found")
  (when (y-or-n-p "View the manual on how to install SQLite? ")
    (browse-url url-on-sqlite-install))
  (error "Installation aborted.\nRepeat installation after installing SQLite"))

(when (file-exists-p "~/.emacs")
  (unless (y-or-n-p "`.emacs' file detected in your home.\nIt does not work with auto installed configuration.\nRemove after installatoin. Continue? ")
    (error "Installation aborted")))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

(let ((packages-list '(org-roam modus-operandi-theme modus-vivendi-theme ivy counsel swiper olivetti org-ref org-roam-bibtex)))
;  (when (y-or-n-p "Add Org-roam-bibtex? ")
;    (setq packages-list (append packages-list '(org-roam-bibtex))))
  (message "Packages to install:%s" (mapconcat #'symbol-name packages-list ", "))
  (if (y-or-n-p "Install the packages? ")
      (progn
        (dolist (package packages-list)
          (unless (package-installed-p package)
            (package-install package)))
        (message "Packages installed.\nLaunch Emacs. Make sure to configure your `.bib' file in ~/.emacs.d/init.el.\nPlace holder is provided.\n")
        (when (y-or-n-p "View `Zero to Emacs and Org-roam' guide to learn more about what you can add to the configuration? ")
            (browse-url url-to-guide)))
    (message "Installation aborted.")))
    
;;; install-org-roam.el ends here
