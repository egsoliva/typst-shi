#import "@preview/ctheorems:1.1.3": *
#show: thmrules.with(qed-symbol: $square.filled$)

#set page(paper: "a4")
#set page(
  header: context {
      if counter(page).get().first() >= 1 [
        #set text(style: "italic")
        Physics 72 -- DQ 2
        #h(1fr)
        Edgar Gerard Soliva
        #block(line(length: 100%, stroke: 0.5pt), above: 0.6em)
      ]
    },
)
#show footnote: set text(rgb("204E8A"))
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

#problem("SEE-the-LINE-DER")[
  Consider the infinite cylindrical distribution below, given with the following charge density:
  $
    rho(r) = cases(
      rho"," & "" & r <= a,
      ,
      display((alpha)/r^2)"," & "   " & a < r <= b
    )
  $
  With $rho$ as a uniform charge density. Calculate the electric field magnitude at the following regions:
  + $r < a$
  + $r = a$
  + $a < r < b$
  + $r = b$
  + $r > b$
  #figure(
    image("assets/dq2-1.png", width: 30%)
  )
]

#solution[
  The magnitude of an electric field $arrow(E)$ can be derived using Gauss's Law,
  $
    Phi_E = integral.cont_("GS") arrow(E) dot.c d arrow(A) = Q_("enc")/epsilon_0 \
    E(2 pi r L) = Q_("enc")/epsilon_0 \
    E = Q_("enc")/(2 pi epsilon_0 r L)
  $
  (a) At $r < a$, since the piecewise function states that there exists a uniform volume charge density,#footnote[Then we could let $rho = Q\/V$ since the charge is uniformly distributed throughout the surface.] then, this implies that there exists a charge within that region. 
  $
    Q_("enc") &= rho V_("enc") \
    &= rho(pi r^2 L)
  $
  Substituting this into the formula above,
  $
    E &= (rho pi r^2 L)/(2 pi epsilon_0 r L) = #box(stroke: 0.5pt, inset: 8pt)[$display((rho r)/(2 epsilon_0))$]
  $
  (b) The magnitude of the electric field when $r = a$ is equal to the expression when $r < a$, but we let $r = a$,
  $
    E = #box(stroke: 0.5pt, inset: 8pt)[$display((rho a)/(2 epsilon_0))$]
  $
  (c) Let us first determine how to obtain the enclosed charge if $a < r <b$. Since it is bounded by the radii $a$ and $b$, we need to consider the charge when $r' <= a$ (inner region) and $a < r' < b$ (outer region) where $r'$ is our observation point as $r' -> r$. Recall that,
  $
    rho = (d Q)/(d V) => d Q = rho thin d V \
    Q = integral d Q = integral rho thin d V
  $
  In an infinite cylinder, we know that $d V = 2 pi r L thin d r$. Then,
  $
    Q_("enc") &= Q_(r' <= a) + Q_(a < r' < b) \
    &= integral_0^a rho(r') thin d V + integral_a^r rho(r') thin d V \
    &= integral_0^a rho(2 pi r' L) thin d r' + integral_a^r alpha/(r')^2 (2 pi r' L) thin d r' \
    &= rho pi L a^2 + 2  alpha pi L thin ln(r/a)
  $
  Substituting this,
  $
    E = #box(stroke: 0.5pt, inset: 8pt)[$display((rho pi L a^2 + 2  alpha pi L thin ln(r/a))/(2 pi epsilon_0 r L))$]
  $
  (d) When $r = b$, we simply let $r = b$ into the equation from (b), thus,
  $
    E = #box(stroke: 0.5pt, inset: 8pt)[$display((rho pi L a^2 + 2  alpha pi L thin ln(b/a))/(2 pi epsilon_0 b L))$]
  $
  (e) This is simply the same as the equation we have solved from (c),
  $
    E = #box(stroke: 0.5pt, inset: 8pt)[$display((rho pi L a^2 + 2  alpha pi L thin ln(r/a))/(2 pi epsilon_0 r L))$]
  $
]

#problem("Face your Spheres")[
  A solid conducting sphere with radius $R$ carries a total charge $+Q$. The sphere is surrounded by an insulating shell with inner radius $R$ and outer radius $2R$. The insulating shell has a non-uniform charge density $rho(r) = alpha r^2$, as given in the figure

  B. Calculate the electric field magnitude at the following regions:
  + $r < R$
  + $r = R$
  + $R < r < 2R$
  + $r = 2R$
  + $r > 2R$

  C. If the volume charge density is instead given by 
  $
    rho(r) = cases(
      +Q"," &  " " & r <= R,
      rho"," & " " & R < r <= 2R
    )
  $
  Where $rho$ is a uniform volume charge density, calculate the explicit expression of $rho$ so that the net charge of the entire system is zero.
  #figure(
    image("assets/dq2-2.png", width: 40%)
  )
]

#solution[
  The magnitude of an electric field $arrow(E)$ can be derived using Gauss's Law,
  $
    Phi_E = integral.cont_("GS") arrow(E) dot.c d arrow(A) = Q_("enc")/epsilon_0 \
    E(4 pi r^2) = Q_("enc")/epsilon_0 \
    E = Q_("enc")/(4 pi epsilon_0 r^2)
  $

  (a) Recall that in a conductor the electric field inside it is 0, hence, when $r < R$,
  $
    E = #box(stroke: 0.5pt, inset: 3pt)[$0$]
  $
  (b) When $r = R$, we could imagine that we have two spheres that are drawn twice such that we could no longer distinguish if there are two spheres. Let us consider their charges as $Q_("enc")$ which is simply the sum of the charge $Q_("sphere")$, contributed by the conductor and the charge $Q_("shell")$ that is contributed by the insulator.
  $
    Q_("enc") = Q_("sphere") + Q_("shell")
  $
  Clearly $Q_("sphere") = +Q$. Let us figure out $Q_("shell")$ using the given charge density $rho(r)$,
  $
    rho = (d Q)/(d V) => d Q = rho thin d V \
    Q = integral d Q = integral rho(r) thin d V
  $
  Recall that for a sphere, $d V = 4 pi r^2 thin d r$, let us denote $r'$ as our observation point as $r' -> r$,
  $
    Q_("shell") &= integral_R^(r = R) rho(r') thin d V = integral_R^(r = R) alpha r'^2(4 pi r'^2) thin d r' \
    &= integral_R^(r = R) 4 alpha pi r'^4 thin d r' = 0
  $
  Thus, the conductor is the only one that contributes charge,
  $
    E = #box(stroke: 0.5pt, inset: 8pt)[$display(Q/(4 pi epsilon_0 R^2))$]
  $
  (c) When $R < r < 2R$, we could use the same concept from (b). Since we have already created an expression for $Q_("shell")$, let us use that but we will solve it from $R$ to $r$,
  $
    Q_("shell") = integral_R^(r) 4 alpha pi r'^4 thin d r' = 4 pi alpha (r^5/5 - R^5/5) \
    Q_("enc") = Q_("sphere") + Q_("shell") \
    therefore Q_("enc") = Q + 4 pi alpha (r^5/5 - R^5/5)
  $
  Substituting this into the magnitude of an electric field equation simply gives us,
  $
    E = (Q + 4 pi alpha ((r^5 - R^5)/5)) / (4 pi epsilon_0 r^2) = #box(stroke: 0.5pt, inset: 8pt)[$display(Q/(4 pi epsilon_0 r^2) + alpha(r^5 - R^5)/(5 epsilon_0 r^2))$]
  $
  (d) Let $r = 2R$ in the equation from earlier,
  $
    Q_("enc") = Q + 4pi alpha (31 R^5)/5 \
    E = #box(stroke: 0.5pt, inset: 8pt)[$display((Q + (124 pi alpha R^5)/5)/(16 pi epsilon_0 R^2))$]
  $
  (e) We just need to modify the equation from (d),
  $
    E = #box(stroke: 0.5pt, inset: 8pt)[$display((Q + (124 pi alpha R^5)/5)/(4 pi epsilon_0 r^2))$]
  $
  For the last problem, we need to find an expression of $rho$ such that the net charge $Q_("net") = 0$. This implies that,
  $
    Q_("net") = Q_("sphere") + Q_("shell") = 0 \
    Q_("shell") = -Q_("sphere")
  $
  From the piecewise function, $Q_("shell") = +Q$, then we only need to figure out the charge of the shell $Q_("shell")$. When $R < r <= 2R$, there exists a uniform volume charge density $rho$, then,
  $
    rho = Q_("shell")/V_("shell") => Q_("shell") = rho V_("shell")
  $
  $
    Q_("shell") &= rho (4 pi)/3 [(2R)^3 - R^3] = (rho 28 pi R^3)/3 \
    &= -(Q_("sphere")) = -Q \
    therefore rho &= #box(stroke: 0.5pt, inset: 8pt)[$display(-(3Q)/(28pi R^3))$]
  $
]

#problem("Nah, I'd Work")[
  Consider three electrons (each with charge $-|e|$) placed on the three corners of a square as shown. A proton ($+|e|$) is then brought from infinity to the origin.
  #figure(
    image("assets/dq2-3.png", width: 40%)
  )
  + How much work must be done by an external force to bring the proton from infinity to the origin?
  + What is the potential at the center of the square formed by these four charges?
]

#solution("(a)")[
  Recall that the formula for bringing a charge from infinity,
  $
    W_("ext") &= -W_(a -> b) = U_b - U_a \
    &= U_b = k q_0 sum_(i = 0)^n q_i/r_i
  $
  Let $r_3$ be this distance from the upper right corner to the origin,
  $
    r_3 = sqrt(a^2 + a^2) = sqrt(2)a
  $
  $
    W_("ext") &= k|e|((-|e|)/a + (-|e|)/a + (-|e|)/(sqrt(2)a)) \
    &= (|e|)/(4 pi epsilon_0) dot.c (-|e|(sqrt(2) + sqrt(2) + 1))/(sqrt(2)a) \
    &= #box(stroke: 0.5pt, inset: 8.8pt)[$display((-|e|^2(2 sqrt(2) + 1))/(4 sqrt(2) pi a epsilon_0))$]
  $
]

#solution("(b)")[
  Recall the formula for potential due to a collection of point charges,
  $
    V &= k sum_(i = 1)^n q_i/r_i = k(3 dot.c (-|e|)/(sqrt(2)a) + (|e|)/(sqrt(2)a)) \
    &= 1/(4 pi epsilon_0) ((-2|e|)/(sqrt(2)a)) = #box(stroke: 0.5pt, inset: 8.8pt)[$display(-(|e|)/(2 sqrt(2) a pi epsilon_0))$]
  $
]