#' Draw the color palette of the KaradaColor Package
#'
#' \code{plot_KG_Palette} This function draw the color palette of the KaradaColor Package.
#' @importFrom grDevices colorRampPalette rgb
#' @importFrom graphics image rect text
#' @param name Color palette color palette name. (default: \code{"Sapporo_Sta"})
#' @param color Color data. Precedence over name except NULL. (default: NULL)
#' @param n Number of colors to create.
#' @param show Add a color code to the plot.
#' @return Vector containing a hex color code representation for the chosen palette
#' @author Masaki Fujishima \email{info@karada-good.net}, \href{https://github.com/KaradaGood/KaradaColor}{Github}, \href{https://www.karada-good.net/analyticsr/r-770/}{Personal Blog}
#' @export plot_KG_palette
#' @examples
#' #Draw the color palette of the KaradaColor
#' plot_KG_palette(name = "Amanohashidate", n = 5, showcode = FALSE)
#' #Draw the KG_create_cc command
#' plot_KG_palette(color = KG_create_cc(c("#ff48ac", "yellow")), showcode = TRUE)
#' #Draw the KG_create_tc command
#' plot_KG_palette(color = KG_create_tc("yellow"), showcode = TRUE)
#' #Color data
#' plot_KG_palette(color = c("gray"), showcode = FALSE)
plot_KG_palette <- function(name = "Sapporo_Sta", color = NULL, n = 5, showcode = TRUE) {
  
  if (is.null(color)) {
    
    if(name %in% names(df_KG_palettes)){
      
      x <- setNames(data.frame(df_KG_palettes[[name]]), name)
      
    }else{
      
      stop("Palette not found.") 
      
    }
    
  }else{
    
    x <- color
    
  }
  
  cxlist <- convert_colTodf(x)
  
  #print(cxlist)
  
  image(x = seq_len(ncol(cxlist$x)), y = seq_len(nrow(cxlist$x)),
        z = t(matrix(data = seq_len(ncol(cxlist$x)*nrow(cxlist$x)),
                     nrow = nrow(cxlist$x), ncol = ncol(cxlist$x))),
        col = as.character(cxlist$x), xlab = "", ylab = "",
        xaxt = "n", yaxt = "n", bty = "n")
  
  image_add_textAcode(cxlist$x, cxlist$xlab, cxlist$ylab,
                      cxlist$get_colpalnames, showcode)
  
}

#' @rdname plot_KG_palette
#' @return Vector containing a hex color code representation for the chosen palette
#' @export
convert_colTodf <- function (x, ...) {
  
  get_colnames <- NULL
  xlab <- NULL
  ylab <- NULL
  
  if(is.character(x)) {
    
    x <- setNames(data.frame(x), "color")
    
    }
  
  if(ncol(x) < 2 | nrow(x) < 2) {
    
    get_colpalnames <- colnames(x)
    
    if(nrow(x) == 1) {
      
      x <- as.matrix(x)
      
      }else{
        
        x <- t(as.matrix(x))
        
        }
    
    }else{
      
      get_colpalnames <- colnames(x)
      x <- as.matrix(x)[nrow(x):1, ]
      xlab <- colnames(x)
      ylab <- rownames(x)
      
    }
  
  return(list(get_colpalnames = get_colpalnames,
              x = x, xlab = xlab, ylab = ylab))
  
  }

#' @rdname plot_KG_palette
#' @export
image_add_textAcode <- function(x, xlab = NULL, ylab = NULL, get_colnames, showcode, ...) {
  
  if (nrow(x) < 2) {
    
    rect(xleft = 0, ybottom = 0.9, xright = ncol(x) + 1, ytop = 1.1,
         col = rgb(1, 1, 1, 0.8), border = NA)
    
    if (length(get_colnames) == 1){
      
      x_range <- (ncol(x) + 1)/2
      
    }else{
      
      x_range <- seq_len(ncol(x))
      
    }
    
    text(labels = get_colnames, x = x_range, y = 1, cex = 2)
    
    if (showcode) {
      
      rect(xleft = 0, ybottom = 0.6, xright = ncol(x) + 1, ytop = 0.65,
           col = rgb(1, 1, 1, 0.8), border = NA)
      text(labels = as.character(x), x = seq_len(ncol(x)), y = 0.625, cex = 1)
      
    }
    
    return(show_KG_palette(as.character(x)))
    
  }else{
    
    axis(side = 3, at = seq(1, 2, length = length(xlab)), lwd = 0,
         labels = xlab)
    axis(side = 2, at = seq(1, nrow(x), length = length(ylab)), lwd = 0,
         labels = ylab, pos = 0.55, las = 2)
    
    if (showcode) {
      
      rect(xleft = 0, ybottom = seq_len(nrow(x))-0.15,
           xright = ncol(x) + 1, ytop = seq_len(nrow(x))+0.15,
           col = rgb(1, 1, 1, 0.8), border = NA)
      text(labels = as.character(x),
           x = rep(seq_len(ncol(x)), each = nrow(x)),
           y = rep(seq_len(nrow(x)), time = ncol(x)),
           cex = 1)
      
    }
    
    return(show_KG_palette(as.character(x)))
    
  }
}
