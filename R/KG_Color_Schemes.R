#' Create complementary color
#'
#' \code{show_KG_palette} This function create complementary color.
#' @importFrom grDevices colorRamp rgb
#' @param basecols Set basecol color data.
#' @param alpha	The alpha transparency. Numbers range from 0-1. see argument alpha in \code{\link[grDevices]{rgb}}.
#' @return Return base and complementary color in a data frame
#' @author Masaki Fujishima \email{info@karada-good.net}, \href{https://github.com/KaradaGood/KaradaColor}{Github}, \href{https://www.karada-good.net/analyticsr/r-770/}{Personal Blog}
#' @export KG_create_cc
#' @examples
#' show_KG_palette(KG_create_cc())
KG_create_cc <- function(basecols = c("#ff48ac", "red"), alpha = 1){

  n <- length(basecols)
  getRGB <- grDevices::colorRamp(colors = basecols, space = "Lab", interpolate = "spline")
  create_RGB <- getRGB(seq(0, 1, length.out = n))/255
  check_minmax <- apply(create_RGB, 1, max) + apply(create_RGB, 1, min)

  rgb_cols <- check_minmax - create_RGB
  bind_cols <- rbind(create_RGB, rgb_cols)
  result_cols <- grDevices::rgb(bind_cols[, 1], bind_cols[, 2], bind_cols[, 3],
                                alpha = alpha)

  result_data <- as.data.frame(matrix(result_cols, ncol = 2, byrow = FALSE))
  colnames(result_data) <- c("Base", "Complementary")
  rownames(result_data) <- paste0("No_", seq(n))
  return(result_data)

  }

#' Create triad color
#'
#' \code{show_KG_palette} This function create triad color.
#' @importFrom grDevices colorRamp rgb
#' @param basecols Set basecol color data.
#' @param alpha	The alpha transparency. Numbers range from 0-1. see argument alpha in \code{\link[grDevices]{rgb}}.
#' @return Return triad color in a data frame
#' @author Masaki Fujishima \email{info@karada-good.net}, \href{https://github.com/KaradaGood/KaradaColor}{Github}, \href{https://www.karada-good.net/analyticsr/r-770/}{Personal Blog}
#' @export KG_create_tc
#' @examples
#' show_KG_palette(KG_create_tc())
#' plot_KG_palette(color = KG_create_tc())
KG_create_tc <- function(basecols = "#4E5C78", alpha = 1){

  getRGB <- grDevices::colorRamp(color = basecols, space = "Lab", interpolate = "spline")
  create_RGB <- getRGB(seq(0, 1, length.out = 1))/255
  get_triadic <- rbind(create_RGB[c(2, 3, 1)], create_RGB, create_RGB[c(3, 1, 2)])
  result_cols <- grDevices::rgb(get_triadic[, 1], get_triadic[, 2], get_triadic[, 3],
                                alpha = alpha)
  result_data <- as.data.frame(result_cols)
  colnames(result_data) <- "Triadic"
  rownames(result_data) <- paste0("No_", seq(3))
  return(result_data)

  }
