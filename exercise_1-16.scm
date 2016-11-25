; My solution
(define (expt3 b n)
  (define (expt3-iter b n a)
    (if (= n 0)
	a
	; If even, square the base and divide exp by 2.
	; If odd, multiply a by b once and reduce exp by 1.
	(if (even? n)
	    (expt3-iter (* b b) (/ n 2) a)
	    (expt3-iter b (- n 1) (* a b)))))
  (cond ((= n 0) 1)
	((= n 1) b)
	(else (expt3-iter b n 1))))

; Another given solution (not mine)
(define (expt4 b n)
  (define (iter a b n)
    ; The base case is already a = 1 as defiend by the
    ; initial condition given by (iter 1 b n)
    (cond ((= n 0) a)
	  ((even? n) (iter a (* b b) (/ n 2)))
	  (else (iter (* a b) b (- n 1)))))
  (iter 1 b n))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; My solution covers two base cases:
; - n = 0 ==> 1
; - n = 1 ==> b
; - n > 1 ==> iterate using (expt3-iter b n 1)
; I use a as an accumulator variable, meaning that if it
; falls on 1 or below, I return a.
; Each iteration, if the exponent is even, I use the mathematical
; identity to change n to n/2 and square b.
; If the exponent is odd, I multiple a by b once and reduce
; the exponent by 1.



