#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

;; put your code below


(define (sequence low high stride)
   (if (> low high)
     null
     (cons low  (sequence (+ low stride) high stride))))



(define (string-append-map xs suffix)
  (map (lambda(str)(string-append str suffix)) xs))

