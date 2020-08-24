#' List of watery palettes, 8 or 5 values long.
#'
#' @export
#'
sea <- list(
  "1.8" = c("#0D2B52FF", "#2B4567FF", "#49607DFF", "#677A92FF",
            "#8694A8FF", "#A4AFBEFF", "#C2CAD3FF", "#E0E4E9FF"),
  "2.8" = c("#008AA1FF", "#1F98ACFF", "#3FA7B8FF", "#5FB5C4FF",
            "#7FC4D0FF", "#9FD3DBFF", "#BFE1E7FF", "#DFF0F3FF"),
  "3.8" = c("#202D85FF", "#3B4794FF", "#5761A3FF", "#737BB2FF",
            "#8F96C2FF", "#ABB0D1FF", "#C7CAE0FF", "#E3E4EFFF"),
  "4.8" = c("#417777FF", "#588888FF", "#709999FF", "#88AAAAFF",
            "#A0BBBBFF", "#B7CCCCFF", "#CFDDDDFF", "#E7EEEEFF"),
  "5.8" = c("#1B3644FF", "#374F5BFF", "#546872FF", "#70818AFF",
            "#8D9AA1FF", "#A9B3B8FF", "#C6CCD0FF", "#E2E5E7FF"),
  "1.5" = c("#0D2B52FF", "#3D5574FF", "#6D7F97FF", "#9EAAB9FF", "#CED4DCFF"),
  "2.5" = c("#008AA1FF", "#33A1B3FF", "#66B8C6FF", "#99D0D9FF", "#CCE7ECFF"),
  "3.5" = c("#202D85FF", "#4C579DFF", "#7981B5FF", "#A5ABCEFF", "#D2D5E6FF"),
  "4.5" = c("#417777FF", "#679292FF", "#8DADADFF", "#B3C8C8FF", "#D9E3E3FF"),
  "5.5" = c("#1B3644FF", "#485E69FF", "#76868EFF", "#A3AEB4FF", "#D1D6D9FF"),
  "1.8" = c(),
  "2.8" = c(),
  "3.8" = c(),
  "4.8" = c(),
  "5.8" = c(),
  "1.5" = c(),
  "2.5" = c(),
  "3.5" = c(),
  "4.5" = c(),
  "5.5" = c(),
  "1.3" = c(),
  "2.3" = c(),
  "3.3" = c(),
  "4.3" = c(),
  "5.3" = c()
)

#' Generate watery color palette.
#'
#' @param palette_name The short ID for the palette, e.g. "1.8".
#'
#' @return A vector of hexademicals of length 3, 5, or 8.
#'
#' @examples
#' # Assign palette to a name.
#' my_palette <- ashR.sea("5.5")
#'
#' # Concatenate two palettes for a larger custom palette.
#' custom <- c(ashR.sea("2.8"), ashR.sea("3.8"))
#'
#' # Use with base R.
#' plot(iris$Sepal.Width,
#'      iris$Sepal.Length,
#'      col = ashR.sea("1.5"))
#'
#' @export
#'
ashR.sea <- function(palette_name) {
  
  return(sea[[palette_name]])
  
}

#' Print a demo plot for watery-tone color palette.
#'
#' @param palette_name The short ID for the palette, e.g. "1.8".
#'
#' @return Void.
#'
#' @examples
#' # Print demo plot for single sea palette.
#' ashR.sea("5.5")
#' 
#' # Print demo plots for all sea palettes.
#' ashR.sea("all")
#'
#' @export
#'
ashR.sea.demo <- function(palette_name) {
  
  # Construct dataframe.
  df <- data.frame(Value = c(4, 6, 3, 7, 2, 5, 8, 9),
                   Label = c(1, 2, 3, 4, 5, 6, 7, 8))
  
  if (grepl(".5", palette_name, fixed = TRUE)) {
    df <- data.frame(Value = c(4, 6, 3, 7, 9),
                     Label = c(1, 2, 3, 4, 5))
  }
  else if (grepl(".3", palette_name, fixed = TRUE)) {
    df <- data.frame(Value = c(4, 6, 9),
                     Label = c(1, 2, 3))
  }
  
  df$Label <- as.factor(df$Label)
  
  # If input is "all", print all demo plots.
  if (palette_name == "all") {
    for (palette in names(sea)) {
      
      if (grepl(".8", palette, fixed = TRUE)) {
        df <- data.frame(Value = c(4, 6, 3, 7, 2, 5, 8, 9),
                         Label = c(1, 2, 3, 4, 5, 6, 7, 8))
      }
      else if (grepl(".5", palette, fixed = TRUE)) {
        df <- data.frame(Value = c(4, 6, 3, 7, 9),
                         Label = c(1, 2, 3, 4, 5))
      }
      else if (grepl(".3", palette, fixed = TRUE)) {
        df <- data.frame(Value = c(4, 6, 9),
                         Label = c(1, 2, 3))
      }
      
      df$Label <- as.factor(df$Label)
      
      current_plot <- ggplot2::ggplot(df, 
                                      ggplot2::aes(x = Label, 
                                                   y = Value)) +
        ggplot2::geom_bar(stat = "identity", 
                          ggplot2::aes(fill = Label)) +
        ggthemes::theme_tufte() +
        ggplot2::scale_fill_manual(values = sea[[palette]], 
                                   labels = sea[[palette]]) +
        ggplot2::theme(axis.title.x = ggplot2::element_blank(),
                       axis.title.y = ggplot2::element_blank(),
                       legend.title = ggplot2::element_blank(),
                       plot.title = ggplot2::element_text(face = "bold",
                                                          size = 16)) +
        ggplot2::labs(title = paste("sea ", palette))
      
      print(current_plot)
      
    }
    
    return(invisible())
    
  }
  
  # Else print single demo plot.
  single_plot <- ggplot2::ggplot(df, 
                                 ggplot2::aes(x = Label, 
                                              y = Value)) +
    ggplot2::geom_bar(stat = "identity", 
                      ggplot2::aes(fill = Label)) +
    ggthemes::theme_tufte() +
    ggplot2::scale_fill_manual(values = sea[[palette_name]], 
                               labels = sea[[palette_name]]) +
    ggplot2::theme(axis.title.x = ggplot2::element_blank(),
                   axis.title.y = ggplot2::element_blank(),
                   legend.title = ggplot2::element_blank(),
                   plot.title = ggplot2::element_text(face = "bold",
                                                      size = 16)) +
    ggplot2::labs(title = paste("sea ", palette_name))
  
  print(single_plot)
  
  return(invisible())
  
}