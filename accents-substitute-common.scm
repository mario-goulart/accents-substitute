(cond-expand
  (chicken-4
   (import chicken data-structures irregex))
  (chicken-5
   (import (chicken irregex)
           (chicken string)))
  (else
   (error "Unsupported CHICKEN version.")))

(define (string-substitute* str replacement-alist)
  (let loop ((replacements replacement-alist))
    (unless (null? replacements)
      (let ((replacement (car replacements)))
        (set! str
          (irregex-replace/all (car replacement) str (cdr replacement)))
        (loop (cdr replacements)))))
  str)
