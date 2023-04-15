#' @title Displays the color palette of the KaradaColor Package
#' @description \code{Plot_KG_Palette} Displays the color palette of the KaradaColor Package
#' @importFrom grDevices colorRampPalette rgb
#' @importFrom graphics image rect text
#' @param n Number of colors to create.
#' @param name color palette name. (default: \code{"Sapporo_Sta"})
#' @param colplot Plotting Color Palette.
#' @return Vector containing a hex color code representation for the chosen palette
#' @author KARADA-GOOD \email{info@karada-good.net}, \href{https://github.com/KaradaGood/KaradaColor}{Github}, \href{https://www.karada-good.net/analyticsr/r-770/}{Personal Blog}
#' @export Plot_KG_Palette
#' @examples
#' Plot_KG_Palette(name = "Amanohashidate", n = 5, colplot = TRUE)
#' library("ggplot2")
#' ggplot(data = data.frame(x = 1:5, y = 1:5), aes(x, y)) +
#'   geom_point(col = Plot_KG_Palette("Sapporo_Sta", n = 5,
#'                                    colplot = FALSE),
#'                                    size = 10)
Plot_KG_Palette <- function(n = 5, name = "Sapporo_Sta", colplot = TRUE) {
  #Check the color palette name
  pal_name <- df_KG_palettes[[name]]
  #Displays the available color palette name if it is outside of the recorded name, and then exits
  if (is.null(pal_name)) {
    stop("Palette not found.")
  }
  #Create color palette
  pal_col <- colorRampPalette(pal_name)

  if(colplot == TRUE){
    ###Plot Preparation#####
    image(x = seq_len(n), y = 1, z = as.matrix(seq_len(n)),
          col = pal_col(n), xlab = "", ylab = "",
          xaxt = "n", yaxt = "n", bty = "n")
    rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
    text(labels = name, x = (n + 1)/2, y = 1, cex = 2)}

  return(pal_col(n))

}
