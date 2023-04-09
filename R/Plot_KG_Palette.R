#' @title Displays the color palette of the KaradaColor Package
#' @description \code{Plot_KG_Palette} Displays the color palette of the KaradaColor Package
#' @importFrom grDevices colorRampPalette rgb
#' @importFrom graphics image rect text
#' @param name color palette name
#' @param n Number of colors to create
#' @param showPalette Plotting Color Palette
#' @return Vector containing a hex color code representation for the chosen palette
#' @export Show_KG_Palette
#' @examples
#' Plot_KG_Palette("Amanohashidate", n = 5, showPalette = TRUE)
Plot_KG_Palette <- function(name, n = 5,
                            showPalette = TRUE) {
  #Check the color palette name
  pal_name <- df_KG_palettes[[name]]
  #Displays the available color palette name if it is outside of the recorded name, and then exits
  if (is.null(pal_name)) {
    stop("Palette not found.")
  }
  #Create color palette
  pal_col <- colorRampPalette(pal_name)

  if(showPalette == TRUE){
    ###Plot Preparation#####
    image(x = seq_len(n), y = 1, z = as.matrix(seq_len(n)),
          col = pal_col(n), xlab = "", ylab = "",
          xaxt = "n", yaxt = "n", bty = "n")
    rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
    text(labels = name, x = (n + 1)/2, y = 1, cex = 2)}

  return(pal_col(n))

}
