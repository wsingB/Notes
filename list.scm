(define map
  (lambda(proc items)
    (if (null? items)
        nil
        (cons (map proc (proc items))))))
