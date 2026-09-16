#import "../../presets.typ": *
#show: template.with(show_title: false, show_header: false, math_font: "XITS Math")
#set page(header: align(right)[STAT 400 \ Joshua Villar])
#set page(numbering: none)

#let lines = stack(
  line(length: 100%),
  line(length: 100%),
  spacing: 2pt
)

#title[Week 3 Discussion]
#lines

==  IDK
#enum.item(1)[
  $
    "Bag" A = cases(3 "red marbles", 7 "blue marbles")
  $
  
]

#enum.item(2)[
  If blue, pick
  $
    "Box" 1 = cases(4 "green marbles", 1 "yellow marble")
  $

  If red, pick
  $
    "Box" 2 = cases(2 "green marbles", 8 "yellow marbles")
  $
]

#align(center)[
  #tidy-tree-graph(spacing: (20pt, 50pt), node-inset: 5pt)[
    - Start
      + 0.3
      - Red
        + 0.8
        - Yellow
        + 0.2
        - Green
      + 0.7
      - Blue
        + 0.2
        - Yellow
        + 0.8
        - Green
      
  ]
]

What is $P("yellow")$?
$
  P("yellow") &= P("red")P("yellow"|"red") + P("blue")P("yellow"|"blue") \
  P("yellow") &= 0.3 dot 0.8 + 0.7 dot 0.2 \
  P("yellow") &= 0.24 + 0.14 \
  P("yellow") &= bold(0.38) \
$

What is $P("green"|"blue")$?
$
  P("green"|"blue") = bold(0.8)
$

What is $P("green"union"blue")$?
$
  P("green"union"blue") &= P("red")P("green"|"red") + P("blue") \
  P("green"union"blue") &= 0.3 dot 0.2 + 0.7 \
  P("green"union"blue") &= 0.06 + 0.7 \
  P("green"union"blue") &= bold(0.76)
$
idk you can also use inclusion exclusion principle but i lowk forgot about that