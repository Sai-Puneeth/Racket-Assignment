#lang racket
(define emptyTree '())

(define (addToTree Tree k v)
  (match Tree
    ['()
     (list k v '() '())]
    [(list key val left right)
     (if (> k key)
       (list key val left (addToTree right k v))
       (list key val (addToTree left k v) right))]))