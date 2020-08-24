#' List of earth-tone palettes, 8 or 5 values long.
#'
#' @export
#'
earth <- list(
  "1.8" = c("#410005FF", "#581F24FF", "#703F43FF", "#885F62FF", 
            "#A07F82FF", "#B79FA1FF", "#CFBFC0FF", "#E7DFDFFF"),
  "2.8" = c("#71260AFF", "#824128FF", "#945C47FF", "#A67765FF", 
            "#B89284FF", "#C9ADA3FF", "#DBC8C1FF", "#EDE3E0FF"),
  "3.8" = c("#6A3F48FF", "#7C575EFF", "#8F6F75FF", "#A1878CFF", 
            "#B49FA3FF", "#C7B7BAFF", "#D9CFD1FF", "#ECE7E8FF"),
  "4.8" = c("#3D3B39FF", "#555351FF", "#6D6B6AFF", "#858483FF",
            "#9D9C9BFF", "#B5B5B4FF", "#CDCDCDFF", "#E6E6E6FF"),
  "5.8" = c("#672A00FF", "#78421AFF", "#8A5B35FF", "#9C7450FF",
            "#AD8C6BFF", "#BFA586FF", "#D1BEA1FF", "#E3D7BCFF"),
  "1.5" = c("#410005FF", "#673337FF", "#8D6669FF", "#B3999BFF", "#D9CCCDFF"),
  "2.5" = c("#71260AFF", "#8D513BFF", "#A97C6CFF", "#C6A89DFF", "#E2D3CEFF"),
  "3.5" = c("#6A3F48FF", "#87656CFF", "#A58B91FF", "#C3B2B5FF", "#E1D8DAFF"),
  "4.5" = c("#3D3B39FF", "#676564FF", "#91908FFF", "#BBBBBAFF", "#E6E6E6FF"),
  "5.5" = c("#672A00FF", "#86552FFF", "#A4805EFF", "#C3AB8DFF", "#E3D7BCFF"),
  "1.3" = c("#410005FF", "#805558FF", "#BFAAABFF"),
  "2.3" = c("#71260AFF", "#A06E5BFF", "#CFB6ADFF"),
  "3.3" = c("#6A3F48FF", "#9B7F84FF", "#CDBFC2FF"),
  "4.3" = c("#3D3B39FF", "#91908FFF", "#E6E6E6FF"),
  "5.3" = c("#672A00FF", "#A4805EFF", "#E3D7BCFF")
)

#' Generate earth-tone color palette.
#'
#' @param palette_name The short ID for the palette, e.g. "1.8".
#'
#' @return A vector of hexademicals of length 3, 5, or 8.
#'
#' @examples
#' # Assign palette to a name.
#' my_palette <- ashR.earth("5.5")
#'
#' # Concatenate two palettes for a larger custom palette.
#' custom <- c(ashR.earth("2.8"), ashR.earth("3.8"))
#'
#' # Use with base R.
#' plot(iris$Sepal.Width,
#'      iris$Sepal.Length,
#'      col = ashR.earth("1.5"))
#'
#' @export
#'
ashR.earth <- function(palette_name) {
  
  return(earth[[palette_name]])
  
}

#' Print a demo plot for earth-tone color palette.
#'
#' @param palette_name The short ID for the palette, e.g. "1.8".
#'
#' @return Single plot or list of all plots as ggplot2 objects.
#'
#' @examples
#' # Print demo plot for single earth palette.
#' ashR.earth("5.5")
#' 
#' # Print demo plots for all earth palettes.
#' ashR.earth("all")
#'
#' @export
#'
ashR.earth.demo <- function(palette_name) {
  
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
    for (palette in names(earth)) {
      
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
        ggplot2::scale_fill_manual(values = earth[[palette]], 
                                   labels = earth[[palette]]) +
        ggplot2::theme(axis.title.x = ggplot2::element_blank(),
                       axis.title.y = ggplot2::element_blank(),
                       legend.title = ggplot2::element_blank(),
                       plot.title = ggplot2::element_text(face = "bold",
                                                          size = 16)) +
        ggplot2::labs(title = paste("Earth ", palette))
      
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
    ggplot2::scale_fill_manual(values = earth[[palette_name]], 
                               labels = earth[[palette_name]]) +
    ggplot2::theme(axis.title.x = ggplot2::element_blank(),
                   axis.title.y = ggplot2::element_blank(),
                   legend.title = ggplot2::element_blank(),
                   plot.title = ggplot2::element_text(face = "bold",
                                                      size = 16)) +
    ggplot2::labs(title = paste("Earth ", palette_name))
  
  print(single_plot)
  
  return(single_plot)
  
}