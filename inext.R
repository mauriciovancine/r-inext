library(iNEXT)
library(tidyverse)

data(spider)
str(spider)

m <-c(1, 5, 20, 50, 100, 200, 400)
out <- iNEXT::iNEXT(spider, q=0, datatype="abundance", size=m)

iNEXT::ggiNEXT(out, type = 1, grey = TRUE, facet.var="site") + 
  scale_shape_manual(values = rep(20, out %>% length)) + 
  geom_text(data = fortify(out, type = 1) %>% dplyr::filter(method == "observed"), nudge_x = 10, nudge_y = -2, size = 7,
            aes(x = x, y = y, label = paste0("(", x, ",", y, ")"), color = NULL, group = NULL), ) +
  geom_text(data = fortify(out, type = 1) %>% dplyr::filter(x == 400),  nudge_x = -10, nudge_y = 1, size = 7,
            aes(x = x, y = y, label = round(y, 2), color = NULL, group = NULL)) +
  theme_bw() +
  theme(legend.position = "bottom")


## example for abundance based data (data.frame)
data(bird)
out2 <- iNEXT(bird, q=0, datatype="abundance", size = seq(0, 600, 5))
ggiNEXT(out2)

iNEXT::ggiNEXT(out2, type = 1, grey = FALSE) +
  geom_text(data = fortify(out2, type = 1) %>% 
              dplyr::filter(method == "observed"), 
            nudge_x = 0, 
            nudge_y = -2, 
            size = 7,
            aes(x = x, y = y, label = paste0("(", x, ",", y, ")"), color = NULL, group = NULL), ) +
  geom_text(data = fortify(out2, type = 1) %>% 
              dplyr::filter(x == 600),  
            nudge_x = -5, 
            nudge_y = 1, 
            size = 7,
            aes(x = x, y = y, label = round(y, 2), color = NULL, group = NULL)) +
  theme_bw() +
  theme(legend.position = "bottom",
        legend.title = element_text(size = 17),
        legend.text = element_text(size = 12),
        axis.title = element_text(size = 20),
        axis.text = element_text(size = 15))
ggsave("rarefaction.png", wi = 25, he = 20, un = "cm", dpi = 300)

data(spider)
# single-assemblage abundance data
out1 <- iNEXT(spider$Girdled, q=0, datatype="abundance")
ggiNEXT(x=out1, type=1)
ggiNEXT(x=out1, type=2)
ggiNEXT(x=out1, type=3)

## Not run: 
# single-assemblage incidence data with three orders q
data(ant)
size <- round(seq(10, 500, length.out=20))
y <- iNEXT(ant$h500m, q=c(0,1,2), datatype="incidence_freq", size=size, se=FALSE)
ggiNEXT(y, se=FALSE, color.var="order")

# multiple-assemblage abundance data with three orders q
z <- iNEXT(spider, q=c(0,1,2), datatype="abundance")
ggiNEXT(z, facet.var="site", color.var="order")
ggiNEXT(z, facet.var="both", color.var="both")
        

## example for abundance based data (list of vector)
data(spider)
out1 <- iNEXT(spider, q=0, datatype="abundance")
out1$DataInfo # showing basic data information.
out1$AsyEst # showing asymptotic diversity estimates.
out1$iNextEst # showing diversity estimates with rarefied and extrapolated.

## example for abundance based data (data.frame)
data(bird)
out2 <- iNEXT(bird, q=0, datatype="abundance")
ggiNEXT(out2)

## example for incidence frequencies based data (list of data.frame)
data(ant)
t <- round(seq(10, 500, length.out=20))
out3 <- iNEXT(ant$h500m, q=1, datatype="incidence_freq", size=t, se=FALSE)
out3$iNextEst
        
        
        
      

        