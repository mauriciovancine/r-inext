library(iNEXT)

data(spider)
str(spider)

m <-c(1, 5, 20, 50, 100, 200, 400)
out <- iNEXT::iNEXT(spider, q=0, datatype="abundance", size=m)

iNEXT::ggiNEXT(out, type = 1, grey = TRUE, facet.var="site") + 
  scale_shape_manual(values = rep(20, regis_sp_data %>% length)) + 
  geom_text(data = fortify(out, type = 1) %>% dplyr::filter(method == "observed"), nudge_x = 10, nudge_y = -2, size = 5,
            aes(x = x, y = y, label = paste0("(", x, ",", y, ")"), color = NULL, group = NULL), ) +
  geom_text(data = fortify(out, type = 1) %>% dplyr::filter(x == 400),  nudge_x = -10, nudge_y = 1, size = 5,
            aes(x = x, y = y, label = round(y, 2), color = NULL, group = NULL)) +
  theme_bw() +
  theme(legend.position = "bottom")