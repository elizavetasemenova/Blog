## visualize in browser
#library(DiagrammeR)
#grViz("diag.dot")

## save as PDF
library(DiagrammeR)
library(DiagrammeRsvg)
library(magrittr)
library(rsvg)

grViz(diagram = "diag.dot") %>%
  export_svg %>% charToRaw %>% rsvg_pdf("graph.pdf")
