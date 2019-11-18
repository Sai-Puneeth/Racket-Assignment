#lang racket
(define xs ( cons 1 (cons 7 (cons 10 (cons 5 (cons 6 ( cons 2 ( cons 9 ( cons 2 empty)))))))))
(define ys (cons 4 (cons 2 (cons 8 (cons 1 ( cons 17 empty))))))
 
(define (merge xs ys)
  (cond [(empty? xs) ys]
        [(empty? ys) xs]
        [(match* (xs ys)
           [((list* a as) (list* b bs))
            (cond [(<= a b) (cons a (merge as ys))]
                  [         (cons b (merge xs bs))])])]))
 
(define (merge-sort xs)
  (match xs
    [(or (list) (list _)) xs]
    [_ (define-values (ys zs) (split-at xs (quotient (length xs) 2)))
       (merge (merge-sort ys) (merge-sort zs))]))