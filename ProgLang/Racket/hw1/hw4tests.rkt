#lang racket

(require "hw4.rkt") 

;; A simple library for displaying a 2x3 grid of pictures: used
;; for fun in the tests below (look for "Tests Start Here").

(require (lib "graphics.rkt" "graphics"))

(open-graphics)

(define window-name "Programming Languages, Homework 4")
(define window-width 700)
(define window-height 500)
(define border-size 100)

(define approx-pic-width 200)
(define approx-pic-height 200)
(define pic-grid-width 3)
(define pic-grid-height 2)

(define (open-window)
  (open-viewport window-name window-width window-height))

(define (grid-posn-to-posn grid-posn)
  (when (>= grid-posn (* pic-grid-height pic-grid-width))
    (error "picture grid does not have that many positions"))
  (let ([row (quotient grid-posn pic-grid-width)]
        [col (remainder grid-posn pic-grid-width)])
    (make-posn (+ border-size (* approx-pic-width col))
               (+ border-size (* approx-pic-height row)))))

(define (place-picture window filename grid-posn)
  (let ([posn (grid-posn-to-posn grid-posn)])
    ((clear-solid-rectangle window) posn approx-pic-width approx-pic-height)
    ((draw-pixmap window) filename posn)))

(define (place-repeatedly window pause stream n)
  (when (> n 0)
    (let* ([next (stream)]
           [filename (cdar next)]
           [grid-posn (caar next)]
           [stream (cdr next)])
      (place-picture window filename grid-posn)
      (sleep pause)
      (place-repeatedly window pause stream (- n 1)))))

;; Tests Start Here

; These definitions will work only after you do some of the problems
; so you need to comment them out until you are ready.
; Add more tests as appropriate, of course.

(define nums (sequence 0 5 1))

(define files (string-append-map 
               (list "dan" "dog" "curry" "dog2") 
               ".jpg"))

(define funny-test (stream-for-n-steps funny-number-stream 16))

; a zero-argument function: call (one-visual-test) to open the graphics window, etc.
(define (one-visual-test)
  (place-repeatedly (open-window) 0.5 (cycle-lists nums files) 27))

; similar to previous but uses only two files and one position on the grid
(define (visual-zero-only)
  (place-repeatedly (open-window) 0.5 (stream-add-zero dan-then-dog) 27))






(begin
 (print "test for stream-for-n-steps funny-number-stream")
 (newline)
(equal? (stream-for-n-steps funny-number-stream 5) (list 0 1 2 3 4)) 
(equal? (stream-for-n-steps funny-number-stream 16) (list 0 1 2 3 4 -5 6 7 8 9 -10 11 12 13 14 -15)) 
(equal? (stream-for-n-steps funny-number-stream 0) (list))
)

(begin
 (print "test stream-for-n-steps dan-then-dog")
 (newline)
(equal? (stream-for-n-steps dan-then-dog 1) (list "dan.jpg")) 
(equal? (stream-for-n-steps dan-then-dog 2) (list "dan.jpg" "dog.jpg")) 
(equal? (stream-for-n-steps dan-then-dog 3) (list "dan.jpg" "dog.jpg" "dan.jpg")) 
(equal? (stream-for-n-steps dan-then-dog 0) (list))
)

(define vectest (vector 1 "g" "dsa" (cons "dsa" "asd") (cons 1 2)  (cons 2 3) (cons 2 3) (cons 3 "dsad") (cons 3 3) ))
(begin
 (print "test vector-assoc")
 (newline)
(equal? (vector-assoc 1 vectest)  (cons 1 2)) 
(equal? (vector-assoc "g" vectest) #f) 
(equal? (vector-assoc "dsa" vectest) (cons "dsa" "asd")) 
(equal? (vector-assoc 3 vectest) (cons 3 "dsad"))
)


(define veclist (list 1 "g" "dsa" (cons "dsa" "asd") (cons 1 2)  (cons 2 3) (cons 2 3) (cons 3 "dsad") (cons 3 3) ))
(begin
 (print "test cached-assoc")
 (newline)
 (define closure (cached-assoc  veclist 2))
 (equal? (closure 1)   (cons 1 2)) 
 (equal? (closure "g")  #f) 
 (equal? (closure "dsa") (cons "dsa" "asd")) 
 (equal? (closure 3) (cons 3 "dsad"))
 )



