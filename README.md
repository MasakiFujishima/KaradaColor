# KaradaColor

<!-- badges: start -->

<!-- badges: end -->

Color palette of "[KARADA-GOOD](https://www.karada-good.net/)". The color palette consists of five colors selected from photographs of Japanese landscapes and foods. Color palette will be added sequentially.

Color palettes to be added are introduced on [Instagrame](https://www.instagram.com/karadagood/) from time to time.


## Installation

You can install the development version of KaradaColor from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("KaradaGood/KaradaColor")
```

## Example

``` r
library(KaradaColor)
#Display all palettes in console
show_KG_palette()
```

<img src="man/figures/Show_KG_Palette.png" width="50%"/>

``` r
#Plot the palette
plot_KG_palette("Kyoto_City", n = 10, colplot = TRUE)
```

<img src="man/figures/Plot_KG_Palette.png" width="50%"/>

``` r
#Exsample
if(!require("tidyverse", quietly = TRUE)){
  install.packages("tidyverse");require("tidyverse")
}
set.seed(1)
x <- LETTERS[1:20]
y <- paste0("var", seq(1,20))
data <- expand.grid(X=x, Y=y)
data$Z <- sample(c(NA, rnorm(15)), 20, replace = TRUE)
library("tidyverse")
ggplot(data, aes(X, Y, fill= Z)) +
  geom_tile() +
  scale_fill_KG(discrete = FALSE, name = "Hanamushiro",
                alpha = 1, na.value = "red")
```

<img src="man/figures/ex_plot.png" width="50%"/>


