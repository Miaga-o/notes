#import "../../presets.typ": *
#show: template.with(show_title: false, show_header: false, math_font: "XITS Math")
#set page(header: align(right)[STAT 400 \ Joshua Villar])

#let lines = stack(
  line(length: 100%),
  line(length: 100%),
  spacing: 2pt
)


== STAT 400 Homework 4: Random Variables, Expected Value, and Variance
#lines
*Instructions.* Show your work and simplify final answers. You may use:
$
  EE[a X + b] = a EE[X] + b, &#h(3em)&
  "Var"(a X + b) = a^2"Var"(X), &#h(3em)&
  "Var"(X) = EE[X^2] - (EE[X])^2
$

If random variables are stated to be independent, you may also use:
$
  "Var"(X + Y) = "Var"(X) + "Var"(Y)
$


#enum.item(1)[
  *Three step experiment (mixture distribution).* \
  A bag contains 10 coins: 9 fair coins (type $F$) and 1 unfair coin (type $U$). For the unfair coin, $P(H) = 0.8$.

  #enum.item(1)[
    Step 1: Choose one coin uniformly at random from the bag.
  ]
  #enum.item(2)[
    Step 2: Toss the chosen coin once.
  ]
  #enum.item(3)[
    Step 3: If the toss is $H$, roll a fair 4-sided die with faces ${1,2,3,4}$.
    If the toss is $T$, roll a 4-sided die with
    $
      P(1) = 0.2, &#h(3em)&
      P(2) = 0.3 &#h(3em)&
      P(3) = 0.2 &#h(3em)&
      P(4) = 0.3
    $
  ]

  Define events $F = {"chosen coin is fair"}$ and $G = {"coin toss is heads"}$.
  Let $D$ be the die result from Step 3, and define the indicator random variable
  $
    X = bold(1){D" is even"}
  $


  #enum.item(1)[
    Compute $P(F)$, $P(G)$, and $P(G|F)$.
    $
      P(F) = 9/10 = bold(0.9)
    $
    $
      P(G | F) = 1/2 = bold(0.5)
    $
    $
      P(G) &= P(F)P(G | F) + P(F^complement) P(G|F^complement) \
      P(G) &= 9/10 dot 1/2 + 1/10 dot 8/10 \
      P(G) &= 9/20 + 8/100 \
      P(G) &= 53/100 = bold(0.53) \
    $
  ]

  #enum.item(2)[
    Compute $P(D=1)$, $P(D=2)$, $P(D=3)$, and $P(D=4)$.
    $
      P(D = 1) &= P(G)P(1|G) + P(G^complement)P(1|G^complement) \
      P(D = 1) &= 53/100 dot 1/4 + (1-53/100) dot 2/10 \
      P(D = 1) &= bold(0.2265) \
    $
  ]
]

#pagebreak()
#lines

#enum.item(1)[
  #enum.item(2)[
    $
      P(D = 2) &= P(G)P(2|G) + P(G^complement)P(2|G^complement) \
      P(D = 2) &= 53/100 dot 1/4 + (1-53/100) dot 3/10 \
      P(D = 2) &= bold(0.2735) \
    $

    $
      P(D = 3) &= P(G)P(3|G) + P(G^complement)P(3|G^complement) \
      P(D = 3) &= 53/100 dot 1/4 + (1-53/100) dot 2/10 \
      P(D = 3) &= bold(0.2265) \
    $

    $
      P(D = 4) &= P(G)P(4|G) + P(G^complement)P(4|G^complement) \
      P(D = 4) &= 53/100 dot 1/4 + (1-53/100) dot 3/10 \
      P(D = 4) &= bold(0.2735) \
    $
  ]

  #enum.item(3)[
    Compute $EE[D]$ and $"Var"(D)$.
    $
      EE[D] &= 1 dot 0.2265 + 2 dot 0.2735 + 3 dot 0.2265 + 4 dot 0.2735 \
      EE[D] &= bold(2.547) 
    $

    $
      EE[D^2] &= 1^2 dot 0.2265 + 2^2 dot 0.2735 + 3^2 dot 0.2265 + 4^2 dot 0.2735  \
      EE[D^2] &= 7.735 \ \
      "Var"(D) &= EE[D^2] - (EE[D])^2 \
      "Var"(D) &= 7.735 - 2.547^2 \
      "Var"(D) &= bold(1.247791)
    $
  ]

  #enum.item(4)[
    Compute $EE[X]$ and $"Var"(X)$.

    $
      EE[X] &= 0 dot 0.2265 + 1 dot 0.2735 + 0 dot 0.2265 + 1 dot 0.2735 \
      EE[X] &= bold(0.547) 
    $

    $
      EE[X^2] &= 0^2 dot 0.2265 + 1^2 dot 0.2735 + 0^2 dot 0.2265 + 1^2 dot 0.2735  \
      EE[X^2] &= 0.547 \ \
      "Var"(X) &= EE[X^2] - (EE[X])^2 \
      "Var"(X) &= 0.547 - 0.547^2 \
      "Var"(X) &= bold(0.247791)
    $
  ]
]

#pagebreak()
#lines

#enum.item(1)[
  #enum.item(5)[
    Determine whether $X$ and $F$ are independent (justify using probabilities).
    $
      P(X inter F) &= P(X) P(F) \
      P(X | F) P(F)  &= P(X) P(F) \
      P(X | F) &= P(X) \
      P(X | F) &= P(D = 2) + P(D = 4) \
      P(X | F) &= 0.2375 + 0.2375 \
      P(X | F) &= 0.475 \
      P(G|F) P(2|G) + P(G^complement|F) P(2|G^complement) &+ \ P(G|F) P(4|G) + P(G^complement|F) P(4|G^complement) &= 0.475 \
      0.5 dot 0.25 + 0.5 dot 0.3 + 0.5 dot 0.25 + 0.5 dot 0.3&= 0.475 \
      0.55 eq.not 0.475
    $
    *$X$ and $F$ are dependent.*
  ]
]



#pagebreak()
#lines



#enum.item(2)[
  *Four coin tosses (binomial random variables).* \
  A coin with $P(H) = 0.5$ is tossed 4 times. Let $H$ be the number of heads and $T$ be the number of tails.

  #enum.item(1)[
    State the distribution of $H$ and compute $EE[H]$ and $"Var"(H)$.
    $
      bold(H &~ "Binom"(4, 0.5))
    $
    $
      EE[H] = 4 dot 0.5 = bold(2)
    $
    $
      "Var"(H) &= 4 dot 0.5 dot (1-0.5) = bold(1) \
    $
  ]

  #enum.item(2)[
    Compute $EE[T]$ and $"Var"(T)$ using the relationship between $H$ and $T$.
    $
      EE[T] = EE[4-H] = 4-EE[H] = bold(2)
    $
    $
      "Var"(T) = "Var"(4-H) = "Var"(H) = bold(1) \
    $
  ]

  #enum.item(3)[
    Define $Y = bold(1){H > T}$. Compute $EE[Y]$ and $"Var"(Y)$.
    $
      EE[Y] &= 1 dot P(H = 3) + 1 dot P(H = 4) \
      EE[Y] &= binom(4, 3) (0.5)^4 + binom(4, 4) (0.5)^4 \
      EE[Y] &= 0.25 + 0.0625 \
      EE[Y] &= bold(0.3125)
    $
    $
      EE[Y^2] &= binom(4, 3) (0.5)^4 + binom(4, 4) (0.5)^4 \
      EE[Y^2] &= 0.25 + 0.0625 \
      EE[Y^2] &= 0.3125 \
      "Var"(Y) &= EE[Y^2] - (EE[Y])^2 \
      "Var"(Y) &= 0.3125 - 0.3125^2 \
      "Var"(Y) &= bold(0.21484375)
    $
  ]
]



#pagebreak()
#lines



#enum.item(3)[
  *Four biased coin tosses (compare to the fair case).* \
  A coin with $P(H) = 0.9$ is tossed 4 times.
  Let $H$ be the number of heads and $T$ be the number of tails.

  #enum.item(1)[
    State the distribution of $H$ and compute $EE[H]$ and $"Var"(H)$.
    $
      bold(H &~ "Binom"(4, 0.9))
    $
    $
      EE[H] = 4 dot 0.9 = bold(3.6) \
    $
    $
      "Var"(H) &= 4 dot 0.9 dot (1-0.9) = bold(0.36) \
    $
  ]

  #enum.item(2)[
    Compute $EE[T]$ and $"Var"(T)$.
    $
      EE(T) = 4 dot 0.1 = bold(0.4) \
      "Var"(T) = 4 dot 0.1 dot (1-0.1) = bold(0.36)
    $
  ]

  #enum.item(3)[
    Define $Y = bold(1){H > T}$. Compute $EE[Y]$ and $"Var"(Y)$.
    $
      EE[Y] &= 1 dot P(H = 3) + 1 dot P(H = 4) \
      EE[Y] &= binom(4,3) (0.9)^3(0.1)^1 + binom(4,4) (0.9)^4 \
      EE[Y] &= 0.2916 + 0.6561 \
      EE[Y] &= bold(0.9477)
    $

    $
      EE[Y^2] &= 1^2 dot binom(4,3) (0.9)^3(0.1)^1 + 1^2 dot binom(4,4) (0.9)^4 \
      EE[Y^2] &= 0.2916 + 0.6561 \
      EE[Y^2] &= 0.9477 \
      "Var"(Y) &= EE[Y^2] - (EE[Y])^2 \
      "Var"(Y) &= 0.9477 - 0.9477^2 \
      "Var"(Y) &= bold(0.04956471)
    $
  ]
  #enum.item(4)[
    Briefly compare your answers in this problem to Problem 2.
    Which quantities changed, and why?

    *Every answer changed due to the bias toward the head side.*
    - *$EE[H]$ decreased from 2 to 3.6, and $EE[T]$ decreased from $2$ to $0.4$.*
    - *$"Var"(H)$ and $"Var"(T)$ decreased from 1 to 0.36.*
    - *$EE[Y]$ increased from $0.3125$ to $0.9477$, and $"Var"(Y)$ decreased from $0.21484375$ to $0.04956471$.*
  ]
]



#pagebreak()
#lines



#enum.item(4)[
  *Two fair dice (sum, max, difference).* \
  Two fair six-sided dice are rolled. Let the outcomes be $(X_1, X_2)$.
  
  Define the random variables
  $
    S = X_1 + X_2, &#h(3em)&
    M = max{X_1, X_2}, &#h(3em)&
    W = X_1 - X_2
  $

  #enum.item(1)[
    Compute $EE[S]$ and $"Var"(S)$.
    $
      EE[S] &= 2 dot P(S = 2) + 3 dot P(S = 3) + 4 dot P(S = 4) + 5 dot P(S = 5) \
      &+ 6 dot P(S = 6) + 7 dot P(S = 7) + 8 dot P(S = 8) + 9 dot P(S = 9) \
      &+ 10 dot P(S = 10) + 11 dot P(S = 11) + 12 dot P(S = 12) \
      EE[S] &= 2 dot 1/36 + 3 dot 2/36 + 4 dot 3/36 + 5 dot 4/36 + 6 dot 5/36 + 7 dot 6/36 \
      &+ 8 dot 5/36 + 9 dot 4/36 + 10 dot 3/36 + 11 dot 2/36 + 12 dot 1/36 \
      EE[S] &= bold(7)
    $

    $
      EE[S^2] &= 2^2 dot 1/36 + 3^2 dot 2/36 + 4^2 dot 3/36 + 5^2 dot 4/36 + 6^2 dot 5/36 + 7^2 dot 6/36 \
      &+ 8^2 dot 5/36 + 9^2 dot 4/36 + 10^2 dot 3/36 + 11^2 dot 2/36 + 12^2 dot 1/36 \
      EE[S^2] &= 54.833 \
      "Var"(S) &= EE[S^2] - (EE[S])^2 \
      "Var"(S) &= 54.833 - (7)^2 \
      "Var"(S) &= bold(5.833) \
    $
  ]

  #enum.item(2)[
    Compute $EE[W]$ and $"Var"(W)$.
    $
      EE[W] &= -5 dot P(W = -5) - 4 dot P(W = -4) - 3 dot P(W = -3) - 2  dot P(W = -2) - 1 dot P(W = -1) \
      &+ 0 dot P(W = 0) + 1 dot P(W = 1) + 2 dot P(W = 2) + 3 dot P(W = 3) + 4 dot P(W = 4) + 5 dot P(W = 5) \
      EE[W] &= -5 dot 1/36 - 4 dot 2/36 - 3 dot 3/36 - 2  dot 4/36 - 5/36
      + 0 + 5/36 + 2 dot 4/36 + 3 dot 3/36 + 4 dot 2/36 + 5 dot 1/36 \
      EE[W] &= bold(0)
    $

    $
      EE[W^2] &= (-5)^2 dot 1/36 + (-4)^2 dot 2/36 + (-3)^2 dot 3/36 + (-2)^2  dot 4/36 + (-1)^2 5/36 \
      &+ 0 + 1^2 dot 5/36 + 2^2 dot 4/36 + 3^2 dot 3/36 + 4^2 dot 2/36 + 5^2 dot 1/36 \
      EE[W^2] &= 5.833 \
      "Var"(W) = EE[W^2] - (E[W])^2 \
      "Var"(W) = 5.833 - 0^2 \
      "Var"(W) = bold(5.833)\
    $
  ]
]

#pagebreak()
#lines

#enum.item(4)[
  #enum.item(3)[
    Compute $EE[M]$.
    $
      EE[M] &= 1 dot P(M = 1) + 2 dot P(M = 2) + 3 dot P(M = 3) + 4 dot P(M = 4) + 5 dot P(M = 5) + 6 dot P(M = 6) \
      EE[M] &= 1/36 + 2 dot 3/36 + 3 dot 5/36 + 4 dot 7/36 + 5 dot 9/36 + 6 dot 11/36 \
      EE[M] &= bold(4.472)
    $
  ]

  #enum.item(4)[
    Compute $"Var"(M)$.
    $
      EE[M^2] &= 1^2 dot 1/36 + 2^2 dot 3/36 + 3^2 dot 5/36 + 4^2 dot 7/36 + 5^2 dot 9/36 + 6^2 dot 11/36 \
      EE[M^2] &= 21.972 \
      "Var"(M) &= EE[M^2] - (EE[M])^2 \
      "Var"(M) &= 24.472 - 4.472^2 \
      "Var"(M) &= bold(1.971)
    $
  ]
]