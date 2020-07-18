(defun +org-protocol-check-filename-for-protocol (fname restoffiles _client)
  "Check if `org-protocol-the-protocol' and a valid protocol are used in FNAME.
Sub-protocols are registered in `org-protocol-protocol-alist' and
`org-protocol-protocol-alist-default'.  This is how the matching is done:

  (string-match \"protocol:/+sub-protocol\\\\(://\\\\|\\\\?\\\\)\" ...)
   
protocol and sub-protocol are regexp-quoted.

Old-style links such as \"protocol://sub-protocol://param1/param2\" are
also recognized.

If a matching protocol is found, the protocol is stripped from
fname and the result is passed to the protocol function as the
first parameter.  The second parameter will be non-nil if FNAME
uses key=val&key2=val2-type arguments, or nil if FNAME uses
val/val2-type arguments.  If the function returns nil, the
filename is removed from the list of filenames passed from
emacsclient to the server.  If the function returns a non-nil
value, that value is passed to the server as filename.

If the handler function is greedy, RESTOFFILES will also be passed to it.

CLIENT is ignored."
  (let ((sub-protocols (append org-protocol-protocol-alist
			       org-protocol-protocol-alist-default)))
    (catch 'fname
      (let ((the-protocol (concat (regexp-quote org-protocol-the-protocol)
				  ":/+")))
        (when (string-match the-protocol fname)
          (dolist (prolist sub-protocols)
            (let ((proto
		   (concat the-protocol
			   (regexp-quote (plist-get (cdr prolist) :protocol))
			   "\\(:/+\\|/*\\?\\)")))
              (when (string-match proto fname)
                (let* ((func (plist-get (cdr prolist) :function))
                       (greedy (plist-get (cdr prolist) :greedy))
                       (split (split-string fname proto))
                       (result (if greedy restoffiles (cadr split)))
		       (new-style (string-match "/*?" (match-string 1 fname))))
                  (when (plist-get (cdr prolist) :kill-client)
		    (message "Greedy org-protocol handler.  Killing client.")
		    (server-edit))
                  (when (fboundp func)
                    (unless greedy
                      (throw 'fname
			     (if new-style
				 (funcall func (org-protocol-parse-parameters
						result new-style))
			       (warn "Please update your Org Protocol handler \
to deal with new-style links.")
			       (funcall func result))))
		    ;; Greedy protocol handlers are responsible for
		    ;; parsing their own filenames.
		    (funcall func result)
                    (throw 'fname t))))))))
      fname)))
