#import "@preview/ctheorems:1.1.3": *
#show: thmrules.with(qed-symbol: $square.filled$)

#set page(paper: "a4")
#set page(
  header: context {
      if counter(page).get().first() >= 1 [
        #set text(style: "italic")
        Physics 72 -- DQ 1
        #h(1fr)
        Edgar Gerard Soliva
        #block(line(length: 100%, stroke: 0.5pt), above: 0.6em)
      ]
    },
)
#set heading(numbering: "1.")
#set text(font: "New Computer Modern", size: 11.5pt)
#set par(justify: true)
#set enum(numbering: "(a)", indent: 10pt)

#show heading.where(level: 2): set block(below: 1em)

#let vspace = v(1em)
#let lline = align(center)[
  #v(0.8em)
  #line(length: 100%, stroke: 0.5pt + luma(150))
  #v(0.5em)
]

#let newton = text("N")

#let problem = thmbox(
  "problem",
  "Problem",
  fill: rgb("#e2f6ee"),
  stroke: (left: 2.5pt + rgb("#8eedc1")),
  inset: (x: 1.2em, y: 1em),
  base_level: 0,
)

#let exercise = thmbox(
  "exercise",
  "Exercise",
  fill: rgb("#d1eddc"),
  stroke: (left: 2.5pt + rgb("#1a365d")),
  inset: (x: 1.2em, y: 1em),
  base_level: 0,
)

#let solution = thmproof(
  "solution", 
  "Solution", 
  inset: (left: 0pt, right: 0pt)
)

#problem("Spears")[
  Three spheres $X, Y,$ and $Z$ of the same size have initial charges $+8$Q, $-13$Q, and $-13$Q, respectively. Spheres $X$ and $Z$ are conductors, and $Y$ is an insulator. First, spheres $X$ and $Z$ are brought in contact with each other and separated. Then, spheres $Y$ and $Z$ are brought in contact with each other and separated. What is the final charge of sphere $Z$?
]

#solution[
  Recall that when two conductors came in contact with each other, their charges after the contact will be equal to the sum of their charges divided by two. And in the case that a conductor and an insulator had contact, nothing will happen.
  #align(center)[
    #table(
    columns: 4,
    align: (center, center, center, center),
    [$X$], [$Y$], [$Z$], [State],
    [$+8$Q], [$-13$Q], [$-13$Q], [Initial],
    [$+5\/2$Q], [$-13$Q], [$+5\/2$Q], [$X$ and $Z$ had contact],
    [$+5\/2$Q], [$-13$Q], [$+5\/2$Q], [$Y$ and $Z$ had contact]
    )
  ]
  #align(center)[
    #box(stroke: 0.5pt, inset: 3pt)[$therefore Z$ has a final charge of $+5\/2$Q]
  ]
]

#problem("Pentatonix")[
  For the next two items, consider five identical charges with $Q = +1$ $mu$C distributed equidistantly on a circle with radius $R = 2$ cm as shown. Point $P$ is the center of the circle.
  #figure(
    image("assets/pentatonix.png",width: 40%)
  )
  + If a charge $q = -2$ $mu$C is placed at point $P$, what is the magnitude of the net electric force on $q$? 
  + What is the electric field at point $P$ due to the topmost $Q$ charge?
] <problem2>

#solution("(a)")[
  Notice that the charges placed in the vertices of the pentagon are positive charges, and the charge at the center is negative. Hence, there exists an *attractive* force between them.

  #figure(
    image("assets/pta-sol1.png", width: 40%),
  ) 
  In the illustration shown above, the #strong[#text("red arrows", fill: red)] represent the force exerted by each charge $Q$ to charge $q$. Let $theta$ be the angle between two adjacent vectors, and since $2 pi$ is the full rotation of a circle, just divide that by 5 to determine the angle from the initial point,
  $
    theta = (2 pi) / 5
  $
  The net force $arrow(F)_("net")$ at point $P$,
  $
    arrow(F)_("net") = q/(4 pi epsilon_0) sum_(i = 1)^5 (Q_i arrow(r_(i)))
  $
  Where $arrow(r_i)$ represents the force vector of each charge $Q_i$. Recall that $arrow(r)_i$ can be decomposed into their $x$ and $y$ components, where $x = r cos theta$ and $y = r sin theta$.
  
  Notice that the angle of the vectors can be represented as $(2 pi x)/5$ where $0 <= x <= 4$. Furthermore, from this we can calculate the following:
  $
    sum_(x = 0)^4 sin((2 pi x) / 5) = 0 \
    sum_(x = 0)^4 cos((2 pi x) / 5) = 0
  $
  Since the result is equal to 0, the vectors cancel out.

  #align(center)[
    #box(stroke: 0.5pt, inset: 5.5pt)[$therefore F_("net") = 0$ N]
  ]
]

#solution("(b)")[
  Let us just apply the formula for the electric field,
  $
    arrow(E) &= 1/(4 pi epsilon_0)(|Q|)/(r^2) = 1/(4 pi epsilon_0)(1 times 10^(-6) text("C"))/((0.02)^2 text("m"^2)) \
    &=#box(stroke: 0.5pt, inset: 4pt)[$2.247 times 10^7 text("N"\/"C")$]
  $
]

#problem("Movement")[
  A negative charge with initial velocity $V_0$ enters a region of uniform electric field and moves in the trajectory as shown in the figure. What is the direction of the field?
  #figure(
    image("assets/movement.png", width: 35%)
  )
]

#solution[
  Since the direction of a negative charge always moves opposite to the direction of an electric field, thus, we can deduce that the direction of the field #box(stroke: 0.5pt, inset: 4pt)[points upward to the $+ hat(j)$ direction].
]

#problem("Trio")[
  Three charges, $Q_1, Q_2$, and $Q_3$, are positioned in the $x y$-plane as shown. The charge of $Q_2$ is $-1$C and the charge of $Q_3$ is $+1$C. If the magnitude of the repulsive force between charges $Q_1$ and $Q_3$ is $9.0$ N, what is the electric force exerted by charge $Q_1$ on $Q_2$?
  #figure(
    image("assets/trio.png", width: 40%)
  )
]

#solution[
  Based on the given, $arrow(F)_("1 on 3") = 9.0 $ N. And since it describes it as _repulsive_, $Q_1$ must be of the *same charge* as $Q_3$ which is positive!
  $
    arrow(F)_("1 on 3") = k (|Q_1 Q_3|)/(r_(13))^2 \
    Q_1 = (arrow(F)_("1 on 3")(r_(13))^2)/(k Q_3) \
  $
  $
    arrow(F)_("1 on 2") &= k((arrow(F)_("1 on 3")(r_(13))^2)/(k Q_3))(Q_2)/((r_12)^2) \
    &= #box(stroke: 0.5pt, inset: 4pt)[($18$ N) $hat(j)$]
  $
]

#problem("Allan 2Ring")[
  Consider two uniformly charged rings, each with radius $R$, arranged as shown. The ring at $y = +l$ has charge $+Q$ while the ring at $y = -l$ has charge $-Q$. What is the net electric field at the origin?
  #figure(
    image("assets/allan-turing.png", width: 30%)
  )
]

#solution[
  Recall the electric field of a ring with uniform charge on a point,
  $
    arrow(E) = (k Q x)/(x^2 + a^2) hat(i)
  $
  where $x$ is the distance between the point and a ring, and $a$ is the radius of the ring. Let $arrow(E)_1$ be the electric field produced by the upper ring and $arrow(E)_2$ be the electric field produced by the lower ring. 
  
  Since the upper ring has a positive charge its electric field vector points downwards, while the lower ring with a negative charge has a vector that points toward it. Substituting these into the equation, the net electric field $arrow(E)_("net")$,
  $
    arrow(E)_("net") &= arrow(E)_1 + arrow(E)_2 \
    &= (k Q l)/(l^2 + R^2) (- hat(i)) + (k Q l)/(l^2 + R^2)(- hat(i)) \
    &= #box(stroke: 0.5pt, inset: 4pt)[$ -(2k Q l)/(l^2 + R^2) hat(i) $]
  $
]
