#' Display the color palette data set in the consol
#'
#' \code{show_KG_palette} This function draws display the color palette data set for the KaradaColor Package in the console.
#' @importFrom crayon make_style combine_styles
#' @param x color palette data.
#' @return Vector containing a hex color code representation for the chosen palette
#' @author Masaki Fujishima \email{info@karada-good.net}, \href{https://github.com/KaradaGood/KaradaColor}{Github}, \href{https://www.karada-good.net/analyticsr/r-770/}{Personal Blog}
#' @export show_KG_palette
#' @examples
#' show_KG_palette()
show_KG_palette <- function(x = df_KG_palettes) {

  if(inherits(x, "list")){

    for(i in seq_along(x)){

      pal_name <- names(x)[i]
      pal_col <- x[[i]]
      cols <- sapply(pal_col, console_col)
      cat(paste0("Name:", pal_name,"\n",
                 paste0(cols, collapse = " "), "\n"))
    }
  }
  
  if(inherits(x, "character")){
    
    cols <- sapply(x, console_col)
    cat(paste0("Color:", paste0(cols, collapse = " ")))
    
    }

  if(inherits(x, "data.frame")){

    colName <- colnames(x)
    CreateCC <- matrix(nrow = nrow(x), ncol = ncol(x))

    for(i in seq_along(x)){

      pal_col <- x[[i]]
      cols <- sapply(pal_col, console_col)
      CreateCC[, i] <- cols

      }

    if(length(colName) < 2){

      return(cat(paste0(colName, ":", paste0(as.vector(CreateCC), collapse = ""))))

      }else{

      return(cat(paste0(colName[1], paste0(rep("", 6), collapse = " "), colName[2], "\n",
                        paste0(CreateCC[, 1], CreateCC[, 2], collapse = "\n"))))

      }
  }
}

#' @rdname show_KG_palette
#' @export
console_col <- function(x) {
  text <- crayon::make_style("black", bg = FALSE)
  backcol <- crayon::make_style(x, bg = TRUE, grey = FALSE)
  return(crayon::combine_styles(text, backcol)(x))
}

