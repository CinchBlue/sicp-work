(define (square x)
  (* x x))

(define (sum-of-squares y)
  (apply + (map square y)))
