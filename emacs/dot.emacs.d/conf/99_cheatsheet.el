;; test is read-only が出たら (setq inhibit-read-only t)

;; C-x <RETURN> c    文字コードを指定してファイルを開く
;; C-x <RETURN> f    文字コードを指定してファイルを保存
;; C-x <RETURN> r    バッファの表示文字コードを変更する
;; C-x <RETURN> c    universal-coding-system-argument


;; font list
;; (mapcar (lambda(x) (insert x "\n")) (x-list-fonts "*"))
;; (x-list-fonts "-jis-fixed-*-r-normal--*-*-*-*-c-*-jisx0208.1983-0")
;; M-x describe-fontset


;; get information under cursor
;;
;; C-x =
;; C-u C-x =


;; ================ registers ================
;;
;; C-x r <SPC> R
;;     Save position of point in register R (`point-to-register').
;; C-x r j R
;;     Jump to the position saved in register R (`jump-to-register').
;;
;; C-x r s R
;;     Copy region into register R (`copy-to-register').
;;
;; C-x r i R
;;      Insert text from register R (`insert-register').
;;      Insert the rectangle stored in register R (if it contains a
;;     rectangle) (`insert-register').
;;      Insert the number from register R into the buffer.
;;
;; M-x append-to-register <RET> R
;;      Append region to text in register R.
;;
;; M-x prepend-to-register <RET> R
;;      Prepend region to text in register R.
;;
;; C-x r r R
;;      Copy the region-rectangle into register R
;;      (`copy-rectangle-to-register').  With numeric argument, delete it
;;      as well.
;;
;; C-x r w R
;;      Save the state of the selected frame's windows in register R
;;      (`window-configuration-to-register').
;;
;; C-x r f R
;;      Save the state of all frames, including all their windows, in
;;      register R (`frame-configuration-to-register').
;;
;; C-u NUMBER C-x r n R
;;      Store NUMBER into register R (`number-to-register').
;;
;; C-u NUMBER C-x r + R
;;      Increment the number in register R by NUMBER
;;      (`increment-register').


;; ================ bookmarks ================
;; C-x r m <RET>
;;      Set the bookmark for the visited file, at point.
;;
;; C-x r m BOOKMARK <RET>
;;      Set the bookmark named BOOKMARK at point (`bookmark-set').
;;
;; C-x r b BOOKMARK <RET>
;;      Jump to the bookmark named BOOKMARK (`bookmark-jump').
;;
;; C-x r l
;;      List all bookmarks (`list-bookmarks').
;;
;; M-x bookmark-save
;;      Save all the current bookmark values in the default bookmark file.

;; ================ w3m ================
;; M-x w3m-print-this-url
;;    copy url to kill-buffer
