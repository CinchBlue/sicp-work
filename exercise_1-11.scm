(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
	 (* 2 (f (- n 2)))
	 (* 3 (f (- n 3))))))
;value f

; Recursion goes until the tree nodes reach the base case(s).
; Iteration requires looping until a certain termination state is reached.
; Our termination state will be when count >= n

; Testing appears to work.
(define (f-iter n)
  ; iterate until count >= n
  (define (iter count a b c)
    ; if count >= n, terminate
    ; otherwise, accumulate within a and recurse
    (if (>= count n)
	a
	(iter (+ count 1) 
	      (+ a (* 2 b) (* 3 c))
	      a
	      b)))
  ; perform the acutal procedure
  (define init-count 2)
  (if (<= n init-count)
      n
      (iter init-count 2 1 0)))









