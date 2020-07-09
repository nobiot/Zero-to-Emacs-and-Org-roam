;;; install-org-roam.el --- description -*- lexical-binding: t; -*-

;; Copyright (C) 2020 Noboru Ota

;; Author: Noboru Ota <https://github.com/nobiot>, <https://gitlab.com/nobiot>
;; Maintainer: Noboru Ota <me@nobiot.com>
;; Created: July 9, 2020
;; Modified: July 9, 2020
;; Version: 0.0.1
;; Keywords:
;; Homepage:
;; Package-Requires: ((emacs 26.3))
;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

(if (executable-find "sqlite3")
    (message "SQLite found in %s" (executable-find "sqlite3"))
  (error "SQLite not found. [instruction to be added]"))
  
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

(dolist (packages '(org-roam modus-operandi-theme modus-vivendi-theme ivy counsel swiper olivetti org-ref org-roam-bibtex))

  (unless (package-installed-p packages)
    (package-install packages)))

(message "Packages installed.\ Make sure to configure your `.bib' file in ~/.emacs.d/init.el. Place holder is provided.")

;;; install-org-roam.el ends here
