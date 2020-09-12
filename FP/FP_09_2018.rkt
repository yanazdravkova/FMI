#lang racket

(define (selectList l1 l2)
  (if (>= (length l1) (length l2)) l1 l2))

(define (sumMaxRoots f ll)
  (apply +
   (foldr selectList `()
                    ( map (lambda (l)
                            (filter (lambda (x) (= (f x) 0))l)) ll))))