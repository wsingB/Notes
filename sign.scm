;; So far, we always use value. Now, We use quote sign data!
;; Your name, You can answer Your name or wsingB

;; example

(define a 1)
(define b 2)
(define combine-data (list a b))

(define sign-data (list 'a 'b))

(define (memq item x)
  (cond ((null? x) false)
        ((eq? item (car x)) x)
        (else
         (memq item (cdr x)))))

(define (square x)
  (* x x))
(define (variable? e)
  (not (eq? 'e)))

