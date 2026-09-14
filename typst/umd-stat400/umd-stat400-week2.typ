#import "../../presets.typ": *
#show: template.with(show_title: false, show_header: false, math_font: "XITS Math")
#set page(header: align(right)[STAT 400 \ Joshua Villar])
#set page(numbering: none)

#let lines = stack(
  line(length: 100%),
  line(length: 100%),
  spacing: 2pt
)

#title[Week 2 Discussion]
#lines

== Events
1) Flip a coin
$
  S={H,T}
$

2) Roll a 6-sided die
$
  S={1,2,3,4,5,6}
$

3) Flip a coin, then roll a 6-sided die
$
  S={(H,1), (H,2), (H,3), (H,4), (H,5), (H,6), (T,1), (T,2), (T,3), (T,4), (T,5), (T,6)}
$

4) Rolling a 4-sided die until getting a 4 or until the third roll
$
  S={4, \
  14, 24, 34, \
  111, 112, 113, 114, \ 
  121, 122, 123, 124, \
  131, 132, 133, 134 \
  211, 212, 213, 214, \
  221, 222, 223, 224 \
  231, 232, 233, 234, \
  311, 312, 313, 314, \
  321, 322, 323, 324, \
  331, 332, 333, 334}
$

#note-block[
  The tuple notation and the notation without parentheses and commas in example 4 is not concrete.
]