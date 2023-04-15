#' Display the color palette data set for the KaradaColor Package in the console
#'
#' \code{show_KG_palette} Display the color palette data set for the KaradaColor Package in the console
#' @importFrom crayon make_style combine_styles
#' @param x color palette data.
#' @return Vector containing a hex color code representation for the chosen palette
#' @author KARADA-GOOD \email{info@karada-good.net}, \href{https://github.com/KaradaGood/KaradaColor}{Github}, \href{https://www.karada-good.net/analyticsr/r-770}{Personal Blog}
#' @export show_KG_palette
#' @examples
#' show_KG_palette()
show_KG_palette <- function(x = df_KG_palettes) {
  for(i in seq_along(x)){
    pal_name <- names(x)[i]
    pal_col <- x[[i]]
    cols <- sapply(pal_col, console_col)
    cat(paste0("Name:", pal_name,"\n",
               paste0(cols, collapse = " "), "\n"))
  }
}

#' @rdname show_KG_palette
#' @export
console_col <- function(x) {
  text <- crayon::make_style("black", bg = FALSE)
  backcol <- crayon::make_style(x, bg = TRUE, grey = FALSE)
  crayon::combine_styles(text, backcol)(x)
}
