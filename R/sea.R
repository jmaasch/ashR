#' List of watery palettes, 8 or 5 values long.
#'
#' @export
#'
sea <- list(
  "1.8" = c("#0D2B52FF", "#2B4567FF", "#49607DFF", "#677A92FF",
            "#8694A8FF", "#A4AFBEFF", "#C2CAD3FF", "#E0E4E9FF"),
  "2.8" = c("#006778FF", "#1F7A88FF", "#3F8D99FF", "#5FA0AAFF", 
            "#7FB3BBFF", "#9FC5CCFF", "#BFD9DDFF", "#DFECEEFF"),
  "3.8" = c("#202D85FF", "#37478CFF", "#4E6193FF", "#667B9AFF", 
            "#7D96A1FF", "#94B0A8FF", "#ACCAAFFF", "#C3E4B6FF"),
  "4.8" = c("#417777FF", "#588888FF", "#709999FF", "#88AAAAFF",
            "#A0BBBBFF", "#B7CCCCFF", "#CFDDDDFF", "#E7EEEEFF"),
  "5.8" = c("#1B3644FF", "#374F5BFF", "#546872FF", "#70818AFF",
            "#8D9AA1FF", "#A9B3B8FF", "#C6CCD0FF", "#E2E5E7FF"),
  "1.5" = c("#0D2B52FF", "#3D5574FF", "#6D7F97FF", "#9EAAB9FF", "#CED4DCFF"),
  "2.5" = c("#006778FF", "#378895FF", "#6FA9B3FF", "#A7CAD0FF", "#DFECEEFF"),
  "3.5" = c("#202D85FF", "#455790FF", "#6A819BFF", "#90ABA6FF", "#B5D5B1FF"),
  "4.5" = c("#417777FF", "#679292FF", "#8DADADFF", "#B3C8C8FF", "#D9E3E3FF"),
  "5.5" = c("#1B3644FF", "#485E69FF", "#76868EFF", "#A3AEB4FF", "#D1D6D9FF"),
  "1.3" = c("#0D2B52FF", "#5D718BFF", "#AEB8C5FF"),
  "2.3" = c("#006778FF", "#6FA9B3FF", "#DFECEEFF"),
  "3.3" = c("#202D85FF", "#5E7297FF", "#9CB9AAFF"),
  "4.3" = c("#417777FF", "#80A4A4FF", "#BFD1D1FF"),
  "5.3" = c("#1B3644FF", "#677982FF", "#B3BBC0FF")
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
#' @return Single plot or list of all plots as ggplot2 objects.
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
  
  # If input is "all", print all demo plots.
  if (palette_name == "all") {
    
    # Construct dataframes.
    df8<- data.frame(Value = c(4, 6, 3, 7, 2, 5, 8, 9),
                     Label = c(1, 2, 3, 4, 5, 6, 7, 8))
    df8$Label <- as.factor(df8$Label)
    
    df5 <- data.frame(Value = c(4, 6, 3, 7, 9),
                      Label = c(1, 2, 3, 4, 5))
    df5$Label <- as.factor(df5$Label)
    
    df3 <- data.frame(Value = c(4, 6, 9),
                      Label = c(1, 2, 3))
    df3$Label <- as.factor(df3$Label)
    
    # Init empty list for plots.
    plot_list <- vector("list", 15)
    i <- 1
    
    # Loop through all palettes.
    for (palette in names(sea)) {
      
      if (grepl(".8", palette, fixed = TRUE)) {
        df <- df8
      }
      else if (grepl(".5", palette, fixed = TRUE)) {
        df <- df5
      }
      else if (grepl(".3", palette, fixed = TRUE)) {
        df <- df3
      }
      
      # Construct and print bar plot. 
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
        ggplot2::labs(title = paste("Sea ", palette))
      
      # Update plot list.
      plot_list[[i]] <- current_plot
      i <- i + 1
      
      print(current_plot)
      
    }
    
    return(plot_list)
    
  }
  
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
    ggplot2::labs(title = paste("Sea ", palette_name))
  
  print(single_plot)
  
  return(single_plot)
  
}