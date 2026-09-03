;;; arabic-azerty.el --- Quail package for Standard Arabic on French AZERTY

;; =====================================================================
;; VISUAL REFERENCE: STANDARD ARABIC MAPPING ON PHYSICAL FRENCH AZERTY
;; =====================================================================
;;
;; Unshifted Layer:
;;
;;   AZERTY: [²] [&] [é] ["] ['] [(] [-] [è] [_] [ç] [à] [)] [=]
;;   ARABIC: [ذ] [&] [é] ["] ['] [(] [-] [è] [_] [ç] [à] [)] [=]
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
;; Shifted Layer:
;;
;;   AZERTY: [1] [2] [3] [4] [5] [6] [7] [8] [9] [0] [°] [+]
;;   ARABIC: [1] [2] [3] [4] [5] [6] [7] [8] [9] [0] [°] [+]
;;
;;   AZERTY: [A] [Z] [E] [R] [T]  [Y] [U] [I] [O] [P] [¨] [£]
;;   ARABIC: [َ]  [ً]  [ُ]  [ٌ]  [لإ] [إ] [‘] [÷] [×] [؛] [<] [>]
;;
;;   AZERTY: [Q] [S] [D] [F] [G]  [H] [J] [K] [L] [M] [%] [µ]
;;   ARABIC: [ِ]  [ٍ]  []] [[] [لأ] [أ] [ـ] [،] [/] [:] ["] [|]
;;
;;   AZERTY: [>] [W] [X] [C] [V] [B]  [N] [?] [.] [/] [§]
;;   ARABIC: […] [ّ]  [ْ]  [}] [{] [لآ] [آ] ['] [,] [.] [؟]
;;
;; =====================================================================

(require 'quail)

(quail-define-package
 "arabic-azerty" "Arabic" "AR-AZ" t
 "Standard Arabic PC layout mapped for physical French AZERTY (with AZERTY numbers)."
 nil t nil nil nil nil nil nil nil nil t)

(quail-define-rules
 ;; Top row (Unshifted AZERTY -> AZERTY Unshifted, except Thal)
 ("²" ?ذ)
 ("&" ?&)
 ("é" ?é)
 ("\"" ?\")
 ("'" ?')
 ("(" ?\()
 ("-" ?-)
 ("è" ?è)
 ("_" ?_)
 ("ç" ?ç)
 ("à" ?à)
 (")" ?\))
 ("=" ?=)

 ;; Top row (Shifted AZERTY -> AZERTY Shifted)
 ("1" ?1)
 ("2" ?2)
 ("3" ?3)
 ("4" ?4)
 ("5" ?5)
 ("6" ?6)
 ("7" ?7)
 ("8" ?8)
 ("9" ?9)
 ("0" ?0)
 ("°" ?°)
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
 ("b" "لا")
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
 ("T" ["لإ"])
 ("Y" ?إ)
 ("U" ?‘)
 ("I" ?÷)
 ("O" ?×)
 ("P" ?؛)
 ("¨" ?<)
 ("£" ?>)

 ;; Middle letter row shifted (Q S D F G H J K L M % µ)
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

 ;; Bottom letter row shifted (W X C V B N , ; : !)
 (">" ?…)
 ("W" ?ّ) 
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
 ("~" ?ّ)
 )

(provide 'init-arabic-azerty)
;;; arabic-azerty.el ends here
