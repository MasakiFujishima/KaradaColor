#' Get color palette data set for the KaradaColor Package
#'
#' \code{get_KG_color} Get color palette data set for the KaradaColor Package
#' @importFrom grDevices colorRamp rgb
#' @param n Number of colors to create.
#' @param name color palette name. (default: \code{"Sapporo_Sta"})
#' @param alpha	The alpha transparency. Numbers range from 0-1. see argument alpha in \code{\link[grDevices]{rgb}}.
#' @return Vector containing a hex color code representation for the chosen palette.
#' @author KARADA-GOOD \email{info@karada-good.net}, \href{https://github.com/KaradaGood/KaradaColor}{Github}, \href{https://www.karada-good.net/analyticsr/r-770/}{Personal Blog}
#' @export get_KG_color
#' @examples
#' library("scales")
#' show_col(get_KG_color(n = 20, name = "Totan", alpha = 0.5))
#'
#' library("aRtsy")
#' set.seed(1234)
#' canvas_strokes(colors = get_KG_color(name = "Otaru_Unga"),
#'                neighbors = 1, p = 0.02, iterations = 1,
#'                resolution = 350)
get_KG_color <- function(n = 5, name = "Sapporo_Sta", alpha = 1){

  pal_col <- df_KG_palettes[[name]]
  KG_cols <- grDevices::colorRamp(pal_col, space = "Lab", interpolate = "spline")
  cols <- KG_cols(seq(0, 1, length.out = n)) / 255
  return(grDevices::rgb(cols[, 1], cols[, 2], cols[, 3], alpha = alpha))

  }

#' @rdname get_KG_color
#' @importFrom grDevices colorRamp rgb
#' @export
get_KG_palette <- function(name = "Sapporo_Sta", alpha = 1){

  function(n) {

    return(get_KG_color(n, name, alpha))

    }
}

#' Use KaradaColor scales on ggplot2
#'
#' {scale_color_KG} Use KaradaColor scales on ggplot2
#' @importFrom ggplot2 discrete_scale scale_fill_gradientn
#' @param name color palette name. (default: \code{"Sapporo_Sta"})
#' @param alpha	The alpha transparency. Numbers range from 0-1. see argument alpha in \code{\link[grDevices]{rgb}}.
#' @param na.value Color of missing value.
#' @param discrete Generate a discrete palette. (\code{FALSE} - generate continuous palette)
#' @return Create a user defined color palette for ggplot2.
#' @author KARADA-GOOD \email{info@karada-good.net}, \href{https://github.com/KaradaGood/KaradaColor}{Github}, \href{https://www.karada-good.net/analyticsr/r-770/}{Personal Blog}
#' @export scale_color_KG
#' @examples
#' library("ggplot2")
#' ggplot(data = diamonds, aes(x = cut, y = price,
#'                             color = cut, fill = cut)) +
#'   geom_boxplot() +
#'   scale_color_KG(name = "Hanamushiro", alpha = 0.3) +
#'   scale_fill_KG(name = "Hokkaido_Sky", alpha = 1) +
#'   theme_dark()
scale_color_KG <- function(name = "Sapporo_Sta", alpha = 1,
                           na.value = "red", discrete = TRUE) {

  if(discrete){

    ggplot2::discrete_scale(aesthetics = "color",
                            scale_name = name,
                            palette = get_KG_palette(name, alpha),
                            na.value = na.value)

  }else{

    ggplot2::scale_color_gradientn(colours = get_KG_color(n = 255, name, alpha),
                                   na.value = na.value)

  }

 }

#' @rdname scale_color_KG
#' @importFrom ggplot2 discrete_scale
#' @export
scale_colour_KG <- scale_color_KG

#' Use KaradaColor fills on ggplot2
#'
#' \code{scale_fill_KG} Use KaradaColor fills on ggplot2
#' @importFrom ggplot2 discrete_scale scale_fill_gradientn
#' @param name color palette name. (default: \code{"Sapporo_Sta"})
#' @param alpha	The alpha transparency. Numbers range from 0-1. see argument alpha in \code{\link[grDevices]{rgb}}.
#' @param na.value Color of missing value.
#' @param discrete Generate a discrete palette. (\code{FALSE} - generate continuous palette)
#' @return Create a user defined color palette for ggplot2.
#' @author KARADA-GOOD \email{info@karada-good.net}, \href{https://github.com/KaradaGood/KaradaColor}{Github}, \href{https://www.karada-good.net/analyticsr/r-770/}{Personal Blog}
#' @export scale_fill_KG
#' @examples
#' set.seed(1)
#' x <- LETTERS[1:20]
#' y <- paste0("var", seq(1,20))
#' data <- expand.grid(X=x, Y=y)
#' data$Z <- sample(c(NA, rnorm(15)), 20, replace = TRUE)
#' library("ggplot2")
#' ggplot(data, aes(X, Y, fill= Z)) +
#'   geom_tile() +
#'   scale_fill_KG(discrete = FALSE, name = "Hanamushiro",
#'                 alpha = 1, na.value = "red")
scale_fill_KG <- function(name = "Sapporo_Sta", alpha = 1,
                          na.value = "red", discrete = TRUE) {

  if(discrete){

    ggplot2::discrete_scale(aesthetics = "fill",
                            scale_name = name,
                            palette = get_KG_palette(name, alpha),
                            na.value = na.value)

  }else{

    ggplot2::scale_fill_gradientn(colours = get_KG_color(n = 255, name, alpha),
                                  na.value = na.value)

  }

}
