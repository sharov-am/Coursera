#lang racket

(require "hw5.rkt")

(begin
 (print "test for racket to mupl value converter")
 (newline)
(equal? (racketmuplconv (cons 1 2)) (apair 1 2)) 
(equal? (racketmuplconv 1) (int 1)) 
(equal? (racketmuplconv null) (aunit))
)

(begin
 (print "test for mupl to racket value converter")
 (newline)
(equal? (muplracketconv (apair 1 2)) (cons 1 2))
(equal? (muplracketconv (int 1)) 1) 
(equal? (muplracketconv aunit) null )
)

(begin 
 (print "test for racketlist->mupllist list converter")
 (newline)
(equal? (racketlist->mupllist (list 1 2 3)) (list (int 1) (int 2) (int 3)))
(equal? (racketlist->mupllist (list 1 (cons 1 2) 3)) (list (int 1) (apair 1 2) (int 3)))
(equal? (racketlist->mupllist (list 1 (cons 1 2) null)) (list (int 1) (apair 1 2) (aunit)))
)

(begin 
 (print "test for mupllist->racketlist list converter")
 (newline)
(equal? (mupllist->racketlist (list (int 1) (int 2) (int 3))) (list 1 2 3))
(equal? (mupllist->racketlist (list (int 1) (apair 1 2) (int 3)))  (list 1 (cons 1 2) 3)) 
(equal? (mupllist->racketlist (list (int 1) (apair 1 2) (aunit))) (list 1 (cons 1 2) null)) 
)




; a test case that uses problems 1, 2, and 4
; should produce (list (int 10) (int 11) (int 16))
;(define test1
;  (mupllist->racketlist
;   (eval-exp (call (call mupl-mapAddN (int 7))
;                   (racketlist->mupllist 
;                    (list (int 3) (int 4) (int 9)))))))
