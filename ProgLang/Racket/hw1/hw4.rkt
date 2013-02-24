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
;NOTE. The most obvious and simple solution I came with.
(define funny-number-stream
  (letrec ([f (lambda (x) 
                (if (= (remainder x 5) 0)
                (cons (- 0 x) (lambda () (f (+ x 1))))   
                (cons x (lambda () (f (+ x 1))))))])
    (lambda () (f 0))))


;Write a stream dan-then-dog, where the elements of the stream alternate between the strings "dan.jpg"
;and "dog.jpg" (starting with "dan.jpg"). More specically, dan-then-dog should be a thunk that
;when called produces a pair of "dan.jpg" and a thunk that when called produces a pair of "dog.jpg"
;and a thunk that when called... etc.

(define dan-then-dog
    (letrec ([f (lambda (x) 
                (if (even? x)
                (cons "dan.jpg" (lambda () (f (+ x 1))))   
                (cons "dog.jpg" (lambda () (f (+ x 1))))))])
    (lambda () (f 0))))



;Write a function stream-add-zero that takes a stream (assoc v lst [is-equal?]s and returns another stream. If s would
;produce v for its ith element, then (stream-add-zero s) would produce the pair (0 . v) for its ith
;element. Sample solution: 4 lines.

(define (stream-add-zero s)
       (letrec ([f (lambda(x)
                (lambda() (cons (cons 0 (car (x))) (f (cdr (x))))))])
      (f s)))


;Write a function cycle-lists that takes two lists xs and ys and returns a stream. The lists may or
;may not be the same length, but assume they are both non-empty. The elements produced by the
;stream are pairs where the rst part is from xs and the second part is from ys. The stream cycles
;forever through the lists. For example, if xs is '(1 2 3) and ys is '("a" "b"), then the stream
;would produce, (1 . "a"), (2 . "b"), (3 . "a"), (1 . "b"), (2 . "a"), (3 . "b"), (1 . "a"),
;(2 . "b"), etc.

(define (cycle-lists xs ys)
     (letrec([f (lambda(n)
                (lambda() (cons  (cons (list-nth-mod xs n) (list-nth-mod ys n)) (f (+ n 1)) )))])
     (f 0 )))




;Write a function vector-assoc that takes a value v and a vector vec. It should behave like Racket's
;assoc library function except (1) it processes a vector (Racket's name for an array) instead of a list and
;(2) it allows vector elements not to be pairs in which case it skips them. Process the vector elements
;in order starting from 0. You must use library functions vector-length, vector-ref, and equal?.
;Return #f if no vector element is a pair with a car eld equal to v, else return the rst pair with an
;equal car eld. Sample solution is 9 lines, using one local recursive helper function.

(define (vector-assoc v vec)
         (letrec  ([len (vector-length vec)]
                   [f (lambda(current)
                     (cond[(= current len) #f]
                          [(pair? (vector-ref vec current)) (if (equal? (car (vector-ref vec current)) v)
                                                                (vector-ref vec current)
                                                                (f (+ current 1)))]
                          [#t (f (+ current 1))]))])
         (f 0)))


;Write a function cached-assoc that takes a list xs and a number n and returns a function that takes
;one argument v and returns the same thing that (assoc v xs) would return. However, you should
;use an n-element cache of recent results to possibly make this function faster than just calling assoc (if
;xs is long and a few elements are returned often). The cache must be a Racket vector of length n that
;is created by the call to cached-assoc (use Racket library function vector) and used-and-possibly-
;mutated each time the function returned by cached-assoc is called.

(define (cached-assoc xs n)
         (letrec([cache (make-vector n)]
                 [cacheslot 0]
                 [f (lambda(x)
                      (cond [(vector-assoc x cache)] ;check cache, if succeded return cached value
                            [(let([temp (vector-assoc x xs)])
                             (if temp
                                 (begin 
                                   (vector-set! cache cacheslot temp)
                                   (set! cacheslot (remainder (+ cacheslot 1) (vector-length cache)))
                                   temp);begin end
                                    #f))]
                            [#t #f]))]) ;this artificially addition because if in prevoius condition returned false as result
                             f))        ;cond coninues evaluating branches, so last statement need to return false 
                                  




(define-syntax while-less
  (syntax-rules (do)
    [(while-lees e1 do e2)
     (let ([t1 e1])
       (letrec ([loop (lambda (t2)
                        (if (>= t2 t1)
                            #t
                            (loop e2)))])
         (loop e2)))]))
