#import "@preview/droplet:0.3.1": dropcap
#let conf(
  doc,
  title_text: "this is a title",
  name: "bob the tomato",
  prof: "Dr. Doofenshmirtz",
  class: "AB 123",
  date: datetime(year: 1967, month: 4, day: 1),
  workscited: none,
  abstract: lorem(40),
) = {
  show title: it => {
    set text(30pt)
    set align(left)
    set par(leading: 0.5em)
    set block(above: 0.7em)
    it
  }

  show heading.where(level: 1): set text(20pt)
  show heading.where(level: 1): set block(below: 1em)
  set document(title: title_text, author: str(name))
  set text(size: 11pt, font: "Drafting* Mono", weight: 400) //Drafting Mono from indestructible type!!
  set document(title: title_text, author: str(name))
  set par(
    leading: 1em,
    justify: true,
  )
  let page_num = counter(page)
  let day = date.display(
    "[month repr:long] [day padding:none], [year repr:full]",
  )

  page(
    paper: "us-letter",
    align(
      left + horizon,
      box(width: 77%, {
        title()
        text(name, size: 18pt)
        v(1em)
        smallcaps(prof + h(1em) + text(baseline: 0.15em, "*") + h(1em) + class)

        linebreak()
        day
        v(1em)
        text(weight: 300, abstract)
        v(3em)
      }),
    ),
  )

  page_num.update(1)

  set page(
    paper: "us-letter",
    header: context align(
      center + bottom,
      text(weight: 300, page_num.display() + h(1fr) + smallcaps(name)),
    ),
  )
  set par(
    spacing: 3em,
  )
  dropcap(height: 2, justify: true, gap: -1.3em, overhang: 0.3em, doc)
  align(center + horizon)[\* \* \*]
  if workscited != none {
    page({
      heading(level: 1)[Works Cited]
      workscited
    })
  }
}
