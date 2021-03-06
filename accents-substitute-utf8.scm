(module accents-substitute-utf8 (accents-substitute)

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
  '(("ã" "a" "&atilde;")
    ("Ã" "A" "&Atilde;")
    ("á" "a" "&aacute;")
    ("Á" "A" "&Aacute;")
    ("â" "a" "&acirc;")
    ("Â" "A" "&Acirc;")
    ("à" "a" "&agrave;")
    ("À" "A" "&Agrave;")
    ("ä" "a" "&auml;")
    ("Ä" "A" "&Auml;")
    ("é" "e" "&eacute;")
    ("É" "E" "&Eacute;")
    ("ê" "e" "&ecirc;")
    ("Ê" "E" "&Ecirc;")
    ("è" "e" "&egrave;")
    ("È" "E" "&Egrave;")
    ("ë" "e" "&euml;")
    ("Ë" "E" "&Euml;")
    ("í" "i" "&iacute;")
    ("Í" "I" "&Iacute;")
    ("î" "i" "&icirc;")
    ("Î" "I" "&Icirc;")
    ("ì" "i" "&igrave;")
    ("Ì" "I" "&Igrave;")
    ("ï" "i" "&iuml;")
    ("Ï" "I" "&Iuml;")
    ("õ" "o" "&otilde;")
    ("Õ" "O" "&Otilde;")
    ("ó" "o" "&oacute;")
    ("Ó" "O" "&Oacute;")
    ("ô" "o" "&ocirc;")
    ("Ô" "O" "&Ocirc;")
    ("ò" "o" "&ograve;")
    ("Ò" "O" "&Ograve;")
    ("ö" "o" "&ouml;")
    ("Ö" "O" "&Ouml;")
    ("ú" "u" "&uacute;")
    ("Ú" "U" "&Uacute;")
    ("û" "u" "&ucirc;")
    ("Û" "U" "&Ucirc;")
    ("ù" "u" "&ugrave;")
    ("Ù" "U" "&Ugrave;")
    ("ü" "u" "&uuml;")
    ("Ü" "U" "&Uuml;")
    ("ç" "c" "&ccedil;")
    ("Ç" "C" "&Ccedil;")
    ("İ" "I" "&#x0130")
    ("ı" "i" "&#x0131")
    ("Ğ" "G" "&#x011e")
    ("ğ" "g" "&#x011f")
    ("Ş" "S" "&#x015e")
    ("ş" "s" "&#x015f")))

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
