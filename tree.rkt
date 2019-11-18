#lang racket
 
(define the-tree ; Node: (list <data> <left> <right>)
  '(1 (2 (4 (7 #f #f) #f) (5 #f #f)) (3 (6 (8 #f #f) (9 #f #f)) #f)))
 
(define (preorder tree visit)
  (let loop ([t tree])
    (when t (visit (car t)) (loop (cadr t)) (loop (caddr t)))))
(define (inorder tree visit)
  (let loop ([t tree])
    (when t (loop (cadr t)) (visit (car t)) (loop (caddr t)))))
(define (postorder tree visit)
  (let loop ([t tree])
    (when t (loop (cadr t)) (loop (caddr t)) (visit (car t)))))
(define (levelorder tree visit)
  (let loop ([trees (list tree)])
    (unless (null? trees)
      ((compose1 loop (curry filter values) append*)
       (for/list ([t trees] #:when t) (visit (car t)) (cdr t))))))
 
(define (run order)
  (printf "~a:" (object-name order))
  (order the-tree (λ(x) (printf " ~s" x)))
  (newline))
(for-each run (list preorder inorder postorder levelorder))
 