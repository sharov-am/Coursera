#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

;; put your code below


;Write a function sequence that takes 3 arguments low, high, and stride, all assumed to be numbers.
;Further assume stride is positive. sequence produces a list of numbers from low to high (including
;low and possibly high) separated by stride and in sorted order.

(define (sequence low high stride)
   (if (> low high)
     null
     (cons low  (sequence (+ low stride) high stride))))


;Write a function string-append-map that takes a list of strings xs and a string suffix and returns a
;list of strings. Each element of the output should be the corresponding element of the input appended
;with suffix (with no extra space between the element and suffix). You must use Racket-library
;functions map and string-append.

(define (string-append-map xs suffix)
  (map (lambda(str)(string-append str suffix)) xs))


;Write a function list-nth-mod that takes a list xs and a number n. If the number is negative,
;terminate the computation with (error "list-nth-mod: negative number"). Else if the list is
;empty, terminate the computation with (error "list-nth-mod: empty list"). Else return the ith
;element of the list where we count from zero and i is the remainder produced when dividing n by the
;list's length. Library functions length, remainder, car, and list-tail are all useful { see the Racket
;documentation.
(define (list-nth-mod xs n)
   (cond [(> 0 n) error "list-nth-mod: negative number"]
         [(null? xs) error "list-nth-mod: empty list"]
         [#t (let ([rem  (remainder n  (length xs))])
                (car (list-tail xs rem)))]))


;Write a function stream-for-n-steps that takes a stream s and a number n. It returns a list holding
;the rst n values produced by s in order.

(define (stream-for-n-steps s n)
      (cond [(= n 0) null]
            [#t (cons (car (s)) (stream-for-n-steps (cdr (s)) (- n 1)))]))


;Write a stream funny-number-stream that is like the stream of natural numbers (i.e., 1, 2, 3, ...)
;except numbers divisble by 5 are negated (i.e., 1, 2, 3, 4, -5, 6, 7, 8, 9, -10, 11, ...). Remember a stream
;is a thunk that when called produces a pair. Here the car of the pair will be a number and the cdr will
;be another stream.
;NOTE. The most obvious solution and simple I came with.
(define funny-number-stream
  (letrec ([f (lambda (x) 
                (if (= (remainder x 5) 0)
                (cons (- 0 x) (lambda () (f (+ x 1))))   
                (cons x (lambda () (f (+ x 1))))))])
    (lambda () (f 1))))


;Write a stream dan-then-dog, where the elements of the stream alternate between the strings "dan.jpg"
;and "dog.jpg" (starting with "dan.jpg"). More specically, dan-then-dog should be a thunk that
;when called produces a pair of "dan.jpg" and a thunk that when called produces a pair of "dog.jpg"
;and a thunk that when called... etc.

(define dan-then-dog
    (letrec ([f (lambda (x) 
                (if (= (remainder x 2) 0)
                (cons "dan.jpg" (lambda () (f (+ x 1))))   
                (cons "dog.jpg" (lambda () (f (+ x 1))))))])
    (lambda () (f 0))))

