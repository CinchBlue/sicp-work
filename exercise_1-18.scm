; If b is even,
;   Double a, half b
; If b is odd,
;   Add b to a, minus 1 from b


(define (mult1 a b)
  (define (mult1-iter a b n)
    (cond ((<= b 1) (+ n a))
	  ((even? b) (mult1-iter (* 2 a) (/ b 2) n))
	  (else (mult1-iter a (- b 1) (+ n a)))))
  ; Have to make sure that b > 0
  ; Otherwise, the algorithm will not work.
  (cond ((or (= a 0) (= b 0)) 0)
	((< b 0) (mult1-iter (- 0 a) (- 0 b) 0))
	(else (mult1-iter a b 0))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; The algorithm will take THETA(log2(n)) time.
; It will continuously reduce b in log2(n) time until b <= 1.
; It will first normalize b to be positive by negating b and a
; as needed.


	
