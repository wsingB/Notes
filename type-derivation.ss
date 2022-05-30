(define (attach-tag type-tag contents)
  (cons type-tag contents))

(define (type-tag datum) ;; Combination type info.
  (if (pair? datum)
      (car datum)
      (error "Bad tagged datum -- TYPE-TAG" datum)))

(define (contents datum)
  (if (pair? datum)
      (cdr datum)
      (error "Bad tagged datum -- TYPE-TAG" datum)))


(define (make-vector x y)
  (cons x y))

;; how to make type's derivation.
(define rectangular?
  (lambda(z)
    (eq? (type-tag z) 'rectangular)))
(define polar?
  (lambda(z)
    (eq? (type-tag z) 'polar)))
