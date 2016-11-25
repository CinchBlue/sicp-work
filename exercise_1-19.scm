(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
	((even? count)
	 (fib-iter a
		   b
		   (+ (* p p) (* q q))
		   (+ (* 2 p q) (* q q))
		   (/ count 2)))
	(else (fib-iter (+ (* b q) (* a q) (* a p))
			(+ (* b p) (* a q))
			p
			q
			(- count 1)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; If you apply: a' = a(p+q)+ b(q)
;               b' = a(q)  + b(p)
; Then we will get:
;
; a'' = a(p^2 + 2pq + 2q^2) + b(2pq + q^2)
; b'' = a(2pq + q^2)        + b(p^2 + q^2)
;
; Which means that p' and q' is:
;
; p'  = p^2 + q^2
; q'  = 2pq + q^2
;
; As the (fib-iter a b p q count) requires calculating p' and q',
; we can calculate the Fibonacci-iterative reduction nicely.