#import "../../presets.typ": *
#show: template.with(show_title: false, show_header: false, math_font: "XITS Math")
#set page(header: align(right)[STAT 400 \ Joshua Villar])

#let lines = stack(
  line(length: 100%),
  line(length: 100%),
  spacing: 2pt
)


== STAT 400 Homework 3: Conditional Probability and Bayes' Theorem
#lines
#enum.item(1)[
  The Monty-Hall problem/game. The Monty-Hall game is as follows: 
  
  There are three doors, with a prize behind one of the doors. \
  - Step 1: You get to select a door.
  - Step 2: Monty opens one of the other two, one without the prize behind it.
  - Step 3: Monty gives you the option to either stick with your original choice, or switch to the now other unopened door.

  We are interested in calculating the probability of winning the prize if we decide to switch at Step 3, and if we decide not to switch at Step 3.


  #enum.item(1)[
    Calculate the probabilities of winning the prize with switching and without switching at Step 3 in the three-door setting.
    #align(center)[
      #tidy-tree-graph(
        spacing: (20pt, 50pt),
        node-inset: 5pt
      )[
        - Start
          + $1 slash 3$
          - Prize Door
            + $1 slash 2$
            - Switch
              - Door
            + $1 slash 2$
            - No switch
              - Prize Door
          + $1 slash 3$
          - Door 1
            + $1 slash 2$
            - Switch
              - Prize Door
            + $1 slash 2$
            - No switch
              - Door
          + $1 slash 3$
          - Door 2
            + $1 slash 2$
            - Switch
              - Prize Door
            + $1 slash 2$
            - No switch
              - Door
      ]
    ]

    $
      P("Prize Door"|"Switch") &= bold(2/3) \
      P("Prize Door"|"No switch") &= bold(1/3) \
    $
  ]
]

#pagebreak()
#lines

#enum.item(1)[
  #enum.item(2)[
    Now suppose instead of three doors, we were to start with 100 doors at Step 1, and Monty opens 98 doors that are not the prize door at Step 2.
    Calculate the probability of winning the prize if you switch, and if you don’t switch your choices at Step 3.
    #align(center)[
      #tidy-tree-graph(
        spacing: (20pt, 50pt),
        node-inset: 5pt
      )[
        - Start
          + $1 slash 3$
          - Prize Door
            + $1 slash 2$
            - Switch
              - Door
            + $1 slash 2$
            - No switch
              - Prize Door
          + $1 slash 3$
          - Door 1
            + $1 slash 2$
            - Switch
              - Prize Door
            + $1 slash 2$
            - No switch 
              - Door
          + $1 slash 3$
          - Door 2
            + $1 slash 2$
            - Switch
              - Prize Door
            + $1 slash 2$
            - No switch 
              - Door
          - $dots.c$
          + $1 slash 3$
          - Door 99
            + $1 slash 2$
            - Switch
              - Prize Door
            + $1 slash 2$
            - No switch 
              - Door
      ]
    ]
    $
      P("Prize Door"|"Switch") &= bold(99/100) \
      P("Prize Door"|"No switch") &= bold(1/100)
    $
  ]

  #enum.item(3)[
    Now, suppose there are 10 doors at Step 1. Let $k$ be an integer between 1 and 8 inclusive.
    At Step 2, Monty opens $k$ doors that don’t have the prize behind them.
    At Step 3, you can either stick with your original choice, or choose a door from the \ $n-k-1$ unopened doors.
    
    What is the probability of winning the prize if you switch doors, and if you don’t?

    $
      P("Prize Door"|"Switch") &= 9/10 dot 1/(n-k-1) \
      P("Prize Door"|"Switch") &= 9/10 dot 1/(10-k-1) \
      P("Prize Door"|"Switch") &= bold(9/(90-10k)) \ \ \
      P("Prize Door"|"No switch") &= bold(1/10)
    $
  ]
]



#pagebreak()
#lines



#enum.item(2)[
  You are playing in a tournament with 20 ranked players, and your rank is 15.
  The first round of the tournament involves randomly pairing you with one of the other 19 players, after which you play three games, and the player that loses two or more games is eliminated (all the games are played, irrespective of previous results).
  Additionally we know that:
  - $P("winning against a player ranked between "1" and "5) = 0.01$
  - $P("winning against a player ranked between "6" and "13) = 0.2$
  - $P("winning against a player ranked between "14" and "20) = 0.5$

  #enum.item(1)[
    Draw the labeled tree diagram for this setup using the provided information.

    #align(center)[
      #tidy-tree-graph(
        spacing: (25pt, 30pt),
        node-inset: 5pt
      )[
        - Start
          + 5/19
          - Subtree 1 to 5, winning chance $0.01$
          + 8/19
          - Subtree 6 to 13, winning chance $0.2$
          + 6/19
          - Subtree 14 to 20, winning chance $0.5$, without 15
      ]

      Subtree $1$ to $5$, winning chance $w$
      #align(center)[
        #tidy-tree-graph(
          spacing: (20pt, 30pt),
          node-inset: 5pt
        )[

          - Ranked between m and n, inclusive
            + $w$
            - Win
              + $w$
              - Win
                + $w$
                - *Win*
                + $1-w$
                - *Loss*
              + $1-w$
              - Loss
                + $w$
                - *Win*
                + $1-w$
                - Loss
            + $1-w$
            - Loss
              + $w$
              - Win
                + $w$
                - *Win*
                + $1-w$
                - Loss
              + $1-w$
              - Loss
                + $w$
                - Win
                + $1-w$
                - Loss
        ]
      ]
    ]
  ]

  #enum.item(2)[
    Calculate the probability that your opponent gets eliminated from the tournament.
    $
      P("opponent eliminated") &= 5/19 dot (0.01^3 + 0.01^2 dot 0.99 + 0.01 dot 0.99 dot 0.01 + 0.99 dot 0.01^3) \
      &+ 8/19 dot (0.2^3 + 0.2^2 dot 0.8 + 0.2 dot 0.8 dot 0.2 + 0.8 dot 0.2^2) \
      &+ 6/19 dot (0.5^3 + 0.5^3 + 0.5^3 + 0.5^3) \
      P("opponent eliminated") &= bold(0.202) \
    $
  ]
]

#pagebreak()
#lines

#enum.item(2)[
  #enum.item(3)[
    Given that you win the round, what is the probability that you eliminated an opponent ranked between 1 and 5?
    $
      P("1 to 5"|"opponent eliminated") &= (P("1 to 5") P("opponent eliminated"|"1 to 5"))/(P("opponent eliminated")) \
      P("1 to 5"|"opponent eliminated") &= (5 slash 19 dot (0.01^3 + 0.01^2 dot 0.99 + 0.01 dot 0.99 dot 0.01 + 0.99 dot 0.01^3))/(0.202) \
      P("1 to 5"|"opponent eliminated") &= bold(0.000389)
    $
  ]

  #enum.item(4)[
    Given that you lost the round, what is the probability that you were eliminated by an opponent ranked between 14 and 20?

    $
      P("14 to 20"|"opponent won") &= (P("14 to 20") P("opponent won"|"14 to 20"))/(P("opponent won")) \
      P("14 to 20"|"opponent won") &= (6   slash 19 dot (0.5^3 + 0.5^3 + 0.5^3 + 0.5^3))/(1-0.202) \
      P("14 to 20"|"opponent won") &= bold(0.198)
    $
  ]
]




#enum.item(3)[
  You are playing in a tournament with 20 ranked players, and your rank is 3.
  The first round of the tournament involves randomly pairing you with one of the other 19 players, after which you play three games, and the player that loses two or more games is eliminated (all the games are played, irrespective of previous results).
  Additionally we know that:
  - $P("winning against a player ranked between "1" and "5) = 0.5$
  - $P("winning against a player ranked between "6" and "13) = 0.8$
  - $P("winning against a player ranked between "14" and "20) = 0.9$

  #enum.item(1)[
    Draw the labeled tree diagram for this setup using the provided information.

    #align(center)[
      #tidy-tree-graph(
        spacing: (25pt, 30pt),
        node-inset: 5pt
      )[
        - Start
          + 4/19
          - Subtree 1 to 5, winning chance $0.5$, without 3
          + 8/19
          - Subtree 6 to 13, winning chance $0.8$
          + 7/19
          - Subtree 14 to 20, winning chance $0.9$
      ]

      Subtree $1$ to $5$, winning chance $w$
      #align(center)[
        #tidy-tree-graph(
          spacing: (20pt, 30pt),
          node-inset: 5pt
        )[

          - Ranked between m and n, inclusive
            + $w$
            - Win
              + $w$
              - Win
                + $w$
                - *Win*
                + $1-w$
                - *Loss*
              + $1-w$
              - Loss
                + $w$
                - *Win*
                + $1-w$
                - Loss
            + $1-w$
            - Loss
              + $w$
              - Win
                + $w$
                - *Win*
                + $1-w$
                - Loss
              + $1-w$
              - Loss
                + $w$
                - Win
                + $1-w$
                - Loss
        ]
      ]
    ]
  ]
]

#pagebreak()
#lines

#enum.item(3)[
  #enum.item(2)[
    Calculate the probability that your opponent gets eliminated from the tournament.
    $
      P("opponent eliminated") &= 4/19 dot (0.5^3 + 0.5^3 + 0.5^3 + 0.5^3) \
      &+ 8/19 dot (0.8^3 + 0.8^2 dot 0.2 + 0.8 dot 0.2 dot 0.8 + 0.2 dot 0.8^2) \
      &+ 7/19 dot (0.9^3 + 0.9^2 dot 0.1 + 0.9 dot 0.1 dot 0.9 + 0.1 dot 0.9^2) \
      P("opponent eliminated") &= bold(0.841) \
    $
  ]


  #enum.item(3)[
    Given that you win the round, what is the probability that you eliminated an opponent ranked between 1 and 5?
    $
      P("1 to 5"|"opponent eliminated") &= (P("1 to 5") P("opponent eliminated"|"1 to 5"))/(P("opponent eliminated")) \
      P("1 to 5"|"opponent eliminated") &= (4 slash 19 dot (0.5^3 + 0.5^3 + 0.5^3 + 0.5^3))/(0.841) \
      P("1 to 5"|"opponent eliminated") &= bold(0.125)
    $
  ]


  #enum.item(4)[
    Given that you lost the round, what is the probability that you were eliminated by an opponent ranked between 14 and 20?

    $
      P("14 to 20"|"opponent won") &= (P("14 to 20") P("opponent won"|"14 to 20"))/(P("opponent won")) \
      P("14 to 20"|"opponent won") &= (7 slash 19 dot (1-(0.9^3 + 0.9^2 dot 0.1 + 0.9 dot 0.1 dot 0.9 + 0.1 dot 0.9^2)))/(1-0.841) \
      P("14 to 20"|"opponent won") &= bold(0.0647)
    $
  ]
]



#pagebreak()
#lines



#enum.item(4)[
  Suppose we develop a certain test to detect the presence of a disease $D$, and one which outputs a test result to be positive or negative.
  Suppose the prevalence of the disease is given as $P(D) = p in (0,1)$.

  Suppose the probability that the test detects the disease correctly is $q in (0,1)$.


  #enum.item(1)[
    Calculate the probability that you have the disease given that the test result is positive, and the probability that you don’t have the disease given that the test result is negative.

    $
      P(D | "Pos") &= (P(D) P("Pos"|D))/(P(D)P("Pos"|D) + P(D^complement)P("Pos"|D^complement)) \
      P(D | "Pos") &= bold((p q)/(p q + (1-p)(1-q))) \ \ \
      P(D^complement | "Neg") &= (P(D^complement) P("Neg"|D^complement))/(P(D^complement)P("Neg"|D^complement) + P(D)P("Neg"|D)) \
      P(D^complement | "Neg") &= bold(((1-p) q)/((1-p) q + p(1-q))) \
    $
  ]

  #enum.item(2)[
    In the above setting, what is the value of $q$ that would ensure that $P(D) < P(D|"Pos")$?
    $
      P(D) &< P(D|"Pos") \
      p &< (p q)/(p q + (1-p)(1-q)) \
      p &< (p q)/(2p q - q - p + 1) \
      2p^2 q - p q - p^2 + p &< p q \
      2p q - q - p + 1 &< q \
      - p + 1 &< q- 2p q + q \
      1 - p &< (2-2p)q \
      1 &< 2q \
      bold(1/2 &< q)
    $
  ]
]

#pagebreak()
#lines

#enum.item(4)[
  #enum.item(3)[
    Suppose $P(D)=0.9999$, what is the minimum value of $q$ that would ensure that $P(D|"Pos") >= 0.9$.
    Interpret this situation verbally.
    $
      P(D|"Pos") &>= 0.9 \
      (P(D) P("Pos"|D))/(P(D)P("Pos"|D) + P(D^complement)P("Pos"|D^complement)) &>= 0.9 \
      (0.9999 q)/(0.9999q + 0.0001(1-q)) &>= 0.9 \
      (0.9999 q)/(0.9998q + 0.0001) &>= 0.9 \
      0.9999 q &>= 0.89982 q + 0.00009 \
      0.10008q &>= 0.00009 \
      q &>= 0.000899 \
      q_"min" &= bold(0.000899)
    $

    *If the prevalence of the disease is very high ($99.99%$),
    then even if the the test is very rarely correct (0.0899% minimum),
    most people who test positive ($90%$ minimum) will have the disease*.
  ]

  #enum.item(4)[
    Suppose $P(D)=0.0001$, what is the minimum value of $q$ that would ensure that $P(D^complement|"Neg") >= 0.9$.
    Interpret this situation verbally.
    $
      P(D^complement|"Neg") &>= 0.9 \

      (P(D^complement) P("Neg"|D^complement))/(P(D^complement)P("Neg"|D^complement) + P(D)P("Neg"|D)) &>= 0.9 \
      (0.9999 q)/(0.9999q + 0.0001(1-q)) &>= 0.9 \
      (0.9999 q)/(0.9998q + 0.0001) &>= 0.9 \
      0.9999 q &>= 0.89982 q + 0.00009 \
      0.10008q &>= 0.00009 \
      q &>= 0.000899 \
      q_"min" &= bold(0.000899)
    $
    *If the prevalence of the disease is very low ($0.01%$),
    then even if the the test is very rarely correct (0.0899% minimum),
    most people who test negative ($90%$ minimum) will not have the disease*.
  ]
]