; Part a: Create a (product term a inc b) procedure.
(define (product term a inc b)
  (define (iter a result)
    (if (> a b)
	result
	(* (term a) (iter (inc a) result))))
  (iter a 1))

; Define (factorial n) in terms of (product term a inc b)

; I'll define the identity and increment functions first
(define (inc x) (+ 1 x))
(define (identity x) x)

; Here's the definition of factorial:
;the sum of consecutive integers from 0 to n
(define (factorial n) (product identity 1 inc n))

; Define the pi approximation in terms of (product ...)
(define (quarter-pi-approx n)
  (define (quarter-pi-succ frac)
    (if (< frac 1)
        (/ (+ (numerator frac) 2) (denominator frac))
	(/ (numerator frac) (+ (denominator frac) 2))))
  (define (quarter-pi-term n)
    (apply-n quarter-pi-succ (/ 2 3) (- n 1)))
  (* 1.0 (product quarter-pi-term 1 inc n)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Various tests to check the approximation
(* 4 (quarter-pi-approx 1))
;Value: 2.6666666666666665

(* 4 (quarter-pi-approx 5))
;Value: 2.9257142857142857

(* 4 (quarter-pi-approx 10))
;Value: 3.2751010413348074

(* 4 (quarter-pi-approx 100))
;Value: 3.1570301764551676

(* 4 (quarter-pi-approx 1000))
;Value: 3.1431607055322663

; Anything past this takes a REALLY long time,
; since the way I programmed the successor function 
; is not so nice.



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Part b: Create the other recursive/iterative version
; of the procedure.

; Therefore, here's the recursive version.
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
	 (product term (next a) next b))))
  

