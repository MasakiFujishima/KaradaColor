#' Draw the color palette of the KaradaColor Package
#'
#' \code{plot_KG_Palette} This function draw the color palette of the KaradaColor Package.
#' @importFrom grDevices colorRampPalette rgb
#' @importFrom graphics image rect text
#' @param name color palette color palette name. (default: \code{"Sapporo_Sta"})
#' @param color color data. Precedence over name except NULL. (default: NULL)
#' @param n Number of colors to create.
#' @return Vector containing a hex color code representation for the chosen palette
#' @author Masaki Fujishima \email{info@karada-good.net}, \href{https://github.com/KaradaGood/KaradaColor}{Github}, \href{https://www.karada-good.net/analyticsr/r-770/}{Personal Blog}
#' @export plot_KG_palette
#' @examples
#' plot_KG_palette(name = "Amanohashidate", n = 5)
#' library("ggplot2")
#' ggplot(data = data.frame(x = 1:5, y = 1:5), aes(x, y)) +
#'   geom_point(col = plot_KG_palette("Sapporo_Sta", n = 5),
#'                                    size = 10)
plot_KG_palette <- function(name = "Sapporo_Sta", color = NULL, n = 5) {

  if (is.null(color)) {
    pal_name <- df_KG_palettes[[name]]

    if (is.null(pal_name)) {
      stop("Palette not found.")
    }

    pal_col <- colorRampPalette(pal_name)
    image(x = seq_len(n), y = 1, z = as.matrix(seq_len(n)),
          col = pal_col(n), xlab = "", ylab = "",
          xaxt = "n", yaxt = "n", bty = "n")
    rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
    text(labels = name, x = (n + 1)/2, y = 1, cex = 2)
    return(pal_col(n))

  }else{

    if (!is.data.frame(color)) {

      stop("データフレームではない")

    }

    color_data <- color[[1]]
    n <- length(color_data)
    image(x = seq_len(n), y = 1, z = as.matrix(seq_len(n)),
          col = color_data, xlab = "", ylab = "",
          xaxt = "n", yaxt = "n", bty = "n")
    rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
    text(labels = names(color), x = (n + 1)/2, y = 1, cex = 2)
    return(color_data)

  }
}

#############
#テスト
#########################################################
################################################
#x <- KG_create_tc()
#reverse <- nrow(x):1

#image(x = seq_len(nrow(x)), y = seq_len(ncol(x)),
#      z = t(matrix(data = seq_len(ncol(x)*nrow(x)),
#                   nrow = ncol(x), ncol = nrow(x))),
#      col = as.matrix(x), xlab = "", ylab = "",
#      xaxt = "n", yaxt = "n", bty = "n")
#rect(xleft = 0, ybottom = 0.9, xright = nrow(x) + 1, ytop = 1.1,
#     col = rgb(1, 1, 1, 0.8), border = NA)
#text(labels = names(x), x = (nrow(x) + 1)/2, y = 1, cex = 2)
#return(color_data)
###################################################
################################################
show_KG_palette(KG_create_cc(c("#ff48ac", "red")))
#複数行データ
x <- KG_create_cc(c("#ff48ac", "red"))
#1行データ
x <- KG_create_tc()

#複数行データ
yreverse <- nrow(x):1
x <- t(as.matrix(x)[yreverse, ])
#1行データ
x <- t(as.matrix(x))

image(x = seq_len(ncol(x)), y = seq_len(nrow(x)),
      z = matrix(data = seq_len(ncol(x)*nrow(x)),
                 nrow = ncol(x), ncol = nrow(x)),
      col = x, xlab = "", ylab = "",
      xaxt = "n", yaxt = "n", bty = "n")

##行数データで処理を変える#####
rect(xleft = 0, ybottom = 0.9, xright = nrow(x) + 1, ytop = 1.1,
     col = rgb(1, 1, 1, 0.8), border = NA)

rect(xleft = 0, ybottom = 1.9, xright = nrow(x) + 1, ytop = 2.1,
     col = rgb(1, 1, 1, 0.8), border = NA)

text(labels = names(x)[1], x = (nrow(x) + 1)/3, y = c(2:1), cex = 2)

return(color_data)
###################################################




