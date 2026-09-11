;;; arabic-standard-azerty.el --- Quail package for Standard PC Arabic on French AZERTY

;; =====================================================================
;; VISUAL REFERENCE: STANDARD ARABIC 101/102 MAPPED TO PHYSICAL AZERTY
;; =====================================================================
;;
;; Unshifted Layer (Numbers on top row, standard Arabic PC layout):
;;
;;   AZERTY: [²] [&] [é] ["] ['] [(] [-] [è] [_] [ç] [à] [)] [=]
;;   ARABIC: [ذ] [1] [2] [3] [4] [5] [6] [7] [8] [9] [0] [-] [=]
;;
;;   AZERTY: [a] [z] [e] [r] [t] [y] [u] [i] [o] [p] [^] [$]
;;   ARABIC: [ض] [ص] [ث] [ق] [ف] [غ] [ع] [ه] [خ] [ح] [ج] [د]
;;
;;   AZERTY: [q] [s] [d] [f] [g] [h] [j] [k] [l] [m] [ù] [*]
;;   ARABIC: [ش] [س] [ي] [ب] [ل] [ا] [ت] [ن] [م] [ك] [ط] [\]
;;
;;   AZERTY: [<] [w] [x] [c] [v] [b] [n] [,] [;] [:] [!]
;;   ARABIC: [|] [ئ] [ء] [ؤ] [ر] [لا] [ى] [ة] [و] [ز] [ظ]
;;
;; Shifted Layer (Symbols on top row, standard Arabic PC layout):
;;
;;   AZERTY: [~] [1] [2] [3] [4] [5] [6] [7] [8] [9] [0] [°] [+]
;;   ARABIC: [ّ]  [!] [@] [#] [$] [%] [^] [&] [*] [)] [(] [_] [+]
;;
;;   AZERTY: [A] [Z] [E] [R] [T]  [Y] [U] [I] [O] [P] [¨] [£]
;;   ARABIC: [َ]  [ً]  [ُ]  [ٌ]  [لإ] [إ] [‘] [÷] [×] [؛] [<] [>]
;;
;;   AZERTY: [Q] [S] [D] [F] [G]  [H] [J] [K] [L] [M] [%] [µ]
;;   ARABIC: [ِ]  [ٍ]  []] [[] [لأ] [أ] [ـ] [،] [/] [:] ["] [|]
;;
;;   AZERTY: [>] [W] [X] [C] [V] [B]  [N] [?] [.] [/] [§]
;;   ARABIC: […] [~] [ْ]  [}] [{] [لآ] [آ] ['] [,] [.] [؟]
;;
;; =====================================================================

(require 'quail)

(quail-define-package
 "azerty-to-arabic" "Azerty to Arabic mapping" "AR" t
 "Standard Arabic PC layout (101 keys) mapped for physical French AZERTY."
 nil t nil nil nil nil nil nil nil nil t)

(quail-define-rules
 ;; Top row (Unshifted AZERTY -> Standard Arabic Numbers/Symbols)
 ("²" ?ذ)
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

 ;; Top row (Shifted AZERTY -> Standard Arabic Symbols)
 ("1" ?!)
 ("2" ?@)
 ("3" ?#)
 ("4" ?$)
 ("5" ?%)
 ("6" ?^)
 ("7" ?&)
 ("8" ?*)
 ("9" ?\)) ;; Reversed parenthesis logically due to RTL standard
 ("0" ?\()
 ("°" ?_)
 ("+" ?+)

 ;; First letter row (Unshifted AZERTY -> Arabic Unshifted)
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
 ("^^" ?ج) ;; Fix for dead-key behavior: handles double-tap if OS buffers it
 ("$" ?د)

 ;; Second letter row (Unshifted AZERTY -> Arabic Unshifted)
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

 ;; Third letter row (Unshifted AZERTY -> Arabic Unshifted)
 ("<" ?|)
 ("w" ?ئ)
 ("x" ?ء)
 ("c" ?ؤ)
 ("v" ?ر)
 ("b" ["لا"])
 ("n" ?ى)
 ("," ?ة)
 (";" ?و)
 (":" ?ز)
 ("!" ?ظ)

 ;; Top letter row shifted
 ("A" ?َ)
 ("Z" ?ً)
 ("E" ?ُ)
 ("R" ?ٌ)
 ("T" ["لإ"])
 ("Y" ?إ)
 ("U" ?‘)
 ("I" ?÷)
 ("O" ?×)
 ("P" ?؛)
 ("¨" ?<)
 ("£" ?>)

 ;; Middle letter row shifted
 ("Q" ?ِ)
 ("S" ?ٍ)
 ("D" ?])
 ("F" ?\[)
 ("G" ["لأ"])
 ("H" ?أ)
 ("J" ?ـ)
 ("K" ?،)
 ("L" ?/)
 ("M" ?:)
 ("%" ?\")
 ("µ" ?|)

 ;; Bottom letter row shifted
 (">" ?…)
 ("W" ?~)  ;; Standard Arabic Shift+Z maps to Tilde
 ("X" ?ْ)
 ("C" ?})
 ("V" ?{)
 ("B" ["لآ"])
 ("N" ?آ)
 ("?" ?')
 ("." ?,)
 ("/" ?.)
 ("§" ?؟)
 
 ;; Fallback for Shadda if typed via standard tilde (AltGr + é)
 ;; On Standard Arabic, Shadda is Shift+` (the key next to 1).
 ("~" ?ّ)
 )

(provide 'init-arabic)
;;; arabic-standard-azerty.el ends here
