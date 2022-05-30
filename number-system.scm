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


(define (add x y)
  ())

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply p)))))