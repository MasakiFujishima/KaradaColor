#' Create complementary color
#'
#' \code{kg_create_cc} This function create complementary color.
#' @importFrom grDevices colorRamp rgb
#'
#' @param basecols Color data.
#' @param alpha	The alpha transparency. Numbers range from 0-1.
#'      see argument alpha in \code{\link[grDevices]{rgb}}.
#' @return Return base and complementary color in a data frame
#' @export
#' @examples
#' kg_show_console(kg_create_cc())
#' kg_plot_color(color = kg_create_cc())
kg_create_cc <- function(basecols = c("#ff48ac", "red"), alpha = 1){

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
#' \code{kg_create_tc} This function create triad color.
#' @importFrom grDevices colorRamp rgb
#'
#' @param basecols Color data.
#' @param alpha	The alpha transparency. Numbers range from 0-1.
#'      see argument alpha in \code{\link[grDevices]{rgb}}.
#'
#' @return Return triad color in a data frame
#' @export
#' @examples
#' kg_show_console(kg_create_tc())
#' kg_plot_color(color = kg_create_tc())
kg_create_tc <- function(basecols = "#4E5C78", alpha = 1){

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

#' Monochromatic Color
#'
#' \code{kg_create_mc} This function create monochromatic color.
#' @importFrom grDevices colorRamp rgb
#'
#' @param basecols Color data.
#' @param n Create n colors of low and high saturation
#'      with Color data in the center.
#' @param alpha	The alpha transparency. Numbers range from 0-1.
#'      see argument alpha in \code{\link[grDevices]{rgb}}.#'
#'
#' @return Return monochromatic color in a data frame
#' @export
#' @examples
#' kg_show_console(kg_create_mc())
#' kg_plot_color(color = kg_create_mc(basecols = "#d0af4c"))
kg_create_mc <- function(basecols = "#7F36EF", n = 2, alpha = 1){

  get_RGB <- grDevices::colorRamp(color = basecols, space = "Lab", interpolate = "spline")
  create_RGB <- get_RGB(seq(0, 1, length.out = 1))/255

  max_position <- which.max(create_RGB)
  min_position <- which.min(create_RGB)
  midle_position <- grep(paste0("(*", max_position, "|", min_position, ")"),
                         1:3, invert = TRUE)

  if(identical(max_position, min_position, midle_position)){

    get_position <- 1:3

  }else{

    get_position <- c(max_position, midle_position, min_position)

  }

  master_RGB <- rbind(create_RGB, matrix(ncol = 3, nrow = n * 2))

  for(i in seq(get_position)){

    get_value  <- master_RGB[1, get_position[[i]]]
    master_RGB[, get_position[[i]]] <- range_RGB(get_value, n)

  }

  result_cols <- grDevices::rgb(master_RGB[, 1], master_RGB[, 2], master_RGB[, 3],
                                alpha = alpha)
  result_data <- as.data.frame(result_cols)
  colnames(result_data) <- "Monochromatic"
  rownames(result_data) <- paste0("No_", seq(nrow(result_data)))

  return(result_data)

}

#' @rdname kg_create_mc
#' @export
range_RGB <- function(basecols = NULL, n = NULL){

  if(basecols >= 1){

    drow_value <- rev(seq(1, 0, length.out = n * 2 + 1))

  }

  if(basecols == 0){

    drow_value <- seq(0, 0, length.out = n * 2 + 1)

  }

  if(basecols < 1 & basecols > 0){

    more_value <- round(rev(seq(basecols, 1, by = (1 - basecols) / (n + 1))[1:(n + 1)]), 5)
    under_value <- round(rev(seq(0, basecols, by = basecols / (n + 1)))[1:(n + 1)], 5)

    drow_value <- rev(unique(c(more_value, under_value)))

  }

  return(drow_value)

}
