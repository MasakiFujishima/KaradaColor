#' @title Display the color palette data set for the KaradaColor Package in the console
#' @description \code{Show_KG_Palette} Display the color palette data set for the KaradaColor Package in the console
#' @importFrom crayon make_style combine_styles
#' @param x color palette data.
#' @return Vector containing a hex color code representation for the chosen palette
#' @author KARADA-GOOD \email{info@karada-good.net}, \href{https://github.com/KaradaGood/KaradaColor}{Github}, \href{https://www.karada-good.net/analyticsr/r-770/}{Personal Blog}
#' @export Show_KG_Palette
#' @examples
#' Show_KG_Palette()
Show_KG_Palette <- function(x = df_KG_palettes) {
  for(i in seq_along(x)){
    pal_name <- names(x)[i]
    pal_col <- x[[i]]
    cols <- sapply(pal_col, Console_Col)
    cat(paste0("Name:", pal_name,"\n",
               paste0(cols, collapse = " "), "\n"))
  }
}

#' @rdname Show_KG_Palette
#' @export
Console_Col <- function(x) {
  text <- crayon::make_style("black", bg = FALSE)
  backcol <- crayon::make_style(x, bg = TRUE, grey = FALSE)
  crayon::combine_styles(text, backcol)(x)
}
