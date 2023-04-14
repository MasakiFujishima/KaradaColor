

get_KG_color <- function(n = 5, name = "Sapporo_Sta", alpha = 1){

  pal_col <- df_KG_palettes[[name]]
  KG_cols <- grDevices::colorRamp(pal_col, space = "Lab", interpolate = "spline")
  cols <- KG_cols(seq(0, 1, length.out = n)) / 255
  return(grDevices::rgb(cols[, 1], cols[, 2], cols[, 3], alpha = alpha))
  
  }

get_KG_palette <- function(name = "Sapporo_Sta", alpha = 1){
  
  function(n) {
    
    return(get_KG_color(n, name, alpha))
    
    }
}

scale_color_KG <- function(name = "Sapporo_Sta", 
                           alpha = 1, na.value = "red") {
    
    ggplot2::discrete_scale(aesthetics = "color",
                            scale_name = name,
                            palette = get_KG_palette(name, alpha),
                            na.value = "red")
  
 }

scale_colour_KG <- scale_color_KG

scale_fill_KG <- function(name = "Sapporo_Sta", alpha = 1, na.value = "red") {
  
  ggplot2::discrete_scale(aesthetics = "fill",
                          scale_name = name,
                          palette = get_KG_palette(name, alpha),
                          na.value = na.value)
  
}

#Exsample
if(!require("tidyverse", quietly = TRUE)){
  install.packages("tidyverse");require("tidyverse")
}
ggplot(data = diamonds, aes(x = carat, y = price,
                            color = clarity,
                            fill = clarity)) +
  geom_point() +
  scale_color_KG(name = "Hanamushiro", alpha = 0.2) +
  scale_fill_KG(name = "Hokkaido_Sky", alpha = 0.8) +
  theme_dark()

#Exsample
if(!require("scales", quietly = TRUE)){
  install.packages("scales");require("scales")
}
show_col(get_KG_color(n = 20, name = "Totan", alpha = 0.5))

#Exsample
if(!require("aRtsy", quietly = TRUE)){
  install.packages("aRtsy");require("aRtsy")
}
canvas_strokes(colors = get_KG_color(name = "Utonaiko"),
               neighbors = 1, p = 0.02, iterations = 1, resolution = 350)
