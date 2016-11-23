(define (inc x) (+ 1 x))
;Value: inc

(define (dec x) (- x 1))
;Value: dec

(define (add1 a b)
  (if (= a 0)
      b
      (inc (add1 (dec a) b))))
;Value: add1

(define (add2 a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))
;Value: add2

(add1 4 5)
;Value: 9

(add2 4 5)
;Value: 9

; Since (add1) has (inc) before the recursive call,
; I believe that it is actually a recursive process.
; This is because an (inc) operation is applied per
; recursive call, meaning that the call tree must keep track of
; how many times the call stack is nested.
;
; In other words, (add1) does not make use of tail-call optimization.
;
; (add2) has a recursive call, but it does not have any additional
; procedure calls on the recursive call itself.
; We can also we that (add2) applies procedures only to its tail-call
; recursion arguments, meaning that it will be able to be turned into
; an iterative process.
;
; Overall, (add1) is recursive, and (add2), making use of tail-recursion,
; can be framed as iterative.

