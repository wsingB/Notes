;; tag data
;; datum is combine data.
(define (attach-tag type-tag contents)
  (cons type-tag contents))
(define (type-tag datum)
  (if (pair? datum)
      (car datum)
      (error "Bad tagged datum -- TYPE-TAG" datum)))
(define (contents datum)
  (if (pair? datum)
      (cdr datum)
      (error "Bad tagged datum -- TYPE-TAG" datum)))
;; cases
;; rectangular case
(define (rectangular? data)
  (eq? (type-tag data) 'rectangular))
;; polar
(define (polar? data)
  (eq? (type-tag data) 'polar))


(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (error
           "No method for these type -- APPLY-GENERIC" (list op type-tags))))))

(define (make-from-real-imag x y)
  (define (dispatch op)
    (cond
     ((eq? op 'real-part) x)
     ((eq? op 'imag-part) y)
     ((eq? op 'angle)     (atan y x))
     ((eq? op 'magnitude) (sqrt (+ (square x) (square y))))
     (else
      (error "Unknown op --MAKE-FROM-REAL-IMAG" op))))
  dispatch)
;; because of those datum will be return a function.
(define (apply-generic-message arg op) (arg op))


;; operand type-tag
(define put
  (lambda(op tag item)))


;; define scheme number system
(define (add x y) (apply-generic 'add x y))
(define (sub x y) (apply-generic 'sub x y))
(define (mul x y) (apply-generic 'mul x y))
(define (div x y) (apply-generic 'div x y))

;; define package

(define (install-package-scheme-number)
  (define (tag x)
    (attach-tag 'scheme-number))
  (put 'add '(scheme-number scheme-number)
       (lambda(x y) (+ x y)))
  (p))
