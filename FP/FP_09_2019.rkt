#lang racket
(define (addIfNew x l) (if (member x l) l (cons x l)))

(define (annotate db annotators)
  (map
   (lambda (item-labels-pair)
     (let (
           (item (car item-labels-pair))
           (labels (cdr item-labels-pair)))
       (cons item (foldr addIfNew labels
                                  (apply append (map
                                   (lambda (annotator) (annotator item)) annotators))))))db))

(define db (list (cons "scheme" (list (cons "typing" "dynamic") (cons "evaluation" "strict")))
(cons "haskell" (list (cons "typing" "static"))) (cons "c++" (list))))
(define (evaluation lang)
(case lang (("scheme") (list (cons "evaluation" "strict") (cons "macros" "true")))
(("haskell") (list (cons "evaluation" "lazy"))) (("c++") (evaluation "scheme"))))
(define (purity lang) (if (eqv? lang "haskell") (list (cons "pure" "true")) (list)))


; foldr + 0 `(1 2 3)
; foldr proc init list

; apply proc list
; apply + `(1 2 3)