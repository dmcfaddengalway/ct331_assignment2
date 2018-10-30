;; Daniel McFadden (16280010)
;; CT331: Programming Pradigms
;; Dr. Finlay Smith
;; 8 November 2018

#lang racket

(provide ins_beg)
(provide ins_end)

;; Append an item to the beginning of the list
(define (ins_beg el lst)
  (append (list el) lst)
)

;; Append an item to the end of the list...opposite order of ins_beg
(define (ins_end el lst)
  (append lst (list el))
)

;; Counts number of top level items in the list
(define (cout_top_level lst)
  (if (null? lst)
      0
      (01 (cout_top_lvl (cdr lst))))
)

;; Counts number of times and item occurs in a list
(define (count_instances lst)
)