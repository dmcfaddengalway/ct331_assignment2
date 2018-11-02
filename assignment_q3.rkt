#lang racket

;; Display sorted order of a binary search tree
(define (order binary_search_tree)
  (cond ((is_empty binary_search_tree))
        (else
         (order (left_tree binary_search_tree))
         (display (value binary_search_tree)) (newline)
         (order (right_tree binary_search_tree))))
)

;; Display true or false if item is in the tree
(define (check item binary_search_tree)
  (cond ((is_empty binary_search_tree) #f)
        ;; If item is equal - return true
        ((equal? item (value binary_search_tree)) #t)
        ;; If item is less then search left side of Binary Search Tree
        ((< item (value binary_search_tree))
         (check item (left_tree binary_search_tree)))
        ;; If item is greater then search right side of Binary Search Tree
        ((> item (value binary_search_tree))
         (check item (right_tree binary_search_tree)))
        (else binary_search_tree))
)