# KaradaColor

<!-- badges: start -->

<!-- badges: end -->

Color palette of "[からだにいいもの](https://www.karada-good.net/)". Each color palette is composed of five colors selected from photographs of Japanese landscapes and foods.

## Installation

You can install the development version of KaradaColor from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("KaradaGood/KaradaColor")
```

## Example

``` r
library(KaradaColor)

Plot_KG_Palette("Kyoto_City", n = 5, colplot = TRUE)

Show_KG_Palette()

library("ggplot2")
ggplot(data = data.frame(x = 1:5, y = 1:5),
       aes(x, y)) +
  geom_point(col = Plot_KG_Palette("Sapporo_Sta", n = 5,
                                   colplot = FALSE),
             size = 10)
```
