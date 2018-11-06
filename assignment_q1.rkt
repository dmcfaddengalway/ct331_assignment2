;; Daniel McFadden (16280010)
;; CT331: Programming Paradigms
;; Dr. Finlay Smith
;; 8 November 2018

#lang racket

;; A) Creates list of two numbers
(cons 9 2)

;; B) Creates list of 3 numbers, needs extra '() as cons always needs two arguemnts
(cons 1 (cons 2 (cons 3 '())))

;; C) Create a list with a string, number and list of 3 numbers with only cons
(cons "Daniel" (cons 1 (cons (cons 2 (cons 3 (cons 4 empty))) empty)))

;; D) Create a list with a string, number, and list of 3 numbers with only list
(list "Joan" 2 '(1 2 3) )

;; E) Create a list with a string, number, and list of 3 numbers with only append
(append '("Emma" 8) '(1 2 3) )