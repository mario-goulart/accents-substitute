(cond-expand
  (chicken-4
   (use test))
  (chicken-5
   (import test))
  (else
   (error "Unsupported CHICKEN version.")))

(test-begin)
(load "test-latin1.scm")
(load "test-utf8.scm")
(test-end)

(test-exit)
