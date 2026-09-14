#import "../../presets.typ": *
#show: template.with(show_title: false, show_header: false, math_font: "XITS Math")
#set page(header: align(right)[STAT 400 \ Joshua Villar])

#let lines = stack(
  line(length: 100%),
  line(length: 100%),
  spacing: 2pt
)


== STAT 400 Homework 2: Probability Functions
#lines
#enum.item(1)[
  Suppose an experiment consists of tossing a two-sided coin three times.

  #enum.item(1)[
    What is the size of the sample space?
    $
      2^3 = bold(8)
    $
  ]

  #enum.item(2)[
    Identify the following events as subsets of the sample space:
    - $E$: At least two heads.
    $
      {H H H, H H T, H T H, T H H}
    $
    - $F$: The last toss is a head.
    $
      {H H H, H T H, T H H, T T H}
    $
    - $G$: Even number of heads.
    $
      {H H T, H T H, T H H, T T T}
    $
  ]

  #enum.item(3)[
    Suppose the tossed coin is unfair with $P(H)=0.8$.
    Draw the labelled tree diagram associated to this experiment.
    What is the probability distribution on the sample space?

    #align(center)[
      #tidy-tree-graph(spacing: (20pt, 50pt), node-inset: 5pt)[
        - Start
          + $0.8$
          - $H$
            + $0.8$
            - $H$
              + $0.8$
              - $H$
              + $0.2$
              - $T$
            + $0.2$
            - $T$
              + $0.8$
              - $H$
              + $0.2$
              - $T$
          + $0.2$
          - $T$
            + $0.8$
            - $H$
              + $0.8$
              - $H$
              + $0.2$
              - $T$
            + $0.2$
            - $T$
              + $0.8$
              - $H$
              + $0.2$
              - $T$
      ]
    ]
  
  $
    P(H H H) &= 0.8 dot 0.8 dot 0.8 =  bold(0.512) \
    P(H H T) &= 0.8 dot 0.8 dot 0.2 =  bold(0.128) \
    P(H T H) &= 0.8 dot 0.2 dot 0.8 =  bold(0.128) \
    P(H T T) &= 0.8 dot 0.2 dot 0.2 =  bold(0.032) \
    P(T H H) &= 0.2 dot 0.8 dot 0.8 =  bold(0.128) \
    P(T H T) &= 0.2 dot 0.8 dot 0.2 =  bold(0.032) \
    P(T T H) &= 0.2 dot 0.2 dot 0.8 =  bold(0.032) \
    P(T T T) &= 0.2 dot 0.2 dot 0.2 =  bold(0.008) \
  $
  ]
]

#lines
#enum.item(1)[
  #enum.item(4)[
    Use the above probability distribution to calculate the probabilities of the events $E$, $F$, and $G$.
    $
      P(E) &= P(H H H) + P(H H T) + P(H T H) + P(T H H) \
      P(E) &= 0.512 + 0.128 + 0.128 + 0.128 \
      P(E) &= bold(0.896)
    $

    $
      P(F) &= P(H H H) + P(H T H) + P(T H H) + P(T T H) \
      P(F) &= 0.512 + 0.128 + 0.128 + 0.032 \
      P(F) &= bold(0.8)
    $
    
    $
      P(G) &= P(H H T) + P(H T H) + P(T H H) + P(T T T) \
      P(G) &= 0.128 + 0.128 + 0.128 + 0.008 \
      P(G) &= bold(0.392)
    $
  ]
]

#pagebreak()

#lines
#enum.item(2)[
  Suppose an experiment consists of rolling a six-sided die two times.

  #enum.item(1)[
    What is the size of the sample space?
    $
      6^2 = bold(36)
    $
  ]

  #enum.item(2)[
    Identify the following events as subsets of the sample space:
    - $E$: Sum of the two rolls is between 3 and 5 (inclusive)
    $
      {(1,2), (1,3), (1,4), (2,1), (2,2), (2,3), (3,1), (3,2), (4,1)}
    $
    - $F$: Max of the two rolls is less than 3.
    $
      {(1,1), (1,2), (2,1), (2,2)}
    $
    - $G$: The second roll was even.
    $
      {&(1,2), (1,4), (1,6), (2,2), (2,4), (2,6), (3,2), (3,4), (3,6), \
      &(4,2), (4,4), (4,6), (5,2), (5,4), (5,6), (6,2), (6,4), (6,6)}
    $
  ]

  #enum.item(3)[
    Suppose the rolled die is fair with $P(1) = P(2) = dots.c = P(6) = 1/6$.
    Draw the labelled tree diagram associated to this experiment. 
    What is the probability distribution on the sample space?
    #align(center)[
      Main Tree: \
      #tidy-tree-graph(
        spacing: (25pt, 50pt),
        node-inset: 5pt,
      )[
        - Start
          + $1 slash 6$
          - Subtree 1
          + $1 slash 6$
          - Subtree 2
          + $1 slash 6$
          - Subtree 3
          + $1 slash 6$
          - Subtree 4
          + $1 slash 6$
          - Subtree 5
          + $1 slash 6$
          - Subtree 6
      ]

      Subtree $n$: \
      #tidy-tree-graph(
        spacing: (25pt, 50pt),
        node-inset: 5pt,
      )[
        - $n$
          + $1 slash 6$
          - $1$
          + $1 slash 6$
          - $2$
          + $1 slash 6$
          - $3$
          + $1 slash 6$
          - $4$
          + $1 slash 6$
          - $5$
          + $1 slash 6$
          - $6$
      ]
    ]
    Let $A$ be any event in the sample space.
    $
      P(A) = bold(1/36)
    $
  ]
]
#pagebreak()
#lines
#enum.item(2)[
  #enum.item(4)[
    Use the above probability distribution to calculate the probabilities of the events $E$, $F$, and $G$.
    $
      P(E) &= P big( ((1,2)) ) + P big( ((1,3)) ) + P big( ((1,4)) ) + P big( ((2,1)) ) \
      &+ P big( ((2,2)) ) + P big( ((2,3)) ) + P big( ((3,1)) ) + P big( ((3,2)) ) + P big( ((4,1)) ) \
      P(E) &= 9 dot 1/36 \
      P(E) &= bold(1/4)
    $
    
    $
      P(F) &= P big( ((1,1)) ) + P big( ((1,2)) ) + P big( ((2,1)) ) + P big( ((2,2)) ) \
      P(F) &= 4 dot 1/36 \
      P(F) &= bold(1/9)
    $

    $
      P(G) &= P big( ((1,2)) ) + P big( ((1,4)) ) + P big( ((1,6)) ) \
      &+ P big( ((2,2)) ) + P big( ((2,4)) ) + P big( ((2,6)) ) \
      &+ P big( ((3,2)) ) + P big( ((3,4)) ) + P big( ((3,6)) ) \
      &+ P big( ((4,2)) ) + P big( ((4,4)) ) + P big( ((4,6)) ) \
      &+ P big( ((5,2)) ) + P big( ((5,4)) ) + P big( ((5,6)) ) \
      &+ P big( ((6,2)) ) + P big( ((6,4)) ) + P big( ((6,6)) ) \
      P(G) &= 18 dot 1/36 \
      P(G) &= bold(1/2)
    $
  ]
]


#pagebreak()
#lines



#enum.item(3)[
  Suppose an experiment consists of tossing a two sided coin, followed by rolling a six-sided die two times.

  #enum.item(1)[
    What is the size of the sample space?
      $
        2 dot 6^2 = bold(72)
      $
  ]

  #enum.item(2)[
    Identify the following events as subsets of the sample space:
    - $E$: Sum of the two rolls is between 3 and 5 (inclusive)
    $
      {&(H, 1,2), (H, 1,3), (H, 1,4), (H, 2,1), (H, 2,2), (H, 2,3), (H, 3,1), (H, 3,2), (H, 4,1), \
      &(T, 1,2), (T, 1,3), (T, 1,4), (T, 2,1), (T, 2,2), (T, 2,3), (T, 3,1), (T, 3,2), (T, 4,1)}
    $
    - $F$: Max of the two rolls is less than 3.
    $
      {(H,1,1), (H,1,2), (H,2,1), (H,2,2), (T,1,1), (T,1,2), (T,2,1), (T,2,2)}
    $
    - $G$: The second roll was even and the coin lands $H$.
    $
      {&(H,1,2), (H,1,4), (H,1,6), (H,2,2), (H,2,4), (H,2,6), (H,3,2), (H,3,4), (H,3,6), \
      &(H,4,2), (H,4,4), (H,4,6), (H,5,2), (H,5,4), (H,5,6), (H,6,2), (H,6,4), (H,6,6)
    $
    - $H$: The coin lands $H$. 
    $
      {&(H,1,1), (H,1,2), (H,1,3), (H,1,4), (H,1,5), (H,1,6) \
      &(H,2,1), (H,2,2), (H,2,3), (H,2,4), (H,2,5), (H,2,6) \
      &(H,3,1), (H,3,2), (H,3,3), (H,3,4), (H,3,5), (H,3,6) \
      &(H,4,1), (H,4,2), (H,4,3), (H,4,4), (H,4,5), (H,4,6) \
      &(H,5,1), (H,5,2), (H,5,3), (H,5,4), (H,5,5), (H,5,6) \
      &(H,6,1), (H,6,2), (H,6,3), (H,6,4), (H,6,5), (H,6,6)}
    $
  ]
]
#pagebreak()
#lines
#enum.item(3)[
  #enum.item(3)[
    Suppose the tossed coin was a fair coin with $P(H) = 0.5$ and the rolled die is also fair with $P(1) = P(2) = dots.c = P(6) = 1/6$.
    Draw the labeled tree diagram associated to this experiment.
    What is the probability distribution on the sample space?

    #align(center)[
      Main Tree: \
      #tidy-tree-graph(
        spacing: (5pt, 50pt),
        node-inset: 5pt,
      )[
        - Start
          + $1 slash 2$
          - $H$
            + $1 slash 6$
            - Subtree 1
            + $1 slash 6$
            - Subtree 2
            + $1 slash 6$
            - Subtree 3
            + $1 slash 6$
            - Subtree 4
            + $1 slash 6$
            - Subtree 5
            + $1 slash 6$
            - Subtree 6
          + $1 slash 2$
          - $T$
            + $1 slash 6$
            - Subtree 1
            + $1 slash 6$
            - Subtree 2
            + $1 slash 6$
            - Subtree 3
            + $1 slash 6$
            - Subtree 4
            + $1 slash 6$
            - Subtree 5
            + $1 slash 6$
            - Subtree 6
      ]

      Subtree $n$: \
      #tidy-tree-graph(
        spacing: (25pt, 50pt),
        node-inset: 5pt,
      )[
        - $n$
          + $1 slash 6$
          - $1$
          + $1 slash 6$
          - $2$
          + $1 slash 6$
          - $3$
          + $1 slash 6$
          - $4$
          + $1 slash 6$
          - $5$
          + $1 slash 6$
          - $6$
      ]
    ]

    Let $B$ be any event in the sample space.
    $
      P(B) = bold(1/72)
    $
  ]

  #enum.item(4)[
    Use the above probability distribution to calculate the probabilities of the events $E$, $F$, $G$, and $H$.
    $
      P(E) &= P big( ((H,1,2)) ) + P big( ((H,1,3)) ) + P big( ((H,1,4)) ) + P big( ((H,2,1)) ) \
      &+ P big( ((H,2,2)) ) + P big( ((H,2,3)) ) + P big( ((H,3,1)) ) + P big( ((H,3,2)) ) + P big( ((H,4,1)) ) \
      &+ P big( ((T,1,2)) ) + P big( ((T,1,3)) ) + P big( ((T,1,4)) ) + P big( ((T,2,1)) ) \
      &+ P big( ((T,2,2)) ) + P big( ((T,2,3)) ) + P big( ((T,3,1)) ) + P big( ((T,3,2)) ) + P big( ((T,4,1)) ) \
      P(E) &= 18 dot 1/72\
      P(E) &= bold(1/4)
    $
  ]
]
#pagebreak()
#lines
#enum.item(3)[
  #enum.item(4)[
    $
      P(F) &= P big( ((H,1,1)) ) + P big( ((H,1,2)) ) + P big( ((H,2,1)) ) + P big( ((H,2,2)) ) \
      &+ P big( ((T,1,1)) ) + P big( ((T,1,2)) ) + P big( ((T,2,1)) ) + P big( ((T,2,2)) ) \
      P(F) &= 8 dot 1/72 \
      P(F) &= bold(1/9)
    $

    $
      P(G) &= P big( ((H,1,2)) ) + P big( ((H,1,4)) ) + P big( ((H,1,6)) ) \
      &+ P big( ((H,2,2)) ) + P big( ((H,2,4)) ) + P big( ((H,2,6)) ) \
      &+ P big( ((H,3,2)) ) + P big( ((H,3,4)) ) + P big( ((H,3,6)) ) \
      &+ P big( ((H,4,2)) ) + P big( ((H,4,4)) ) + P big( ((H,4,6)) ) \
      &+ P big( ((H,5,2)) ) + P big( ((H,5,4)) ) + P big( ((H,5,6)) ) \
      &+ P big( ((H,6,2)) ) + P big( ((H,6,4)) ) + P big( ((H,6,6)) ) \
      P(G) &= 18 dot 1/72 \
      P(G) &= bold(1/4)
    $

    $
      P(H) &= P big( ((H,1,1)) ) + P big( ((H,1,2)) ) + P big( ((H,1,3)) ) + P big( ((H,1,4)) ) + P big( ((H,1,5)) ) + P big( ((H,1,6)) ) \
      +& P big( ((H,2,1)) ) + P big( ((H,2,2)) ) + P big( ((H,2,3)) ) + P big( ((H,2,4)) ) + P big( ((H,2,5)) ) + P big( ((H,2,6)) ) \
      +& P big( ((H,3,1)) ) + P big( ((H,3,2)) ) + P big( ((H,3,3)) ) + P big( ((H,3,4)) ) + P big( ((H,3,5)) ) + P big( ((H,3,6)) ) \
      +& P big( ((H,4,1)) ) + P big( ((H,4,2)) ) + P big( ((H,4,3)) ) + P big( ((H,4,4)) ) + P big( ((H,4,5)) ) + P big( ((H,4,6)) ) \
      +& P big( ((H,5,1)) ) + P big( ((H,5,2)) ) + P big( ((H,5,3)) ) + P big( ((H,5,4)) ) + P big( ((H,5,5)) ) + P big( ((H,5,6)) ) \
      +& P big( ((H,6,1)) ) + P big( ((H,6,2)) ) + P big( ((H,6,3)) ) + P big( ((H,6,4)) ) + P big( ((H,6,5)) ) + P big( ((H,6,6)) ) \
      P(H) &= 36 dot 1/72 \
      P(H) &= bold(1/2)
    $
  ]
]





#pagebreak()
#lines


#enum.item(4)[
  Suppose we toss a two-sided coin until $H$ shows up.
  #enum.item(1)[
    Identify the following events as subsets of the sample space:
    - $E$: Even number of tails before the first $H$.
    $
      {H, T T H, T T T T H, T T T T T T H, dots}
    $
    - $F$: At least 5 tails before the first $H$.
    $
      {T T T T T H, T T T T T T H, T T T T T T T H, dots}
    $
    - $G$: At most 4 tails before the first $H$.
    $
      {H, T H, T T H, T T T H, T T T T H}
    $
  ]

  #enum.item(2)[
    Suppose the coin is tossed such that $P(H) = p in (0,1)$.
    Use this information to calculate the probabilities of the events $E$, $F$, and $G$.
    $
      P(E) &= P(T T H) + P(T T T T H) + P(T T T T T T H) + dots.c \
      P(E) &= (1-p)^2 p + (1-p)^4 p + (1-p)^6 p + dots.c \
      P(E) &= p((1-p)^2 + (1-p)^4 + (1-p)^6 + dots.c) \
      P(E) &= p sum^infinity_(n=0) (1-p)^(2n) \
      P(E) &= p / (1-(1-p)^2) \
      P(E) &= bold(1/(2-p)) \
    $

    $
      P(F) &= P(T T T T T H) + P(T T T T T T H) + P(T T T T T T T H) + dots.c \
      P(F) &= (1-p)^5 p + (1-p)^6 p + (1-p)^7 p + dots.c \
      P(F) &= (1-p)^5 p(1 + (1-p) + (1-p)^2 + dots.c) \
      P(F) &= p(1-p)^5 sum_(n=0)^infinity (1-p)^n \
      P(F) &= (p(1-p)^5)/(1-(1-p)) = bold((1-p)^5) \
    $

    $
      P(G) &= P(H) + P(T H) + P(T T H) + P(T T T H) + P(T T T T H) \
      P(G) &= p + p(1-p) + p(1-p)(1-p) + p(1-p)(1-p)(1-p) + p(1-p)(1-p)(1-p)(1-p)\
      P(G) &= p big( (1 + (1-p) + (1-p)^2 + (1-p)^3 + (1-p)^4) ) \
      P(G) &= p sum^4_(n=0) (1-p)^n \
      P(G) &= p dot ( 1-(1-p)^5 )/(1-(1-p)) \
      P(G) &= bold(1-(1-p)^5) \
    $


  ]
]