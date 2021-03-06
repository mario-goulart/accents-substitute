(module accents-substitute-latin1 (accents-substitute)

(import scheme)
(cond-expand
  (chicken-4
   (import chicken))
  (chicken-5
   (import (chicken base)))
  (else
   (error "Unsupported CHICKEN version.")))

(include "accents-substitute-common.scm")

(define accents-conv
  '(("�" "a" "&atilde;")
    ("�" "A" "&Atilde;")
    ("�" "a" "&aacute;")
    ("�" "A" "&Aacute;")
    ("�" "a" "&acirc;")
    ("�" "A" "&Acirc;")
    ("�" "a" "&agrave;")
    ("�" "A" "&Agrave;")
    ("�" "a" "&auml;")
    ("�" "A" "&Auml;")
    ("�" "e" "&eacute;")
    ("�" "E" "&Eacute;")
    ("�" "e" "&ecirc;")
    ("�" "E" "&Ecirc;")
    ("�" "e" "&egrave;")
    ("�" "E" "&Egrave;")
    ("�" "e" "&euml;")
    ("�" "E" "&Euml;")
    ("�" "i" "&iacute;")
    ("�" "I" "&Iacute;")
    ("�" "i" "&icirc;")
    ("�" "I" "&Icirc;")
    ("�" "i" "&igrave;")
    ("�" "I" "&Igrave;")
    ("�" "i" "&iuml;")
    ("�" "I" "&Iuml;")
    ("�" "o" "&otilde;")
    ("�" "O" "&Otilde;")
    ("�" "o" "&oacute;")
    ("�" "O" "&Oacute;")
    ("�" "o" "&ocirc;")
    ("�" "O" "&Ocirc;")
    ("�" "o" "&ograve;")
    ("�" "O" "&Ograve;")
    ("�" "o" "&ouml;")
    ("�" "O" "&Ouml;")
    ("�" "u" "&uacute;")
    ("�" "U" "&Uacute;")
    ("�" "u" "&ucirc;")
    ("�" "U" "&Ucirc;")
    ("�" "u" "&ugrave;")
    ("�" "U" "&Ugrave;")
    ("�" "u" "&uuml;")
    ("�" "U" "&Uuml;")
    ("�" "c" "&ccedil;")
    ("�" "C" "&Ccedil;")))

(define accents->ascii
  (map (lambda (item)
         (cons (car item) (cadr item)))
       accents-conv))

(define accents->html
  (map (lambda (item)
         (cons (irregex (car item)) (caddr item)))
       accents-conv))

(define (accents-substitute str #!key mode)
  (if mode
      (case mode
        ((html) (string-substitute* str accents->html))
        ((ascii) (string-translate* str accents->ascii))
        (else (error 'accents-substitute "Unknown mode: " mode)))
      (string-translate* str accents->ascii)))

) ; end module
