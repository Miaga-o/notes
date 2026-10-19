#import "../../presets.typ": *
#show: template.with(show_title: false, show_header: false, math_font: "XITS Math", doc_font: "Times New Roman")
#set page(header: align(right)[STAT 400 \ Joshua Villar])

#let lines = stack(
  line(length: 100%),
  line(length: 100%),
  spacing: 2pt
)


== STAT 400 Homework 6: Random Variables
#lines

#enum.item(1)[
  *Parking Enforcement (Poisson Distribution)* \
  Suppose parking enforcement visits the lot according to the Poisson 
  distribution with a rate $lambda = 0.5$ visits per hour.
  When they visit, all cars without a permit get ticketed.
  The paid parking hours are 8:00 AM to 4:00 PM (8 hours total).

  #enum.item(1)[
    What is the probability that parking enforcement visits the lot at
    least once during the 8-hour day? \
    _(Hint: Calculate the probability of 0 visits and subtract from 1)._

    $
      P(X >= 1) &= 1 - P(X = 0) \
      P(X >= 1) &= 1 - e^(-8 lambda) (8lambda)^0 / 0! \
      P(X >= 1) &= 1 - e^(-4) \
      P(X >= 1) &= bold(0.982)  \
    $
  ]

  #enum.item(2)[
    What is the probability that John can park illegally for $10$ days
    until he gets his first ticket? State any assumptions you are making.

    I will assume that John's car will be in the parking lot for the 
    entire paid duration \ (8:00 AM to 4:00 PM).
    $
      P(X = 0) = e^(-80lambda) lambda^0 / 0! \
      P(X = 0) = bold(e^(-40)) \
    $
  ]

  #enum.item(3)[
    What is the expected number of days John can park
    illegally before he gets a ticket?

    $
      "Let "Y" denote the number of days before John  gets a ticket." \
      therefore Y ~ "Geometric"(1 - e^(-4))
    $
    $

      E(Y) &= 1/(1-e^(-4)) \
      E(Y) &= bold(1.019 "days") \
    $
  ]
]



  #pagebreak()
  #lines



#enum.item(1)[
  #enum.item(4)[
    Find an estimate for the number of days, $d$, such that the
    probability of waiting $d$ days or more for the first ticket is $0.975$. \
    _(Hint: Use the Empirical Rule)._

    $
      P(Y >= d) &= 0.975 \
      (1 - p)^(d-1) &= 0.975 \
      (1 - (1 - e^-4))^(d-1) &= 0.975 \
      (e^(-4))^(d-1) &= 0.975 \
      e^(4-4d) &= 0.975 \
      4 - 4d &= ln(0.975) \ 
      d &= (ln(0.975) - 4)/(-4) \
      d &= bold(1.006 "days")
    $
  ]
]



#pagebreak()
#lines



#enum.item(2)[
  *Casino Roulette (Geometric Distribution)* \
  At a casino, the number of trials needed to win a round of roulette 
  follows a Geometric distribution with a success probability of 
  $p = 0.2$. Let $X$ be the trial number of your first win.

  #enum.item(1)[
    Find the probability that you win a round: \
    #block(width: 100%)[
      *i.* in the first two trials?
      $
        P(X <= 2) &= P(X = 1) + P(X = 2) \
        P(X <= 2) &= p + (1-p)p \
        P(X <= 2) &= 0.2 + (0.8)0.2 \
        P(X <= 2) &= bold(0.36) \
      $
    ]

    #block(width: 100%)[
      *ii.* within the first $10$ trials?
      $
        P(X <= 10) &= 1 - P(X > 10) \
        P(X <= 10) &= 1 - (1 - p)^10 \
        P(X <= 10) &= 1 - (0.8)^10 \
        P(X <= 10) &= bold(0.893)
      $
    ]

    #block(width: 100%)[
      *iii.* in more than $3$ trials?
      $
        P(X > 3) &= (1-p)^3 \
        P(X > 3) &= (0.8)^3 \
        P(X > 3) &= bold(0.512) \
      $
    ]

    #block(width: 100%)[
      *iv.* between $10$ and $20$ trials?
      $
        P(10 < X < 20) &= P(11 <= X <= 19) \
        P(10 < X < 20) &= P(X <= 19) - P(X <= 11)\
        P(10 < X < 20) &= 1 - P(X > 19) - (1 - P(X > 11)) \
        P(10 < X < 20) &= P(X > 11) - P(X > 19) \
        P(10 < X < 20) &= (1-p)^11 - (1-p)^19 \
        P(10 < X < 20) &= (0.8)^11 - (0.8)^19 \
        bold(P(10 < X < 20) &= 0.0715) \
      $
    ]
  ]

  #enum.item(2)[
    Suppose we track $10$ independently selected people.
    We deem a person a “success” if they win a round within $3$ trials.
    Let $Y$ track the number of successful people out of the 10.


    #block(width: 100%)[
      *i.* What is the distribution of $Y$? (State the name and parameters).
      $
        Y &~ "Binomial"(10, 1-0.8^3) \
        bold(Y &~ "Binomial"(10, 0.488)) \
      $
    ]
  ]
]



#pagebreak()
#lines



#enum.item(2)[
  #block(width: 100%)[
    *ii.* What is the probability that there are at least two successful people?
    $
      P(2 <= Y <= 10) &= sum_(y=2)^10 binom(10, y)p^y (1-p)^(10 - y) \
      P(2 <= Y <= 10) &= sum_(y=2)^10 binom(10, y) 0.488^y (0.512)^(10 - y) \
      P(2 <= Y <= 10) &= bold(0.987) \
    $
  ]

  #block(width: 100%)[
    *iii.* What is the expected number of successful people out of $10$?
    $
      E(Y) &= 10 p \
      E(Y) &= 10 (0.488) \
      E(Y) &= bold(4.88 "people") \
    $
  ] 
]




#pagebreak()
#lines



#enum.item(3)[
  *Car Wash (Exponential Distribution)* \
  Suppose $X$ models the time it takes (in hours) to wash a car.
  The probability density function (PDF) is:
  $
    f_X (x) = 2e^(-2x) quad "for" x > 0
  $
  _(Note: This is an Exponential distribution with $lambda = 2$.
  The mean of an Exponential distribution is $1 slash lambda$)._

  #enum.item(1)[
    What is the average amount of time it takes to wash a car?
    $
      E(X) &= bold(1/2 "hours")
    $
  ]

  #enum.item(2)[
    A car is deemed a “success” if it takes less than the average time to wash.
    Calculate $P("Success")$.

    $
      P("Success") &= P(0 < X < 1/2) \
      P("Success") &= integral_0^(1/2) 2e^(-2x) dif x \
      P("Success") &= lr((-e^(-2x))|)_0^(1/2) \
      P("Success") &= 1 - e^(-1) \
      P("Success") &= bold(0.632)
    $
  ]

  #enum.item(3)[
    Among $15$ randomly arriving cars, let $Y$ be the number of successes.
    What is the distribution of $Y$?
    What is the expected number of successes?
    $
      Y ~ bold("Binom"(15, 1-e^(-1)))
    $
    $
      E(Y) &= 15p \
      E(Y) &= 15(1-e^(-1)) \
      E(Y) &= bold(9.482 "successes")
    $
  ]

  #enum.item(4)[
    Suppose we keep track of cars.
    What is the expected number of cars we need to
    track until we get a successful car? \

    $
      "Let "Z" denote the number of cars before a successful car." \
      therefore Z ~ "Geometric"(1-e^(-1))
    $
    $
      E(Z) &= 1/p \
      E(Z) &= 1/(1-e^(-1)) \
      E(Z) &= bold(1.582 "cars") \
    $
  ]
]
