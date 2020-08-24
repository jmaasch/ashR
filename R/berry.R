#' List of berry palettes, 8 or 5 values long.
#'
#' @export
#'
berry <- list(
  "1.8" = c("#573369FF", "#6C4C7BFF", "#81668EFF", "#967FA1FF", 
            "#AB99B3FF", "#C0B2C6FF", "#D5CCD9FF", "#EAE5ECFF"),
  "2.8" = c("#6B2E63FF", "#7D4876FF", "#90628AFF", "#A27C9DFF", 
            "#B496B1FF", "#C7B0C4FF", "#DACAD8FF", "#ECE4EBFF"),
  "3.8" = c("#6F0043FF", "#811F5AFF", "#933F72FF", "#A55F89FF", 
            "#B77FA1FF", "#C99FB8FF", "#DBBFD0FF", "#EDDFE7FF"),
  "4.8" = c("#9E194DFF", "#AA3563FF", "#B65279FF", "#C26F8FFF", 
            "#CE8CA5FF", "#DAA8BCFF", "#E6C5D2FF", "#F2E2E8FF"),
  "5.8" = c("#A7374BFF", "#B15061FF", "#BC6977FF", "#C7828EFF", 
            "#D29BA4FF", "#DDB3BBFF", "#E8CDD1FF", "#F3E6E8FF"),
  "1.5" = c("#573369FF", "#785B87FF", "#9A84A5FF", "#BBADC3FF", "#DDD6E1FF"),
  "2.5" = c("#6B2E63FF", "#885782FF", "#A681A1FF", "#C3ABC0FF", "#E1D5DFFF"),
  "3.5" = c("#6F0043FF", "#8B3368FF", "#A8668EFF", "#C599B3FF", "#E2CCD9FF"),
  "4.5" = c("#9E194DFF", "#B14770FF", "#C47594FF", "#D8A3B7FF", "#EBD1DBFF"),
  "5.5" = c("#A7374BFF", "#BA6272FF", "#CD8E99FF", "#E0BAC0FF", "#F3E6E8FF"),
  "1.3" = c("#573369FF", "#8F779BFF", "#C7BBCDFF"),
  "2.3" = c("#6B2E63FF", "#9C7397FF", "#CDB9CBFF"),
  "3.3" = c("#6F0043FF", "#9F5581FF", "#CFAAC0FF"),
  "4.3" = c("#9E194DFF", "#BE6588FF", "#DEB2C3FF"),
  "5.3" = c("#A7374BFF", "#CD8E99FF", "#F3E6E8FF")
)

#' Generate berry-tone color palette.
#'
#' @param palette_name The short ID for the palette, e.g. "1.8".
#'
#' @return A vector of hexademicals of length 3, 5, or 8.
#'
#' @examples
#' # Assign palette to a name.
#' my_palette <- ashR.berry("5.5")
#'
#' # Concatenate two palettes for a larger custom palette.
#' custom <- c(ashR.berry("2.8"), ashR.berry("3.8"))
#'
#' # Use with base R.
#' plot(iris$Sepal.Width,
#'      iris$Sepal.Length,
#'      col = ashR.berry("1.5"))
#'
#' @export
#'
ashR.berry <- function(palette_name) {

  return(berry[[palette_name]])
  
}

#' Print a demo plot for berry-tone color palette.
#'
#' @param palette_name The short ID for the palette, e.g. "1.8".
#'
#' @return Single plot or list of all plots as ggplot2 objects.
#'
#' @examples
#' # Print demo plot for single berry palette.
#' ashR.berry("5.5")
#' 
#' # Print demo plots for all berry palettes.
#' ashR.berry("all")
#'
#' @export
#'
ashR.berry.demo <- function(palette_name) {
  
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
    for (palette in names(berry)) {
      
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
        ggplot2::scale_fill_manual(values = berry[[palette]], 
                                   labels = berry[[palette]]) +
        ggplot2::theme(axis.title.x = ggplot2::element_blank(),
                       axis.title.y = ggplot2::element_blank(),
                       legend.title = ggplot2::element_blank(),
                       plot.title = ggplot2::element_text(face = "bold",
                                                          size = 16)) +
        ggplot2::labs(title = paste("Berry ", palette))
      
      print(current_plot)
      
      # Update plot list.
      plot_list[[i]] <- current_plot
      i <- i + 1
      
      print(plot_list)
      
    }
    
    return(current_plot)
    
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
    ggplot2::scale_fill_manual(values = berry[[palette_name]], 
                               labels = berry[[palette_name]]) +
    ggplot2::theme(axis.title.x = ggplot2::element_blank(),
                   axis.title.y = ggplot2::element_blank(),
                   legend.title = ggplot2::element_blank(),
                   plot.title = ggplot2::element_text(face = "bold",
                                                      size = 16)) +
    ggplot2::labs(title = paste("Berry ", palette_name))
  
  print(single_plot)
  
  return(single_plot)
  
}