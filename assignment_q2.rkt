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

;; Append an item to the beginning of the list
(define (ins_beg ele lst)
  (append (list ele) lst)
)

;; Append an item to the end of the list...opposite order of ins_beg
(define (ins_end ele lst)
  (append lst (list ele))
)

;; Counts number of top level items in the list
(define (cout_top_level lst)
  (if (null? lst)
      0
      (01 (cout_top_level (cdr lst))))
)

;; Counts number of times and item occurs in a list
(define (count_instances ele lst)
  (cond ((null? lst) 0)
        ((equal? ele (car lst))
         (+ 1 (count_instances ele (cdr lst))))
        (else (count_instances ele (cdr lst)))
))

;; Tail recursive method of above question
(define (tail el lst)
  (count_instances_tr el lst 0))

(define (count_instances_tr ele lst acc)
  (cond ((null? lst) acc)
      ((equal? ele (car lst))
      (count_instances_tr ele (cdr lst) (+ 1 acc)))
      (else (count_instances_tr ele (cdr lst) acc))
 ))

;; Count number of item occurances in a list and its sub lists
(define (count_instances_deep ele lst)
  (cond ((null? lst) 0)
        ((equal? ele (car lst))
         (+ 1 (count_instances_deep ele (cdr lst))))
        ((list? (car lst))
         (+ 0 (count_instances_deep ele (cdr lst))
             (count_instances_deep ele (car lst))))
        (else (count_instances_deep ele (cdr lst)))
))