;; Daniel McFadden (16280010)
;; CT331: Programming Paradigms
;; Dr. Finlay Smith
;; 8 November 2018

#lang racket

(provide left_tree)
(provide right_tree)
(provide value)
(provide is_empty)

(provide order)
(provide check)
(provide insert)

;; HELPER FUNCTIONS
(define (left_tree bst) (car bst))

(define (right_tree bst) (caddr bst))

(define (value bst) (cadr bst))

(define (is_empty bst)
  (null? bst))

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

;; Insert into list representing binary search tree
(define (insert item binary_search_tree)
  (cond ((is_empty binary_search_tree)
         (create '() item '()))
        ;; If item is less than the root node, add to the left side of the sub tree
        ((< item (value binary_search_tree))
         (create (value binary_search_tree)
                 (insert item (left_tree binary_search_tree))
                 (right_tree binary_search_tree)))
        ;; If item is greater than the root node, add to the right side of the sub tree
        ((> item (value binary_search_tree))
         (create (value binary_search_tree)
                 (left_tree binary_search_tree)
                 (insert item (right_tree binary_search_tree))))
        (else binary_search_tree))
  )