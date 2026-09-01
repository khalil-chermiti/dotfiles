;;; arabic-olpc-azerty.el --- Quail package for Arabic OLPC on French AZERTY

;; =====================================================================
;; VISUAL REFERENCE: ARABIC OLPC MAPPING ON PHYSICAL FRENCH AZERTY
;; =====================================================================
;;
;; Unshifted Layer:
;;
;;   AZERTY: [²] [&] [é] ["] ['] [(] [-] [è] [_] [ç] [à] [)] [=]
;;   OLPC:   [`] [1] [2] [3] [4] [5] [6] [7] [8] [9] [0] [-] [=]
;;
;;   AZERTY: [a] [z] [e] [r] [t] [y] [u] [i] [o] [p] [^] [$]
;;   OLPC:   [ض] [ص] [ث] [ق] [ف] [غ] [ع] [ه] [خ] [ح] [ج] [د]
;;
;;   AZERTY: [q] [s] [d] [f] [g] [h] [j] [k] [l] [m] [ù] [*]
;;   OLPC:   [ش] [س] [ي] [ب] [ل] [ا] [ت] [ن] [م] [ك] [ط] [\]
;;
;;   AZERTY: [<] [w] [x] [c] [v] [b] [n] [,] [;] [:] [!]
;;   OLPC:   [|] [ئ] [ء] [ؤ] [ر] [ذ] [ى] [ة] [و] [ز] [ظ]
;;
;; Shifted Layer:
;;
;;   AZERTY: [1] [2] [3] [4] [5] [6] [7] [8] [9] [0] [°] [+]
;;   OLPC:   [!] [@] [#] [$] [%] [£] [€] [*] [)] [(] [_] [+]
;;
;;   AZERTY: [A] [Z] [E] [R] [T] [Y] [U] [I] [O] [P] [¨] [£]
;;   OLPC:   [َ] [ً] [ُ] [ٌ] [ّ] [إ] [`] [÷] [×] [؛] [}] [{]
;;
;;   AZERTY: [Q] [S] [D] [F] [G] [H] [J] [K] [L] [M] [%] [µ]
;;   OLPC:   [>] [<] [ ] [ [] [&] [أ] [-] [،] [/] [:] [\] [|]
;;
;;   AZERTY: [>] [W] [X] [C] [V] [B] [N] [?] [.] [/] [§]
;;   OLPC:   […] [~] [ْ] [ِ] [ٍ] [^] [آ] ['] [,] [.] [؟]
;;
;; =====================================================================

(require 'quail)

(quail-define-package
 "arabic-azerty-olpc" "Arabic" "AR-OLPC" t
 "Arabic OLPC layout mapped for physical French AZERTY."
 nil t nil nil nil nil nil nil nil nil t)

(quail-define-rules
 ;; Top row (Unshifted AZERTY -> OLPC Numbers & Symbols)
 ;; NB: I choose western numbers
 ("²" ?`)
 ("&" ?1)
 ("é" ?2)
 ("\"" ?3)
 ("'" ?4)
 ("(" ?5)
 ("-" ?6)
 ("è" ?7)
 ("_" ?8)
 ("ç" ?9)
 ("à" ?0)
 (")" ?-)
 ("=" ?=)

 ;; Top row (Shifted AZERTY -> OLPC Shifted Symbols)
 ("1" ?!)
 ("2" ?@)
 ("3" ?#)
 ("4" ?$)
 ("5" ?%)
 ("6" ?£)
 ("7" ?€)
 ("8" ?*)
 ("9" ?\))
 ("0" ?\()
 ("°" ?_)
 ("+" ?+)

 ;; First letter row (Unshifted AZERTY -> OLPC Unshifted)
 ("a" ?ض)
 ("z" ?ص)
 ("e" ?ث)
 ("r" ?ق)
 ("t" ?ف)
 ("y" ?غ)
 ("u" ?ع)
 ("i" ?ه)
 ("o" ?خ)
 ("p" ?ح)
 ("^" ?ج)
 ("$" ?د)

 ;; Second letter row (Unshifted AZERTY -> OLPC Unshifted)
 ("q" ?ش)
 ("s" ?س)
 ("d" ?ي)
 ("f" ?ب)
 ("g" ?ل)
 ("h" ?ا)
 ("j" ?ت)
 ("k" ?ن)
 ("l" ?م)
 ("m" ?ك)
 ("ù" ?ط)
 ("*" ?\\)

 ;; Third letter row (Unshifted AZERTY -> OLPC Unshifted)
 ("<" ?|)
 ("w" ?ئ)
 ("x" ?ء)
 ("c" ?ؤ)
 ("v" ?ر)
 ("b" ?ذ)   ;; Arabic Thal mapped to 'b' key (OLPC specific)
 ("n" ?ى)
 ("," ?ة)
 (";" ?و)
 (":" ?ز)
 ("!" ?ظ)

 ;; Top letter row shifted (A Z E R T Y U I O P ^ $)
 ("A" ?َ)
 ("Z" ?ً)
 ("E" ?ُ)
 ("R" ?ٌ)
 ("T" ?ّ)
 ("Y" ?إ)
 ("U" ?`)
 ("I" ?÷)
 ("O" ?×)
 ("P" ?؛)
 ("¨" ?})
 ("£" ?{)

 ;; Middle letter row shifted (Q S D F G H J K L M % µ)
 ("Q" ?>)
 ("S" ?<)
 ("D" ?])
("F" ?[)
 ("G" ?&)
 ("H" ?أ)
 ("J" ?-)
 ("K" ?،)
 ("L" ?/)
 ("M" ?:)
 ("%" ?\")
 ("µ" ?|)

 ;; Bottom letter row shifted (W X C V B N , ; : !)
 (">" ?…)
 ("W" ?~)
 ("X" ?ْ)
 ("C" ?ِ)
 ("V" ?ٍ)
 ("B" ?^)
 ("N" ?آ)
 ("?" ?')
 ("." ?,)
 ("/" ?.)
 ("§" ?؟)
 )

(provide 'init-arabic-azerty-olpc)
;;; arabic-olpc-azerty.el ends here
