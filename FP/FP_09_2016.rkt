#lang racket

(define (filterByElement x m)
  (filter (lambda (l) (member x l)) m ))

(define (func ll)
  (apply + (map (lambda (l) (apply max l))ll)))

;(func `((5 -2) (1 9) (6 -8))) -> 20