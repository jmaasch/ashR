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
           "#A7744FFF", "#AE8D62FF", "#B5A676FF", "#BCBF8AFF")
)

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
  "5.5" = c("#1B3644FF", "#485E69FF", "#76868EFF", "#A3AEB4FF", "#D1D6D9FF")
)

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
  "5.8" = c("#7A6285FF", "#8A7594FF", "#9B89A3FF", "#AB9CB2FF",
          "#BCB0C2FF", "#CDC4D1FF", "#DDD7E0FF", "#EEEBEFFF")
)

#' List of earth-tone palettes, 8 or 5 values long.
#'
#' @export
#'
earth <- list(
  "1.8" = c(),
  "2.8" = c(),
  "3.8" = c(),
  "4.8" = c(),
  "5.8" = c()
)

#' Generate autumnal color palette.
#'
#' @param palette_name The short ID for the palette, e.g. "1.8".
#'
#' @return A vector of hexademicals of length 5 or 8.
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
  palette <- autumn[[palette_name]]
  return(palette)
}
