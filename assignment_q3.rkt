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

(provide sortTree)
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

;; A) Display sorted sortTree of a binary search tree
(define (sortTree tree);sort left then sort right
 (begin(cond [(not (empty?(left_tree tree))) (sortTree (left_tree tree))])
   (printf "~a " (cadr tree));
   (cond [(not (empty?(right_tree tree))) (sortTree (right_tree tree))])))

(display "A) ")
(sortTree '((() 1 ()) 3 ((() 5 ()) 7 (() 9 ()))))

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
(define (insert el tree)
  (cond
    [(empty? tree) (list '() el '())]
    [(equal? el (cadr tree)) tree]
    [(< el (cadr tree))
    (list ( insert el (left_tree tree)) (cadr tree) (right_tree tree))]
    [else (list (left_tree tree) (cadr tree) (insert el (right_tree tree)))]))

(display "C) \n Before insertion: ")
(define tree '((() 1 ()) 3 ((() 4 ()) 6 (() 7 ()))))
(sortTree tree)
(display "\n After insertion: ")
(define tree4 (insert 5 tree))
(sortTree tree4)

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
  (sortTree (insert_list lst '()))
)

(display "E) ")
(tree_sort '(5 12 6 9 3 4 17 8))

;; F) Implement higher sortTree tree sort function
(define (higher_sortTree_sort lst func)
   (sortTree (insert_list_to_tree lst '() func))
)

(define (insert_list_to_tree lst tree func)
  (cond
   [(empty? lst) tree]
   [else (insert_list_to_tree (cdr lst) (el_into_tree (car lst) tree func) func)]
))

(define (el_into_tree item lst func)
  (cond
    [(empty? lst) (append lst (list '() item '()))]
    [(equal? item (cadr lst)) "item found in tree"]
    [(func item (cadr lst)) (list (el_into_tree item (car lst) func) (cadr lst) (caddr lst))]
    [else (list (car lst) (cadr lst) (el_into_tree item (caddr lst) func))]
))

(display "\nF) \n Ascending: ")
(higher_sortTree_sort '(5 12 6 9 3 4 17 8) <)
(display "\n Descending: ")
(higher_sortTree_sort '(5 12 6 9 3 4 17 8) >)
(display "\n Ascending based on last digit: ")

(define (last_digit num1 num2)
  (< (modulo num1 10) (modulo num2 10)))

(higher_sortTree_sort '(5 12 6 9 3 4 17 8) last_digit)