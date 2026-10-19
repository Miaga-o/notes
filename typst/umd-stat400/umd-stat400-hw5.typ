#import "../../presets.typ": *
#show: template.with(show_title: false, show_header: false, math_font: "XITS Math")
#set page(header: align(right)[STAT 400 \ Joshua Villar])

#let lines = stack(
  line(length: 100%),
  line(length: 100%),
  spacing: 2pt
)


== STAT 400 Homework 5: Random Variables
#lines

#enum.item(1)[
  An appliance store receives a shipment of $30$ ovens, $5$ of which are defective (unknown to the manager).
  The store manager selects $4$ ovens at random, without replacement,
  and tests to see if they are defective.
  Let $X$ be the number of defective ovens found in the sample of $4$.
  
  Calculate the probability mass function (PMF) of $X$.

  $
    P_X (0) &= P(X=0) = (binom(5,0) dot binom(25, 4)) / (binom(30,4)) \
    P_X (0) &= bold(0.462)
  $
  $
    P_X (1) &= P(X=1) = (binom(5,1) dot binom(25, 3)) / (binom(30,4))  \
    P_X (1) &= bold(0.420)
  $
  $
    P_X (2) &= P(X=2) = (binom(5,2) dot binom(25, 2)) / (binom(30,4))  \
    P_X (2) &= bold(0.109)
  $
  $
    P_X (3) &= P(X=3) = (binom(5,3) dot binom(25, 1)) / (binom(30,4))  \
    P_X (3) &= bold(0.00912)
  $
  $
    P_X (4) &= P(X=4) = (binom(5,4) dot binom(25, 0)) / (binom(30,4))  \
    P_X (4) &= bold(0.000182)
  $
]



#pagebreak()
#lines



#enum.item(2)[
  Consider the function
  $
    p(x) = (e^(-5) 5^x)/(x!), quad x in {0, 1, 2, 3, 4, 5, dots}.
  $

  #enum.item(1)[
    Show that $p(x)$ satisfies the conditions to be a probability mass function.
    $ "PMF Property 1" $
    $e^(-5)$ is a positive constant.
    Additionally, $5^x$ and $x!$ are positive for any value of $x$.
    Thus, $p(x) >= 0$.

    $ "PMF Property 2" $
    Let $scr(X) = {0, 1, 2, 3, 4, 5, dots}$.
    $
      sum_(x in scr(X)) p(x) &= sum_(x=0)^infinity (e^(-5) 5^x)/(x!) \
      sum_(x in scr(X)) p(x) &= e^(-5) sum_(x=0)^infinity (5^x)/(x!) \
      sum_(x in scr(X)) p(x) &= e^(-5) e^5 \
      sum_(x in scr(X)) p(x) &= 1
    $
    \
    *$therefore p(x)$ is a probability mass function.*
  ]

  #enum.item(2)[
    Let
    $
      Y = 3^X.
    $
    Calculate the PMF of $Y$.
    $
      P_Y (3^x) &= P(Y = 3^x) = P(X = x) \
      P_Y (3^x) &= p(x) \
      P_Y (3^x) &= bold((e^(-5)5^x)/x!) \
    $
  ]

  #enum.item(3)[
    Calculate the expected value of $Y$, that is, $E(Y)$.

    Let $scr(X) = {0,1,2,3,4,5,dots}$
    $
      E(Y) &= sum_(x in scr(X)) 3^x (e^(-5)5^x)/x! = sum_(x = 0)^infinity 3^x (e^(-5)5^x)/x! \
      E(Y) &= e^(-5) sum_(x = 0)^infinity (15^x)/x! \
      E(Y) &= e^(-5) e^15 = bold(e^10)\
    $
  ]
]



#pagebreak()
#lines



#enum.item(3)[
  Suppose
  $
    f(x) = cases(
      1/(x+1)^6 comma space & "if" x in (0, infinity) comma,
      0 comma & "else".
    )
  $

  #enum.item(1)[
    Find the constant $c$ so that $c f(x)$ satisfies the conditions to be a probability density function of a random variable, say $X$.
    Use Desmos to draw the graph of the density function $f_X (x)$.
    $ "PDF Property 1" $
    $
      c f(x) &>= 0 \
      c/(x+1)^6 &>= 0 \
      therefore c &>= 0
    $

    $ "PDF Property 2" $
    $
      integral_0^infinity c f(x) dif x &= 1 \
      c integral_0^infinity 1/(x + 1)^6 dif x &= 1 \
      c lr((-1/(5(x+6)^5))|)_0^infinity &= 1 \
      lim_(b->infinity) (c lr((-1/(5(x + 1)^5))|)_0^b) &= 1 \
      lim_(b->infinity) (c (-1/(5(b + 1)^5) + 1/(5(1)^5))) &= 1 \
      c/(5) &= 1 \
      bold(c &= 5)
    $
  ]
]

#pagebreak()
#lines

#enum.item(3)[
  #enum.item(2)[
    Calculate the expected value $E(X)$ and the CDF $F_X (x)$.
    $
      E(X) &= 5 integral_(0)^infinity x f_X (x) dif x \ 
    $
    $
      u &= x+1 \
      dif u &= dif x
    $
    $
      E(X) &= 5 integral_(1)^infinity (u-1)/u^6 dif u \ 
      E(X) &= 5 integral_(1)^infinity (1/u^5 - 1/u^6) dif u \
      E(X) &= 5 lr((-1/(4u^4)+ 1/(5u^5))|)_1^infinity \
      E(X) &= lim_(b->infinity) (5 lr((-1/(4u^4)+ 1/(5u^5))|)_1^b) \
      E(X) &= lim_(b->infinity) (5 (-1/(4b^4) + 1/(5b^5) + 1/4 - 1/5)) \
      E(X) &= 5/4 - 5/5 \
      E(X) &= bold(0.25) \
    $

    $
      F_X (x) &= integral_0^x 5 f(t) dif t \
      F_X (x) &= 5 integral_0^x (dif t)/(t+1)^6 \
      F_X (x) &= 5 lr((-1/(5(t+1)^5) )|)_0^x \
      F_X (x) &= -5/(5(x+1)^5) + 5/5 \
      F_X (x) &= bold(1 - 1/(x+1)^5) \
    $
  ]
]

#pagebreak()
#lines

#enum.item(3)[
  #enum.item(3)[
    Calculate the $p^"th"$ percentiles for
    $
      p = 0.2, #h(0.4em) 0.5, #h(0.4em) 0.8, #h(0.4em) 0.99.
    $

    $
      F_X (n_p) &= p \
      1 - 1/(n_p + 1)^5 &= p \
      1 - p &= 1/(n_p + 1)^5 \
      (n_p + 1)^5 &= 1/(1 - p) \
      n_p &= 1/(1 - p)^(1 slash 5) - 1 \
    $

    $
      n_0.2 &= 1/(1 - 0.2)^(1 slash 5) - 1 \
      n_0.2 &= bold(0.0456) \

      n_0.5 &= 1/(1 - 0.5)^(1 slash 5) - 1 \
      n_0.5 &= bold(0.149) \

      n_0.8 &= 1/(1 - 0.2)^(1 slash 5) - 1 \
      n_0.8 &= bold(0.380) \

      n_0.99 &= 1/(1 - 0.2)^(1 slash 5) - 1 \
      n_0.99 &= bold(1.512) \
    $
  ]

  #enum.item(4)[
    Calculate the $alpha^"th"$ critical value for
    $
      alpha = 0.05.
    $

    $
      P(X >= x_0.05) &= 0.05 \
      F_X (x_0.05) &= 1 - 0.05 \
      1 - 1/(x_0.05 + 1)^5 &= 0.95 \
      0.05 &= 1/(x_0.05 + 1)^5 \
      (x_0.05 + 1)^5 &= 20 \
      x_0.05 &= bold(0.821) \
    $
  ]
]

#pagebreak()
#lines

#enum.item(3)[
  #enum.item(5)[
    The random variable X is a special case of the Pareto distribution,
    which is used to describe the “Pareto Principle,” often used to model wealth,
    the impact of different factors on sales, and even online dating trends.

    The principle broadly suggests that the majority of the impact, wealth, or ownership is often determined by a small
    (yet influential) set of actions or people.
    Calculate
    $
      P(X <= 1),
    $
    and use this to give an intuitive explanation of the Pareto Principle.
    $
      P(X <= 1) &= F_X (1) \
      P(X <= 1) &= 1 - 1/(1 + 1)^5 \
      P(X <= 1) &= 0.96875 \
    $

    *$X$ assuming any value in $(0, 1]$ is already very
    likely because\ $P(X <=1) = 0.96875$ despite $x in (0, infinity)$.*
  ]
]



#pagebreak()
#lines



#enum.item(4)[
  Suppose
  $
    f(x) = cases(
      x^2 (1-x)^2 comma space & "if" x in (0, 1) comma,
      0 comma & "else".
    )
  $

  #enum.item(1)[
    Find the constant $c$ so that $c f(x)$ satisfies the conditions to 
    be a probability density function of a random variable, say $X$.
    $ "PDF Property 1" $
    $
      c f(x) &>= 0 \
      c x^2 (1-x)^2 &>= 0 \
      therefore c &>= 0
    $

    $ "PDF Property 2" $
    $
      integral_0^1 c f(x) dif x 
      + 0 &= 1 \
      c integral_0^1 x^2 (1-x)^2 dif x  &= 1 \
      c integral_0^1 (x^4 - 2x^3 + x^2) dif x  &= 1 \
      c lr((1/5x^5 - 1/2x^4 + 1/3x^3)|)_0^1 &= 1 \
      c (1/5-1/2+1/3)  &= 1 \
      c/30 &= 1 \
      bold(c &= 30)
    $
  ]
]

#pagebreak()
#lines

#enum.item(4)[
  #enum.item(2)[
    Calculate $E(X)$.
    $
      E(X) &= integral_0^1 30x f(x) dif x \
      E(X) &= 30 integral_(0)^1 x^3 (1-x)^2 dif x \
      E(X) &= 30 integral_(0)^1 (x^5 - 2x^4 + x^3) dif x \
      E(X) &= 30 lr((1/6x^6 - 2/5x^5 + 1/4x^4)|)_0^1 \
      E(X) &= 30(1/6 - 2/5 + 1/4) \
      E(X) &= bold(1/2) \
    $
  ]

  #enum.item(3)[
    The distribution of $X$ can be used to model proportions.
    For example, we could assume that $X$ models the proportion of
    students on campus who are computer science majors.
    
    Under this assumption, calculate and interpret the exact value of
    $
      P(0.2 <= X <= 0.5).
    $
    $
      P(0.2 <= X <= 0.5) &= integral_0.2^0.5 30 f(t) dif t \
      P(0.2 <= X <= 0.5) &= 30 integral_0.2^0.5 x^2 (1-x)^2 dif t \
      P(0.2 <= X <= 0.5) &= 30 integral_0.2^0.5 (x^4 - 2x^3 + x^2) dif x \
      P(0.2 <= X <= 0.5) &= 30 lr((1/5x^5 - 1/2x^4 + 1/3x^3)|)_0.2^0.5 \
      P(0.2 <= X <= 0.5) &= 0.44208 \
    $

    *The value $0.44208$ is the probability that anywhere from $20%$ to $50%$ of the students on campus are computer science majors.*
  ]
]



#pagebreak()
#lines



#enum.item(5)[
  We toss a coin with $P(H) = p in (0,1)$ indefinitely and independently.
  You win $3^n$ dollars if, on a given run of the coin tosses,
  $H$ shows up for the first time on the $n^"th"$ toss.

  Let $X$ be the random variable that gives your winnings for one run of the game.

  #enum.item(1)[
    Calculate the probability mass function of $X$.
    $
      P_X (X = 3^n) &= bold(p(1-p)^(n-1))
    $
  ]

  #enum.item(2)[
    If you play this game repeatedly, what would your expected winnings, $E(X)$, be?
    Note that, depending on the value of $p$, $E(X)$ can be finite or infinite.

    $
      E(X) &= sum_(n=1)^infinity 3^n p (1-p)^(n-1) \
      E(X) &= p/(1 - p) sum_(n=1)^infinity 3^n (1-p)^n \
      E(X) &= p/(1 - p) sum_(n=1)^infinity (3-3p)^n \
      E(X) &= p/(1 - p) dot (3 - 3p)/(1 - (3-3p)) \
      E(X) &= bold((3p)/(3p - 2) "where" 2/3 < p < 1) \
    $
  ]

  #enum.item(3)[
    Suppose you could play this game indefinitely.
    What is the most you would be willing to pay to play this game
    so that your expected net earnings are at least $5$ dollars?
    Your answer will depend on the value of $p$ (when $E(X)$ is finite).

    $
      "Fee" &= E(X) - 5 \
      "Fee" &= (3p)/(3p-2) - 5 \
      "Fee" &= (3p)/(3p-2) - (15p-10)/(3p-2) \
      "Fee" &= bold((10 - 12p)/(3p-2) "where" 2/3 < p < 5/6) \
    $
  ]
]