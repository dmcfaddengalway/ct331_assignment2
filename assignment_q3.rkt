;; Daniel McFadden (16280010)
;; CT331: Programming Paradigms
;; Dr. Finlay Smith
;; 8 November 2018

#lang racket

(provide left_tree)
(provide right_tree)
(provide value)
(provide is_empty)
(provide create)

(provide order)
(provide check)
(provide insert)

;; HELPER FUNCTIONS
(define (left_tree bst) (car bst))

(define (right_tree bst) (caddr bst))

(define (value bst) (cadr bst))

(define (is_empty bst)
  (null? bst))

(define (create left-sub val right-sub)
  (list left-sub val right-sub))

;; A) Display sorted order of a binary search tree
(define (order tree)
  (begin
    (cond
      [(empty? (car tree)) (display " ")]
      [else (order (car tree))]
      )
    (display (car (cdr tree)))
    (cond
      [(empty? (caddr tree)) (display " ")]
      [else (order (car (cdr (cdr tree))))]
      )
))

(display "A) ")
(order '((() 1 ()) 3 ((() 5 ()) 7 (() 9 ()))))

;; B) Display true or false if item is in the tree
(define (check item binary_search_tree)
  (cond
    ((is_empty binary_search_tree) #f)
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

(display "\nB) ")
(check 8 '((() 5 ()) 7 ((() 8 ()) 10 (() 11 ()))))

;; C) Insert into list representing binary search tree
(define (insert item binary_search_tree)
  (cond
    ((is_empty binary_search_tree)
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

(display "C) \n Before insertion:")
(define tree '((() 1 ()) 3 ((() 4 ()) 6 (() 7 ()))))
(order tree)
(display "\n After insertion:")
(define tree4 (insert 8 tree))
(order tree4)

;; D) Take a list and insert into a tree
(define (insert_list lst binary_search_tree)
  (cond ((is_empty binary_search_tree))
       [(empty? lst) binary_search_tree]
       [else (insert_list (cdr lst) (insert (car lst) binary_search_tree))])
)

(display "\nD) ")
(insert_list '(5 12 6 9 3 4 17 8 7) '())

;; E) Implement a tree sort algorithm
(define (tree_sort lst)
   (order (insert_list lst '()))
)

(display "E) ")
;;(tree_sort '(5 12 6 9 3 4 17 8))

;; F) Implement higher order tree sort function
(define (higher_order_sort lst func)
   (order (insert_list_to_tree lst '() func))
)

(define (insert_list_to_tree lst tree fn)
  (cond
   [(empty? lst) tree]
   [else (insert_list_to_tree (cdr lst) (el_into_tree (car lst) tree fn) fn)]
))

(define (el_into_tree item lst fn)
  (cond
    [(empty? lst) (append lst (list '() item '()))]
    [(equal? item (cadr lst)) "item found in tree"]
    [(fn item (cadr lst)) (list (el_into_tree item (car lst) fn) (cadr lst) (caddr lst))]
    [else (list (car lst) (cadr lst) (el_into_tree item (caddr lst) fn))]
))

(display "\nF) \n Ascending: ")
(higher_order_sort '(5 12 6 9 3 4 17 8) <)
(display "\n Descending: ")
(higher_order_sort '(5 12 6 9 3 4 17 8) >)
(display "\n Ascending based on last digit: ")

(define (last_digit num1 num2)
  (< (modulo num1 10) (modulo num2 10)))

(higher_order_sort '(5 12 6 9 3 4 17 8) last_digit)