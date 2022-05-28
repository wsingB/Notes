(define real-part car)
(define imag-part cdr)

(define add-complex
  (lambda(z1 z2)
    (+ (real-part z1)
       (real-part z2))
    (+ (imag-part z1)
       (imag-part z2))))

(define (magnitude z)
  (sqrt (+ (square (real-part z)) (square z))))
(define angle
  (lambda(z) (atan (imag-part z) (real-part z))))

(define sub-complex
  (lambda(z1 z2)
    (make-real-imag-from
    (- (real-part z1)
       (real-part z2))
    (- (imag-part z1)
       (imag-part z2)))))


(define mul-complex
  (lambda(z1 z2)
    ((* (magnitude z1)
        (magnitude z2))
    (+ (angle z1)
       (angle z2)))))
(define (make-real-imag-from real imag)
  (cons real imag))