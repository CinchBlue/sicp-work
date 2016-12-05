; Define (sum term a next b) such that it uses iteration
; instead of recursion.
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(+ (term a) (iter (next a) result))))
    (iter a 0))

; Test case: (square 3) + (square 4) = (square 5)
(define (square x) (* x x))
(define (inc x) (+ x 1))

; Does it work? Yes.
(sum square 3 inc 4)
;Value: 25
