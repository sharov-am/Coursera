#lang racket
 
(require rackunit "hw5.rkt")
(require rackunit/text-ui)
 
(define hw5-tests
(test-suite
"Tests for HW 5"
(test-equal? "MUPL list -> Racket list #1"
(list (int 3) (int 4) (int 9))
(mupllist->racketlist (apair (int 3) (apair (int 4) (apair (int 9) (aunit))))))
 
(test-equal? "MUPL list -> Racket list #2"
(apair (list (int 42) (var "x")) (apair (list (int 43) (var "y")) (aunit)))
(racketlist->mupllist (list (list (int 42) (var "x")) (list (int 43) (var "y"))))
)
 
(test-equal? "R list -> M list #3"
(apair (var "foo") (apair (int 17) (aunit)))
(racketlist->mupllist (list (var "foo") (int 17))))
 
 
(test-case "List tests"
; racketlist->mupllist
(check-equal? (racketlist->mupllist '(1 2 3 4))
(apair 1 (apair 2 (apair 3 (apair 4 (aunit))))) "simple racketlist")
(check-equal? (racketlist->mupllist '()) (aunit) "empty racketlist")
; mupllist->racketlist
(check-equal? (mupllist->racketlist (apair 1 (apair 2 (apair 3 (apair 4 (aunit))))))
'(1 2 3 4) "simple mupllist")
(check-equal? (mupllist->racketlist (aunit)) '() "empty mupllist")
)
(test-equal? "Local scoping"
(int 2)
(eval-exp (mlet "f1"
(fun "f1" "a" (mlet "x" (var "a") (fun "f2" "z" (add (var "x") (int 1)))))
(mlet "f3" (fun "f3" "f" (mlet "x" (int 1729) (call (var "f") (aunit))))
(call (var "f3") (call (var "f1") (int 1)))))))
 
(test-equal? "basic-call"
(int 43)
(eval-exp (call (fun "incr" "x" (add (var "x") (int 1))) (int 42))))
(test-equal? "ifgreater with invalid e4"
(int 0)
(eval-exp (ifgreater (add (int 2) (int 2)) (add (int 2) (int 1)) (add (int 3) (int -3)) (add "wrong" "bad"))))
 
(test-equal? "fst/snd test"
(apair (int 1) (int 4))
(eval-exp (apair (fst (apair (int 1) (int 2)))
(snd (apair (int 3) (int 4))) )))
 
(test-equal? "Sum over list"
(int 6)
(eval-exp (mlet "fnc"
(fun "f1" "x"
(ifgreater (isaunit (var "x")) (int 0)
(int 0)
(add (fst (var "x")) (call (var "f1") (snd (var "x"))))))
(call (var "fnc") (apair (int 1) (apair (int 2) (apair (int 3) (aunit))))))))
 
(test-equal? "ifaunit test #1"
(int 2)
(eval-exp (ifaunit (aunit) (int 2) (int 3))))
 
(test-equal? "ifaunit test #2"
(int 3)
(eval-exp (ifaunit (int 3) (int 2) (int 3))))
(test-case "mlet"
(check-equal? (int 1)
(eval-exp (mlet* (cons (cons "x" (int 1)) null) (var "x")))
)
 
(check-equal?
(int 20)
(eval-exp (mlet* (list (cons "f" (int 2)) (cons "y" (int 15))) (add (var "f") (add (var "y") (int 3)))))
))
 
(test-case "ifeq"
(check-equal? (int 1)
(eval-exp (ifeq (int 2) (add (int 1) (int 1)) (int 1) (int 2)))
)
 
(check-equal?
(int 2)
(eval-exp (ifeq (int 2) (add (int 1) (int 2)) (int 1) (int 2)))))
 
;(test-case "mupl-map"
;(define addtwo (fun "addone" "x" (add (var "x") (int 2))))
;(define mupl-map-addtwo (call mupl-map addtwo))
;(check-equal? (eval-exp (call mupl-map-addtwo (aunit))) (aunit))
; 
;(define my-mupl-list (apair (int 23) (apair (int 42) (aunit))))
;(define my-answers (apair (int 25) (apair (int 44) (aunit))))
;(check-equal? (eval-exp (call mupl-map-addtwo my-mupl-list)) my-answers))
; 
;(test-case "mupl-mapAddN"
;(define input (apair (int 25) (apair (int 44) (aunit))))
;(define output (apair (int 26) (apair (int 45) (aunit))))
;(check-equal? (eval-exp (call (call mupl-mapAddN (int 1)) input)) output))
; 
;(check-equal? (eval-exp (call (call mupl-mapAddN (int 7))
;(racketlist->mupllist '())))
;(aunit) "mapAddN empty list")
;(check-equal? (eval-exp (call (call mupl-mapAddN (int 7))
;(racketlist->mupllist (list (int 3) (int 4) (int 9)))))
;(racketlist->mupllist (list (int 10) (int 11) (int 16))) "mapAddN +7")
;(check-equal? (eval-exp (call (call mupl-mapAddN (int 7))
;(racketlist->mupllist (list (int 3)))))
;(racketlist->mupllist (list (int 10))) "mapAddN single item list")
; add
(check-equal? (eval-exp (add (int 3) (int 4))) (int 7) "simple add")
(check-equal? (eval-exp (add (add (int 1) (int 2)) (add (int 3) (int 4)))) (int 10) "complex add")
(check-exn #rx"MUPL" (lambda () (eval-exp (add (int 3) (aunit)))) "add exception")
; int
(check-equal? (eval-exp (int 5)) (int 5) "int evaluation")
; aunit
(check-equal? (eval-exp (aunit)) (aunit) "aunit evaluation")
; closure
(check-equal? (eval-exp (closure '() (fun #f "x" (var "x"))))
(closure '() (fun #f "x" (var "x"))) "closure evaluation")
; mlet and var
(check-equal? (eval-exp (mlet "x" (add (int 1) (int 1)) (var "x"))) (int 2) "mlet and var 1")
(check-equal? (eval-exp (mlet "x" (int 1) (var "x"))) (int 1) "mlet and var 2")
(check-exn #rx"unbound" (lambda () (eval-exp (var "x"))) "var exception")
; fun
(check-equal? (eval-exp (fun #f "x" (var "x")))
(closure '() (fun #f "x" (var "x"))) "fun evaluation")
(check-equal? (eval-exp (mlet "x" (int 1) (fun #f "a" (var "x"))))
(closure (list (cons "x" (int 1))) (fun #f "a" (var "x"))) "mlet and fun evaluation")
; ifgreater
(check-equal? (eval-exp (ifgreater (int 1) (int 2) (int 3) (int 4))) (int 4) "simple ifgreater, false")
(check-equal? (eval-exp (ifgreater (add (int 0)(int 1)) (add (int 0)(int 2)) (int 3) (int 4))) (int 4) "complex ifgreater, false")
(check-equal? (eval-exp (ifgreater (int 1) (int 2) (int 3) (add (int 2)(int 2)))) (int 4) "complex ifgreater, false 2")
(check-equal? (eval-exp (ifgreater (int 2) (int 1) (int 3) (int 4))) (int 3) "simple ifgreater, true")
(check-equal? (eval-exp (ifgreater (add (int 0)(int 2)) (add (int 1) (int 0)) (int 3) (int 4))) (int 3) "complex ifgreater, true")
(check-equal? (eval-exp (ifgreater (int 2) (int 1) (add (int 1)(int 2)) (int 4))) (int 3) "complex ifgreater, true 2")
(check-exn #rx"MUPL" (lambda () (eval-exp (ifgreater "1" (int 2) (int 3) (int 4)))) "ifgreater exception")
; apair
(check-equal? (eval-exp (apair (int 1) (int 1))) (apair (int 1) (int 1)) "int apair")
(check-equal? (eval-exp (mlet "x" (int 1) (apair (var "x") (var "x"))))
(apair (int 1) (int 1)) "var apair")
; fst
(check-equal? (eval-exp (fst (apair (int 1) (int 2)))) (int 1) "simple fst")
(check-equal? (eval-exp (mlet "x" (apair (int 1) (int 2)) (fst (var "x")))) (int 1) "mlet and fst")
(check-exn #rx"MUPL" (lambda () (eval-exp (fst (add (int 1) (int 2))))) "fst exception")
; snd
(check-equal? (eval-exp (snd (apair (int 1) (int 2)))) (int 2) "snd evaluation")
(check-equal? (eval-exp (mlet "x" (apair (int 1) (int 2)) (snd (var "x")))) (int 2) "mlet and snd")
(check-exn #rx"MUPL" (lambda () (eval-exp (snd (add (int 1) (int 2))))) "snd exception")
; isaunit
(check-equal? (eval-exp (isaunit (aunit))) (int 1) "simple isaunit true")
(check-equal? (eval-exp (mlet "x" (aunit) (isaunit (var "x")))) (int 1) "mlet isaunit true")
(check-equal? (eval-exp (isaunit (int 0))) (int 0) "simple isaunit false")
(check-equal? (eval-exp (mlet "x" (int 0) (isaunit (var "x")))) (int 0) "mlet isaunit false")
; call
(check-equal? (eval-exp (mlet "double" (fun "double" "x" (add (var "x") (var "x")))
(call (var "double") (int 10))))
(int 20) "double function, non-recursive")
;(check-equal?
;(eval-exp
;(mlet "range"
;(fun "range" "lo"
;(fun #f "hi"
;(ifgreater (var "lo") (var "hi") (aunit)
;(apair (var "lo") (call (call (var "range") (add (int 1) (var "lo"))) (var "hi"))))))
;(call (call (var "range") (int 5)) (int 8))))
;(apair (int 5) (apair (int 6) (apair (int 7) (apair (int 8) (aunit))))) "range function, recursive")
;(check-exn #rx"MUPL" (lambda () (eval-exp (call (int 1) (int 2)))) "call exception")
; else
;(check-exn #rx"MUPL" (lambda () (eval-exp (list (int 1) (int 2)))) "bad expression exception")
 
; ifaunit
(check-equal? (eval-exp (ifaunit (aunit) (add (int 1)(int 2)) (add (int 3)(int 4)))) (int 3) "ifaunit true")
(check-equal? (eval-exp (ifaunit (int 0) (add (int 1)(int 2)) (add (int 3)(int 4)))) (int 7) "ifaunit false")
; mlet*
(check-equal? (eval-exp (mlet* (list (cons "x" (int 1)) (cons "y" (int 2))) (add (var "x")(var "y"))))
(int 3) "normal mlet* evaluation")
(check-equal? (eval-exp (mlet* (list (cons "x" (int 1))) (var "x")))
(int 1) "single variable mlet* evaluation")
(check-equal? (eval-exp (mlet* (list (cons "x" (int 1)) (cons "x" (int 2))) (var "x")))
(int 2) "shadowing mlet* evaluation")
; ifeq
(check-equal? (eval-exp (ifeq (int 1) (int 1) (int 2) (int 3)))
(int 2) "simple ifeq true evaluation")
(check-equal? (eval-exp (ifeq (int 0) (int 1) (int 2) (int 3)))
(int 3) "simple ifeq false evaluation")
(check-equal? (eval-exp (ifeq (add (int 1)(int 1)) (int 2) (int 2) (int 3)))
(int 2) "complex ifeq true evaluation")
(check-equal? (eval-exp (ifeq (add (int 1)(int 1)) (int 1) (int 2) (int 3)))
(int 3) "complex ifeq false evaluation")
 
; mupl-map
;(check-equal? (eval-exp
;(call (call mupl-map (fun #f "x" (add (int 1) (var "x"))))
;(apair (int 1) (apair (int 2) (aunit)))))
;(apair (int 2) (apair (int 3) (aunit))) "map normal list")
;(check-equal? (eval-exp
;(call (call mupl-map (fun #f "x" (add (int 1) (var "x"))))
;(apair (int 1) (aunit))))
;(apair (int 2) (aunit)) "map single item list")
;(check-equal? (eval-exp
;(call (call mupl-map (fun #f "x" (add (int 1) (var "x"))))
;(aunit)))
;(aunit) "map empty list")
))
(run-tests hw5-tests) 