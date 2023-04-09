# KaradaColor

<!-- badges: start -->

<!-- badges: end -->

Color palette of "[からだにいいもの](https://www.karada-good.net/)". The color palette consists of five colors selected from photographs of Japanese landscapes and foods. Color palette will be added sequentially.



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
Show_KG_Palette()
```

<img src="man/figures/Show_KG_Palette.png" width="50%"/>

``` r
#Plot the palette
Plot_KG_Palette("Kyoto_City", n = 5, colplot = TRUE)
```

<img src="man/figures/Plot_KG_Palette.png" width="50%"/>

``` r
#Exsample
library("ggplot2")
ggplot(data = data.frame(x = 1:5, y = 1:5),
       aes(x, y)) +
  geom_point(col = Plot_KG_Palette("Sapporo_Sta", n = 5,
                                   colplot = FALSE),
             size = 10)
```

<img src="man/figures/ex_plot.png" width="50%"/>
