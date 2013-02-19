#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

;; put your code below


(define (sequence low high stride)
   (if (> low high)
     null
     (cons low  (sequence (+ low stride) high stride))))



(define (string-append-map xs suffix)
  (map (lambda(str)(string-append str suffix)) xs))


(define (list-nth-mod xs n)
   (cond [(> 0 n) error "list-nth-mod: negative number"]
         [(null? xs) error "list-nth-mod: empty list"]
         [#t (let ([rem  (remainder n  (length xs))])
                (car (list-tail xs rem)))]))
         
;         
;
;(define (test_zero n)
;  (cond [(= 0 n) "zero"]
;        [#t "non zero"]))
;
;(define (silly_triple x1);x = 2
;  (letrec ([x (+ x1 3)];x = 5
;           [y (+ x 2)];y = 7
;           [z (+ y 2)]);z = 9
;    (+ x y z -5)))