(define square
  (lambda(x) (* x x)))

(define sum-fo-squares
  (lambda(x y)
    (+ (square x)
       (square y))))
;; withdraw
(define (make-withdraw balance)
  (lambda(amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount)) balance) ;; begin order apply value.
        "Insufficient funds")))
