#' @title Display the color palette data set for the KaradaColor Package in the console
#' @description \code{Show_KG_Palette} Display the color palette data set for the KaradaColor Package in the console
#' @importFrom crayon make_style combine_styles
#' @examples
#' Show_KG_Palette()
Show_KG_Palette <- function(x = df_KG_palettes) {
  for(i in seq_along(x)){
    pal_name <- names(x)[i]
    pal_col <- x[[i]]
    cols <- sapply(pal_col, color_styler)
    cat(paste0("Name:", pal_name,"\n",
               paste0(cols, collapse = " "), "\n"))
  }
}

Console_Style <- function(x) {
  text <- crayon::make_style("black", bg = FALSE)
  background <- crayon::make_style(x, bg = TRUE, grey = FALSE)
  crayon::combine_styles(text, background)(x)
}
