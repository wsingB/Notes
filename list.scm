;; list operands sets

;; get position elements
(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (-1+ n))))

(define length
  (lambda(items)
    (if (null? items)
        0
        (+ 1 (length (cdr items))))))

(define (length-iter items count)
  (if (null? items)
      count
      (length-iter (cdr items) (+ count 1))))

(define (append list-1 list-2)
  (if (null? list-1)
      list-2
      (cons (car list-1) (append (cdr list-1) list-2))))

;; processing L1: 1 2 3 4 L2: 5 6 7 8
;; cons 1 cons 2 cons 3 cons 4 cons L2

(define (reverse items)
  (define (iter items reverse-items)
    (if (null? items)
        reverse-items
        (reverse (cdr items) (cons (car items) reverse-items))))
  (iter items nil))

(define (last-pair items)
  (if (null? (cdr items))
      items
      (last-pair (cdr items))))

;;  more arguments

;; (define (f x y .z) <body>)
(define nil '())
(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items)) (map proc (cdr items)))))

;; no war !!!
;; receive common

(define (foreach proc items)
  (if (null? items)
      #t
      (and (proc (car items))
           (foreach proc (cdr items)))))

;; (define machine (lambda(f) x))
;; (f(x) x)
;; (f(f(x)))

(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else
         (+ (count-leaves (car x))
            (count-leaves (cdr x))))))


(define (deep-reverse items)
  (define (iter tree new-tree)
    (if (null? items)
        new-tree
        (let ((first (car tree)))
          (iter (cdr tree)
                (cons (if (not (pair? first))
                          first
                          (deep-reverse first))
                      new-tree)))))
  (iter items nil))
