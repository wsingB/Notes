(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)                                        ; 化简 a1=0 ret a2
        ((=number? a2 0) a1)                                        ; same case
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)                    ; *0 = 0
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))

(define (=number? exp num)                                          ; 数字判断
  (and (number? exp) (= exp num)))

(define (variable? x) (symbol? x))                                  ; 符号检查

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))


(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (addend s) (cadr s))
(define (augend s) (caddr s))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))
(define (multiplicand p) (caddr p))
; 传入一个表达式
; 求导的规则: 
;           (x ^ n)' = (n - 1)x^(n-1)
;           (n * x)' = n 
;           (nx + x)' = n + 1
;           (x*y)'   = x'y + xy'
;           C'       = 0
(define (deriv exp var) 
  (cond ((number? exp) 0)                                            ; 如果是常数返回0  
        ((variable? exp)
         (if (same-variable? exp var) 1 0))                          ; 同一个变量 符合规则一 其实也可以用列表存起来
        ((sum? exp)                                                  ; 加法求导 将表达式分为两个部分分别求导
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)                                              ; 乘法求导
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicand exp))))
        (else
         (error "unknown expression type -- DERIV" exp))))
