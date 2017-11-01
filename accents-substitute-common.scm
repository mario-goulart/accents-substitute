(import irregex)

(define (string-substitute* str replacement-alist)
  (let loop ((replacements replacement-alist))
    (unless (null? replacements)
      (let ((replacement (car replacements)))
        (set! str
          (irregex-replace/all (car replacement) str (cdr replacement)))
        (loop (cdr replacements)))))
  str)
