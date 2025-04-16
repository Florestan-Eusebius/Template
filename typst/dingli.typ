#let c_thm = counter("theorem")
#let c_lem = counter("lemma")
#let c_cor = counter("corollary")
#let c_def = counter("definition")
#let c_list = (c_thm, c_lem, c_cor, c_def)

#let thmrules(doc) = {
show heading.where(level: 1): it => {
  for c in c_list {
    c.update(0)
  }
  it
}
doc
}

#let parvirtual = {
"" 
context v(-par.spacing -  measure("").height)
}

#let theorem(body, name: none, type: "Theorem", count: c_thm, indent: none) = {
  // #set par(first-line-indent: 1.5em)
  v(2em, weak: true)
  count.step()
  block[
  #if indent != none {
  parvirtual
  }
  #if name == none {[
    *#type #context counter(heading).get().at(0).#context count.display().*
  ]} else {[
    *#type #context counter(heading).get().at(0).#context count.display()* (#name)*.*
  ]}
  #body]
  parvirtual
  v(2em, weak: true)
}

#let lemma = theorem.with(type: "Lemma", count: c_lem)
#let corollary = theorem.with(type: "Corollary", count: c_cor)
#let definition = theorem.with(type: "Definition", count: c_def)


#let proof(body, type: "Proof", count: c_thm, indent: none) = {
  v(2em, weak: true)
  block[
  #if indent != none {
  parvirtual
  }
  _#type._
  #body 
  #box(width: 0pt)
  #h(1fr)
  #sym.wj
  #sym.space.nobreak
    $qed$
  ]
  parvirtual
  v(2em, weak: true)
}


#let dingli = theorem.with(type: "定理", count: c_thm, indent: true)
#let yinli = dingli.with(type: "引理", count: c_lem)
#let tuilun = dingli.with(type: "推论", count: c_cor)
#let dingyi = dingli.with(type: "定义", count: c_def)


#let zhengming = proof.with(type: "证明", indent: true)

