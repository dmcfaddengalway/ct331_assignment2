;; Daniel McFadden (16280010)
;; CT331: Programming Pradigms
;; Dr. Finlay Smith
;; 8 November 2018

#lang racket

(provide ins_beg)
(provide ins_end)
(provide cout_top_level)
(provide count_instances)
(provide count_instances_tr)
(provide count_instances_deep)

;; A) Append an item to the beginning of the list
(define (ins_beg ele lst)
  (append (list ele) lst)
)

(display "A) \n")
(ins_beg 'a '(b c d))
(ins_beg '(a b) '(b c d)) 

;; B) Append an item to the end of the list...opposite order of ins_beg
(define (ins_end ele lst)
  (append lst (list ele))
)

(display "\nB) \n")
(ins_end 'a '(b c d))
(ins_end '(a b) '(b c d))

;; C) Counts number of top level items in the list
(define (cout_top_level lst)
  (if (empty? lst)
      0
      (+ 1 (cout_top_level (cdr lst)))
))

(display "\nC) ")
(cout_top_level '(1 2 (3 4) 5 6 (7 8)))

;; D) Counts number of times and item occurs in a list
(define (count_instances ele lst)
  (cond ((null? lst) 0)
        ((equal? ele (car lst))
         (+ 1 (count_instances ele (cdr lst))))
        (else (count_instances ele (cdr lst)))
))

(display "\nD: ")
(count_instances 1 '(1 2 1 3 4 5 1 6))

;; E) Tail recursive method of above question
(define (count_instances_tr item lst)
  (count_instances_tr_helper item lst 0))

(define (count_instances_tr_helper item lst total)
  (cond
    [(empty? lst) total]
    [(equal? item (car lst)) (count_instances_tr_helper item (cdr lst) (+ 1 total))]
    [else (count_instances_tr_helper item (cdr lst) total)]
))

(display "\nE) ")
(count_instances_tr 1 '(1 2 1 3 4 5 1 6))

;; F) Count number of item occurances in a list and its sub lists
(define (count_instances_deep ele lst)
  (cond ((null? lst) 0)
        ((equal? ele (car lst))
         (+ 1 (count_instances_deep ele (cdr lst))))
        ((list? (car lst))
         (+ 0 (count_instances_deep ele (cdr lst))
             (count_instances_deep ele (car lst))))
        (else (count_instances_deep ele (cdr lst)))
))

(display "\nF) ")
(count_instances_deep 1 '(1 2 1 (1 3 4)))