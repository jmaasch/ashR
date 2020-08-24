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
  "4.8" = c("#849895FF", "#93A4A2FF", "#A2B1AFFF", "#B2BEBCFF", 
            "#C1CBCAFF", "#D0D8D7FF", "#E0E5E4FF", "#EFF2F1FF"),
  "5.8" = c("#746E6DFF", "#85807FFF", "#969291FF", "#A8A4A3FF", 
            "#B9B6B5FF", "#CAC8C8FF", "#DCDADAFF", "#EDECECFF"),
  "1.5" = c("#410005FF", "#673337FF", "#8D6669FF", "#B3999BFF", "#D9CCCDFF"),
  "2.5" = c("#71260AFF", "#8D513BFF", "#A97C6CFF", "#C6A89DFF", "#E2D3CEFF"),
  "3.5" = c("#6A3F48FF", "#87656CFF", "#A58B91FF", "#C3B2B5FF", "#E1D8DAFF"),
  "4.5" = c("#849895FF", "#9CACAAFF", "#B5C1BFFF", "#CDD5D4FF", "#E6EAE9FF"),
  "5.5" = c("#746E6DFF", "#8F8B8AFF", "#ABA8A7FF", "#C7C5C4FF", "#E3E2E1FF"),
  "1.3" = c("#410005FF", "#805558FF", "#BFAAABFF"),
  "2.3" = c("#71260AFF", "#A06E5BFF", "#CFB6ADFF"),
  "3.3" = c("#6A3F48FF", "#9B7F84FF", "#CDBFC2FF"),
  "4.3" = c("#849895FF", "#ADBAB8FF", "#D6DCDBFF"),
  "5.3" = c("#746E6DFF", "#A29E9DFF", "#D0CECEFF")
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
  palette <- earth[[palette_name]]
  return(palette)
}
