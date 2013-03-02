;; Programming Languages, Homework 5

#lang racket
(provide (all-defined-out)) ;; so we can put tests in a second file

;; definition of structures for MUPL programs - Do NOT change
(struct var  (string) #:transparent)  ;; a variable, e.g., (var "foo")
(struct int  (num)    #:transparent)  ;; a constant number, e.g., (int 17)
(struct add  (e1 e2)  #:transparent)  ;; add two expressions
(struct ifgreater (e1 e2 e3 e4)    #:transparent) ;; if e1 > e2 then e3 else e4
(struct fun  (nameopt formal body) #:transparent) ;; a recursive(?) 1-argument function
(struct call (funexp actual)       #:transparent) ;; function call
(struct mlet (var e body) #:transparent) ;; a local binding (let var = e in body) 
(struct apair (e1 e2)     #:transparent) ;; make a new pair
(struct fst  (e)    #:transparent) ;; get first part of a pair
(struct snd  (e)    #:transparent) ;; get second part of a pair
(struct aunit ()    #:transparent) ;; unit value -- good for ending a list
(struct isaunit (e) #:transparent) ;; evaluate to 1 if e is unit else 0

;; a closure is not in "source" programs; it is what functions evaluate to
(struct closure (env fun) #:transparent) 

;; Problem 1

(define (racketmuplconv value)
          (if (or (pair? value) (number? value) (null? value))
              (cond[(pair? value) (apair (car value) (cdr value))]
                [(number? value) (int value)]
                 [(null? value) (aunit)])
              (error "Unexpected value.")))

(define (muplracketconv value)
        (if (or (apair? value) (int? value) (aunit? value))
          (cond[(apair? value) (cons (apair-e1 value) (apair-e2 value))]
               [(int? value) (int-num value)]
               [(aunit? value) null])
           (error "Unexpected value.")))

             

(define (racketlist->mupllist  list)
          (if (null? list) 
                null
               (cons (racketmuplconv (car list)) (racketlist->mupllist (cdr list)))))

(define (mupllist->racketlist  list)
          (if (null? list) 
                null
               (cons (muplracketconv (car list)) (mupllist->racketlist (cdr list)))))


                     
;; Problem 2

;; lookup a variable in an environment
;; Do NOT change this function
(define (envlookup env str)
  (cond [(null? env) (error "unbound variable during evaluation" str)]
        [(equal? (car (car env)) str) (cdr (car env))]
        [#t (envlookup (cdr env) str)]))

;; Do NOT change the two cases given to you.  
;; DO add more cases for other kinds of MUPL expressions.
;; We will test eval-under-env by calling it directly even though
;; "in real life" it would be a helper function of eval-exp.
(define (eval-under-env e env)
  (cond 
        [(var? e) 
             (envlookup env (var-string e))]
        
        [(add? e) 
         (let ([v1 (eval-under-env (add-e1 e) env)]
               [v2 (eval-under-env (add-e2 e) env)])
           (if (and (int? v1)
                    (int? v2))
               (int (+ (int-num v1) 
                       (int-num v2)))
               (error "MUPL addition applied to non-number")))]
    
        [(isaunit? e) 
          (if(aunit? e) 1 0)]
                
        [(int? e) e]
        [(aunit? e) e]
        
        [(ifgreater? e)
           (let ([v1 (eval-under-env (ifgreater-e1 e) env)]
                 [v2 (eval-under-env (ifgreater-e2 e) env)])
             (if (and (int? v1) 
                      (int? v2))
                    (if (> v1 v2) (ifgreater-e3 e) (ifgreater-e4 e))
                    (error "MUPL ifgreater applied to non-numbers")))]
        
        [(apair? e) 
          (let ([v1 (eval-under-env (apair-e1 e) env)]
                [v2 (eval-under-env (apair-e2 e) env)])
           (apair v1 v2))]
        
        [(fst?  e)
          (if (apair? e) 
              (apair-e1 e)
              (error "MUPL fst applied to non-apair"))]
        
        [(snd?  e)
          (if (apair? e) 
              (apair-e2 e)
              (error "MUPL fst applied to non-apair"))]
        
        [(mlet? e) 
           (let ([exp (eval-under-env (mlet-e e) env)] 
                 [env (cons env (cons (mlet-var e) exp))])
             (eval-under-env (mlet-body e) env))]
        
        [(fun? e);fun  (nameopt formal body)
          (if (fun-nameopt e) 
             (begin
               (print "define fun closure")
               (newline)
               (print (string-append "for " (fun-nameopt e)))
               (newline)
              (closure (cons env (cons (fun-nameopt e) e))  e);adding function closure
              )
             (closure env  e))]
              
        [(call? e)
         (if (closure? (envlookup env (eval-under-env (call-funexp e) env)))
             (let* ([cls (call-funexp e)]
                   [act_param (eval-under-env call-actual (closure-env cls))];;calculate actual parameter
                   [form_param (fun-formal (closure-fun cls))];get name of formal parameter
                   [env (cons closure-env (cons form_param act_param))];;extend environment with (formal actual) pair
                   [f (closure-fun cls)]
                   [body (fun-body f)])
             (eval-under-env (body) env))
            (begin
             (print (call-funexp e))
            (error "not a MUPL closure")))]
                     
      
        [#t (error "bad MUPL expression")]))

;; Do NOT change
(define (eval-exp e)
  (eval-under-env e null))
        
;; Problem 3

(define (ifaunit e1 e2 e3) "CHANGE")

(define (mlet* lstlst e2) "CHANGE")

(define (ifeq e1 e2 e3 e4) "CHANGE")

;; Problem 4

(define mupl-map "CHANGE")

(define mupl-mapAddN 
  (mlet "map" mupl-map
        "CHANGE (notice map is now in MUPL scope)"))

;; Challenge Problem

(struct fun-challenge (nameopt formal body freevars) #:transparent) ;; a recursive(?) 1-argument function

;; We will test this function directly, so it must do
;; as described in the assignment
(define (compute-free-vars e) "CHANGE")

;; Do NOT share code with eval-under-env because that will make
;; auto-grading and peer assessment more difficult, so
;; copy most of your interpreter here and make minor changes
(define (eval-under-env-c e env) "CHANGE")

;; Do NOT change this
(define (eval-exp-c e)
  (eval-under-env-c (compute-free-vars e) null))



;;MY simple MUPL test programs

(define (program1)
  (apair (fun  "program1" "par1" (ifgreater (var "par1") (const 2) (const 4) (const 123)))
  (call  "program1" (const 5))))
