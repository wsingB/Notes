;; list operands sets


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
