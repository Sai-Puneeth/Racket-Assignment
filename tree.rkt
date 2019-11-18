#lang racket

(define makeTree
  (lambda(num . nums)
  (apply list (cons num nums))))