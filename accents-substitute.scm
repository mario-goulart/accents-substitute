(module accents-substitute (accents-substitute-latin1 accents-substitute-utf8)

(import scheme)
(cond-expand
  (chicken-4
   (import chicken)
   (use (rename accents-substitute-latin1
                (accents-substitute accents-substitute-latin1))
        (rename accents-substitute-utf8
                (accents-substitute accents-substitute-utf8))))
  (chicken-5
   (import (rename accents-substitute-latin1
                   (accents-substitute accents-substitute-latin1))
           (rename accents-substitute-utf8
                   (accents-substitute accents-substitute-utf8))))
  (else
   (error "Unsupported CHICKEN version")))

) ;; end module
