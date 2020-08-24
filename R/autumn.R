#' List of autumnal palettes, 8 or 5 values long.
#'
#' @export
#'
autumn <- list(
  "1.8" = c("#9F2700FF", "#AB421FFF", "#B75D3FFF", "#C3785FFF",
            "#CF937FFF", "#DBAE9FFF", "#E7C9BFFF", "#F3E4DFFF"),
  "2.8" = c("#A84D3BFF", "#B26353FF", "#BD796CFF", "#C88F84FF",
            "#D3A59DFF", "#DEBCB5FF", "#E9D2CEFF", "#F4E8E6FF"),
  "3.8" = c("#A33333FF", "#AE4C4CFF", "#BA6666FF", "#C57F7FFF",
            "#D19999FF", "#DCB2B2FF", "#E8CCCCFF", "#F3E5E5FF"),
  "4.8" = c("#A63A00FF", "#B1521CFF", "#BC6A39FF", "#C78256FF",
            "#D29B73FF", "#DCB390FF", "#E7CBADFF", "#F3E4CBFF"),
  "5.8" = c("#822E00FF", "#894418FF", "#905B30FF", "#977148FF",
            "#9E8861FF", "#A59E79FF", "#ACB591FF", "#B4CCAAFF"),
  "1.5" = c("#9F2700FF", "#B25233FF", "#C57D66FF", "#D8A899FF", "#EBD3CCFF"),
  "2.5" = c("#A84D3BFF", "#B97062FF", "#CA9489FF", "#DCB7B0FF", "#EDDBD7FF"),
  "3.5" = c("#A33333FF", "#B55B5BFF", "#C78484FF", "#DAADADFF", "#ECD6D6FF"),
  "4.5" = c("#A63A00FF", "#B96432FF", "#CC8F65FF", "#DFB998FF", "#F3E4CBFF"),
  "5.5" = c("#822E00FF", "#8E552AFF", "#9B7D55FF", "#A7A47FFF", "#B4CCAAFF"),
  "1.3" = c("#9F2700FF", "#BF6F55FF", "#DFB7AAFF"),
  "2.3" = c("#A84D3BFF", "#C5887CFF", "#E2C3BDFF" ),
  "3.3" = c("#A33333FF", "#C17777FF", "#E0BBBBFF"),
  "4.3" = c("#A63A00FF", "#CC8F65FF", "#F3E4CBFF"),
  "5.3" = c("#822E00FF", "#9B7D55FF", "#B4CCAAFF")
)

#' Generate autumnal color palette.
#'
#' @param palette_name The short ID for the palette, e.g. "1.8".
#'
#' @return A vector of hexademicals of length 3, 5, or 8.
#'
#' @examples
#' # Assign palette to a name.
#' my_palette <- ashR.autumn("5.5")
#'
#' # Concatenate two palettes for a larger custom palette.
#' custom <- c(ashR.autumn("2.8"), ashR.autumn("3.8"))
#'
#' # Use with base R.
#' plot(iris$Sepal.Width,
#'      iris$Sepal.Length,
#'      col = ashR.autumn("1.5"))
#'
#' @export
#'
ashR.autumn <- function(palette_name) {

  return(autumn[[palette_name]])

}

#' Print a demo plot for autumn-tone color palette.
#'
#' @param palette_name The short ID for the palette, e.g. "1.8".
#'
#' @return Single plot or list of all plots as ggplot2 objects.
#'
#' @examples
#' # Print demo plot for single autumn palette.
#' ashR.autumn("5.5")
#'
#' # Print demo plots for all autumn palettes.
#' ashR.autumn("all")
#'
#' @export
#'
ashR.autumn.demo <- function(palette_name) {

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
    for (palette in names(autumn)) {

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
        ggplot2::scale_fill_manual(values = autumn[[palette]],
                                   labels = autumn[[palette]]) +
        ggplot2::theme(axis.title.x = ggplot2::element_blank(),
                       axis.title.y = ggplot2::element_blank(),
                       legend.title = ggplot2::element_blank(),
                       plot.title = ggplot2::element_text(face = "bold",
                                                          size = 16)) +
        ggplot2::labs(title = paste("Autumn ", palette))

      print(current_plot)

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
    ggplot2::scale_fill_manual(values = autumn[[palette_name]],
                               labels = autumn[[palette_name]]) +
    ggplot2::theme(axis.title.x = ggplot2::element_blank(),
                   axis.title.y = ggplot2::element_blank(),
                   legend.title = ggplot2::element_blank(),
                   plot.title = ggplot2::element_text(face = "bold",
                                                      size = 16)) +
    ggplot2::labs(title = paste("Autumn ", palette_name))

  print(single_plot)

  return(single_plot)

}
