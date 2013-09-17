#lang racket
"Chapter 03: forms of syntax: literals, comments, define, struct, list, and cons."
(define (square n) (* n n))
(define minusone (square 0+1i))

#| identities; also shows a block comment form. |#
(define equal-i-squared (equal? -1 (square 0+1i)))
(define eq-i-squared (eq? -1 (square 0+1i)))
(define eq--1-minusone (eq? -1 minusone))
(define one-sub1-iszero (zero? (sub1 1)))

; line comment: A literal in the definitions pane is echoed when run.
'Literals
"tutti fruitti"

#;
"but no echo for this one, behind the #; comment-one-expression"

; also expressions are echoed
"Expressions: is 'soup a symbol? a string? how about \"nuts\" ?"
(symbol? 'soup)
(string? 'soup)
(symbol? "nuts")
(string? "nuts")
"rational divide, float divide, integer quotient:"
"  (/ 22 7) (/ 22.0 7.0) (quotient 22 7) (quotient 22 7.0) (quotient 22.0 7)"
(/ 22 7)
(/ 22.0 7.0)
(quotient 22 7)
(quotient 22 7.0)
(quotient 22.0 7)

"A list's contents are equal however constructed: (equal? (list 1 2) '(1 2))"
(equal? (list 1 2) '(1 2))
"However their identities are distinct: (eq? (list 1 2) (list 1 2))"
(eq? (list 1 2) (list 1 2))

"Racket has cons, car, cdr like Lisp and Scheme. (cons 1 2)"
(cons 1 2)
"A cons ending in an empty list is a list. (cons 1 (cons 2 (cons 3 empty))) "
(cons 1 (cons 2 (cons 3 empty)))


(struct student (name id dorm))
"The struct form defines a constructor procedure: (struct student (name id dorm))."
"What is the value of student?"
student
"The struct instance resulting from a constructor is opaque, but queriable"
"define joe (student 'Joe 1234 'NewHall)). joe (student-name joe) student-name"
(define joe (student 'Joe 1234 'NewHall))
joe
(student-name joe)
"student-name is an accessor function automatically created when applying the struct form."
student-name
"Unless the struct is tagged as transparent: (struct display-box (lock treasure alarm) #:transparent)"
(struct display-box (lock treasure alarm) #:transparent)
display-box
"Define and echo an instance of a transparent display-box structure, trophy-case."
(define trophy-case (display-box 'puzzle-lock "The Axe" 'motion-detector))
trophy-case
"(display-box-treasure trophy-case)"
(display-box-treasure trophy-case)
"Use an automatically generated type query for a structure type."
"Is trophy-case a display-box? (display-box? trophy-case)"
(display-box? trophy-case)
"The values of cons and list are procedures.  define, struct, and #:transparent are keywords with no values."