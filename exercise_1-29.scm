; f    = the function
; y_k  = f of (a + k*h)
; h    = (b - a)/n
; a, b = lower, upper bound



; assume that n is even
(define (simpsons-integral f a b n)
  ; Define the constant h
  (define h (/ (- b a) n))
  ; Define how to compute the sub-term y_k,
  ; which is actually dependent on h
  (define (y_k f a k)
    (f (+ a (* k h))))
  ; Define the sub-sum
  (define (simpson-sum f a b n i)
    ; The coefficients for the i = 0 and i = n case is 0.
    ; Otherwise, if i is even, it's 2.0
    ; and if i is odd, it's 4.0
    (cond ((= i 0) (+ (y_k f a 0)
		      (simpson-sum f a b n 1)))
	  ((and (> i 0) (< i n) (even? i)) (+ (* 2.0 (y_k f a i))
					      (simpson-sum f a b n (+ i 1))))
	  ((and (> i 0) (< i n) (odd? i)) (+ (* 4.0 (y_k f a i))
					     (simpson-sum f a b n (+ i 1))))
	  (else (y_k f a n))))
  ; Finally, we return the expression
  ; that approximates the integral according to the formula.
  (* (/ h 3.0)
     (simpson-sum f a b n 0)))
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Define the (cube x) function to test with.
(define (cube x) (* x x x))

; Evaluate Simpson's Rule compared to the integral code
; given in Section 1.3

; Here's the code from section 1.3
(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

; Here is for n = 100
(simpsons-integral cube 0 1 100)
;Value: .24999999999999992
(integral cube 0 1 0.01)
;Value: .24998750000000042

; Here is for n = 1000
(simpsons-integral cube 0 1 1000)
;Value: .2500000000000002
(integral cube 0 1 0.001)
;Value: .249999875000001


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; In general, it appears that the Simpson's Rule
; method of numerical integration is more accurate
; than the other formula.

; The error for both decrases as the n/dx rguments
; are increased, as expected.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;









