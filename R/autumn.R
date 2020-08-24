#' List of autumnal palettes, 8 or 5 values long.
#'
#' @export
#'
autumn <- list(
  "1.8" = c("#730F1FFF", "#842C3BFF", "#964B57FF", "#A76973FF",
        "#B9878FFF", "#CAA5ABFF", "#DCC3C7FF", "#EDE1E3FF"),
  "2.8" = c("#A93400FF", "#B34D1FFF", "#BE663FFF", "#C9805FFF",
        "#D3997FFF", "#DEB29FFF", "#E9CCBFFF", "#F4E5DFFF"),
  "3.8" = c("#A7374BFF", "#B25061FF", "#BD6978FF", "#C8828EFF",
        "#D39BA4FF", "#DEB3BBFF", "#E9CDD2FF", "#F3E6E8FF"),
  "4.8" = c("#A84D3BFF", "#B26353FF", "#BD796CFF", "#C88F84FF",
        "#D3A59DFF", "#DEBCB5FF", "#E9D2CEFF", "#F4E8E6FF"),
  "5.8" = c("#A33333FF", "#AE4C4CFF", "#BA6666FF", "#C57F7FFF",
        "#D19999FF", "#DCB2B2FF", "#E8CCCCFF", "#F3E5E5FF"),
  "6.8" = c("#A63A00FF", "#B1521FFF", "#BC6B3FFF", "#C7835FFF",
        "#D29C7FFF", "#DDB59FFF", "#E8CDBFFF", "#F3E6DFFF"),
  "7.8" = c("#730F1FFF", "#842C38FF", "#964A51FF", "#A7686AFF",
          "#B98683FF", "#CAA39CFF", "#DCC1B5FF", "#EDDFCEFF"),
  "8.8" = c("#A63A00FF", "#B1521DFF", "#BC6A3AFF", "#C78357FF",
          "#D29B74FF", "#DDB391FF", "#E8CCAEFF", "#F3E4CBFF"),
  "9.8" = c("#822E00FF", "#894418FF", "#905B30FF", "#977149FF",
          "#9F8861FF", "#A69F79FF", "#ADB592FF", "#B4CCAAFF"),
  "10.8" = c("#8A1000FF", "#912913FF", "#984227FF", "#9F5B3BFF",
           "#A7744FFF", "#AE8D62FF", "#B5A676FF", "#BCBF8AFF"),
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
#' @return Void.
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
    for (palette in names(autumn)) {

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
        ggplot2::scale_fill_manual(values = autumn[[palette]],
                                   labels = autumn[[palette]]) +
        ggplot2::theme(axis.title.x = ggplot2::element_blank(),
                       axis.title.y = ggplot2::element_blank(),
                       legend.title = ggplot2::element_blank(),
                       plot.title = ggplot2::element_text(face = "bold",
                                                          size = 16)) +
        ggplot2::labs(title = paste("autumn ", palette))

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
    ggplot2::scale_fill_manual(values = autumn[[palette_name]],
                               labels = autumn[[palette_name]]) +
    ggplot2::theme(axis.title.x = ggplot2::element_blank(),
                   axis.title.y = ggplot2::element_blank(),
                   legend.title = ggplot2::element_blank(),
                   plot.title = ggplot2::element_text(face = "bold",
                                                      size = 16)) +
    ggplot2::labs(title = paste("autumn ", palette_name))

  print(single_plot)

  return(invisible())

}
