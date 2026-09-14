/*
* Package imports
*/
#import "@preview/hydra:0.6.2": hydra
#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3"
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge, shapes
#import "@preview/itemize:0.2.0" as el
#import "@preview/delimitizer:0.1.0": big, bigg, Big, Bigg, scaled-delimiter, paired-delimiter
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#import "@preview/lovelace:0.3.1": *
#import "@preview/theorion:0.6.0": *
#import cosmos.fancy: *
#import "@preview/tdtr:0.6.1": *




/*
* Organization functions
*/

//Emphasis box continuation
#let continue_box = align(center, [_Continued on next page_])
//Derivation box using Theorion
#let (derivation-counter, derivation-box, derivation, show-derivation) = make-frame(
  "derivation",
  "Derivation",
  counter: theorem-counter,
  inherited-levels: 2, 
  inherited-from: heading,  
  render: fancy-box.with(
    get-border-color: get-tertiary-border-color,
    get-body-color: get-tertiary-body-color,
    get-symbol: get-tertiary-symbol,
  ),
)
//Derivation box using Theorion
#let (algorithm-counter, algorithm-box, algorithm, show-algorithm) = make-frame(
  "algorithm",
  "Algorithm",
  counter: theorem-counter,
  inherited-levels: 2, 
  inherited-from: heading,  
  render: fancy-box.with(
    get-border-color: get-tertiary-border-color,
    get-body-color: get-tertiary-body-color,
    get-symbol: get-tertiary-symbol,
  ),
)
//Me
#let author = "Miagao"



/*
* Math functions
*/

//Leibniz derivative
#let dv(derivative_of, respect_to, ..args) = {
  let order = none
  if args.pos().len() > 0 {
    order = args.pos().first()
  }

  if order == 1 {
    order = none
  }
  $(dif^#order #derivative_of)/(dif #respect_to^order)$
}
//Leibniz partial derivative
#let pdv(derivative_of, ..respect_to) = {
  let vars = respect_to.pos()
  let order = none
  if vars.len() > 1 {
    order = vars.len()
  }
  $(partial^#order #derivative_of)/(partial #vars.join(partial))$
}
//Integral evaluation bar
#let eval(lower_bound, upper_bound) = $bigg(|)_#lower_bound^#upper_bound$
//Magnitude bars
#let mag(var) = $lr(||#var||)$
//Boldface emphasis
#let bf(var) = $upright(bold(#var))$
//Matrix transpose
#let transpose = $upright(sans(T))$
//Adjugate of a matrix
#let adj = $op("adj")$
//Null space of a matrix
#let nul = $op("Nul")$
//Column space of a matrix
#let col = $op("Col")$
//Row space of a matrix
#let row = $op("Row")$
//Kernel of a transformation
#let ker = $op("ker")$
//Dimension of a vector space
#let dim = $op("dim")$
//Rank of a matrix
#let rank = $op("rank")$
//Nullity of a matrix
#let nullity = $op("nullity")$
//Roundhand font style
#let scr(it) = text(
  stylistic-set: 1,
  $cal(it)$,
)
//Real part
#let re = $op("Re")$
//Imaginary part
#let im = $op("Im")$
//Distance between vectors
#let dist = $op("dist")$
//Projection onto vector
#let proj = $op("proj")$



/*
* Styling
*/
#let template(
  doc_title: "",
  doc_subtitle: "",
  show_title: false,
  show_contents: true,
  show_header: false,
  doc_font: "Libertinus Serif",
  math_font: "New Computer Modern Math",
  numbering_depth: 0,
  page_style: "a4",
  body
) = [
  //Page
  #set page(page_style, numbering: "1 of 1", header: context {
    if show_header {
      emph(hydra(1))
      h(1fr)
      emph(hydra(2))
      
      
      if here().page() != 1 {line(length: 100%, stroke: (thickness: 2pt, dash: "dotted"))}
    }
  })

  
  //Text
  #set text(font: doc_font, size: 12pt)
  #show math.equation: set text(font: math_font)
  #show sym.nothing: set text(font: "XITS Math")


  //Headings
  #show heading.where(level: 1): set text(size: 24pt)
  #show heading.where(level: 1): it => pagebreak(weak: true) + it
  #show heading.where(level: 2): set text(size: 22pt)
  #show heading.where(level: 3): set text(size: 20pt)
  #show heading.where(level: 4): set text(size: 18pt)
  #show heading.where(level: 4): set text(size: 16pt)
  #show heading.where(level: 4): set text(size: 14pt)

  #let custom_numbering = (..numbers) => { 
    if numbers.pos().len() <= numbering_depth {
      numbering("1.1", ..numbers)
    }
  }
  #set heading(numbering: custom_numbering)


  //Lists
  #set enum(numbering: "1.a)")
  #show: el.default-enum-list


  //Other
  #show: codly-init.with()
  #show: show-theorion
  #show: show-derivation
  #show: show-algorithm
  #codly(
    languages: codly-languages + (
      c: (
        name: "C",
        icon: box(
          image("images/c.svg", height: 0.9em),
          baseline: 0.05em,
          inset: 0pt,
          outset: 0pt,
        ) + h(0.3em), 
        color: rgb("#4c2bce")),
    )
  )


  //Title page
  #show title: set text(size: 30pt)
  #set outline.entry(fill: line(length: 100%, stroke: black.lighten(70%)))
  #if show_title [
    #align(center)[
      #title(doc_title)
      #if doc_subtitle != "" {
        text(size: 20pt, doc_subtitle)
        linebreak()
      }
      
      #text(size: 16pt, author)
    ]
    #figure(image("images/YOTSUBA!!!.webp"), supplement: none, caption: [Yotsuba from Yotsuba&!])
    #if show_contents [#outline(indent: 2em)]
  ]


  #body
]