# -------------------------------------------------------------------------
# analises inext
# mauricio vancine - mauricio.vancine@gmail.com
# 24-06-2019
# -------------------------------------------------------------------------

# preparate r -------------------------------------------------------------
# memory
rm(list = ls())

# packages
library(iNEXT)
library(tidyverse)

# data --------------------------------------------------------------------
# data
data(spider) # abundance data
spider

data(bird) # abundance data
bird

data(ant) # incidence data
ant

data(ciliates) # incidence data
ciliates

# analysis - abundance data -----------------------------------------------
# rarefaction/extrapolation for spider data (abundance data)
# data
spider
str(spider)
lapply(spider, sum)

# estimates
spider_out <- iNEXT::iNEXT(x = spider, q = c(0, 1, 2), datatype = "abundance", endpoint = 500) 
spider_out

# sample-size-based R/E curves, separating plots by "site"
iNEXT::ggiNEXT(spider_out, type = 1, facet.var = "site") +
  theme_bw()  

# sample-size-based R/E curves, separating plots by "order"
iNEXT::ggiNEXT(spider_out, type = 1, facet.var = "order") +
  theme_bw()

# completeness curve
iNEXT::ggiNEXT(spider_out, type = 2) +
  theme_bw()

# coverage-based R/E sampling curves
iNEXT::ggiNEXT(spider_out, type = 3, facet.var = "site")
iNEXT::ggiNEXT(spider_out, type = 3, facet.var = "order")

# Separating plots by "order",anddisplay black-white plots
iNEXT::ggiNEXT(spider_out, type = 1, facet.var = "order", grey = TRUE)

# analysis - abundance data -----------------------------------------------
# rarefaction/extrapolation for spider data (abundance data)
# data
bird
lapply(bird, sum)

# estimates
bird_out <- iNEXT::iNEXT(x = bird, q = c(0, 1, 2), datatype = "abundance", endpoint = 500) 
bird_out

# sample-size-based R/E curves, separating plots by "site"
iNEXT::ggiNEXT(bird_out, type = 1, facet.var = "site")

# sample-size-based R/E curves, separating plots by "order"
iNEXT::ggiNEXT(bird_out, type = 1, facet.var = "order")

# completeness curve
iNEXT::ggiNEXT(bird_out, type = 2)

# coverage-based R/E sampling curves
iNEXT::ggiNEXT(bird_out, type = 3, facet.var = "site")
iNEXT::ggiNEXT(bird_out, type = 3, facet.var = "order")

# Separating plots by "order",anddisplay black-white plots
iNEXT::ggiNEXT(bird_out, type = 1, facet.var = "order", grey = TRUE)

# analysis - incidence data -----------------------------------------------
# rarefaction/extrapolation via examples (incidence data)
# data
ant
str(ant)
lapply(ant, sum)

# estimates
t <-seq(1, 700, by = 10)
t

out_ant <-iNEXT(ant, q = 0, datatype = "incidence_freq", size = t)
out_ant

# sample-size-based R/E curveswithout figure legend
iNEXT::ggiNEXT(out_ant, type = 1) +
  theme_bw(base_size = 18) +
  theme(legend.position = "none")

# sample-size-based R/E curves, separating plots by "order"
iNEXT::ggiNEXT(bird_out, type = 1, facet.var = "order")

# completeness curve
iNEXT::ggiNEXT(bird_out, type = 2)

# coverage-based R/E sampling curves
iNEXT::ggiNEXT(bird_out, type = 3, facet.var = "site")
iNEXT::ggiNEXT(bird_out, type = 3, facet.var = "order")

# Separating plots by "order",anddisplay black-white plots
iNEXT::ggiNEXT(bird_out, type = 1, facet.var = "order", grey = TRUE)
