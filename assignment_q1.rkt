;; Daniel McFadden (16280010)
;; CT331: Programming Paradigms
;; Dr. Finlay Smith
;; 8 November 2018

#lang racket

;; Creates list of two numbers
(cons 9 2)

;; Creates list of 3 numbers, needs extra '() as cons always needs two arguemnts
(cons '(1 2 3) '() )

;;UNSURE ABOUT THESE YET
;; Create a list with a string, number and list of 3 numbers with only cons
(cons '("Daniel" 5 '(1 2 3)) '())

;; Create a list with a string, number, and list of 3 numbers with only list
'("Joan" 2 '(1 2 3) )

;; Create a list with a string, number, and list of 3 numbers with only append
(append '("Emma" 8 '(1 2 3) ) )