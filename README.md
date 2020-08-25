# `ashR`

### `ashR` *(ash-er)*: Bespoke interpolated color palettes for data visualization in R.

Built by JRMA Maasch (2020).

![density_grid](https://github.com/jmaasch/ashR/blob/master/figures/density_grid.jpg)

### Table of contents

* **[About](#About)** &nbsp; | &nbsp; [Accessibility](#Accessibility) &nbsp; | &nbsp; [License](#License)
* **[Usage](#Usage)** &nbsp; | &nbsp; [Installation](#Installation) &nbsp; | &nbsp; [Documentation](#Documentation) &nbsp; | &nbsp; [Use with ggplot2](#Use-with-ggplot2) &nbsp; | &nbsp; [Use with base R](#Use-with-base-R)
* **[View demo plots](#View-demo-plots)** &nbsp; | &nbsp; [Autumn](#Autumn) &nbsp; | &nbsp; [Sea](#Sea) &nbsp; | &nbsp; [Earth](#Earth) &nbsp; | &nbsp; [Berry](#Berry)

## About

This package provides 60 made-to-order discrete color palettes in an interpolated range. These low-contrast color palettes are intended for use cases in which subtle variation is desired. **Note: This package is currently under development.**

Bespoke color palette packages can expedite data visualization tasks. If you would like your own bespoke package, message me at www.linkedin.com/in/jmaasch.

![ridge_grid](https://github.com/jmaasch/ashR/blob/master/figures/ridge_grid.jpg)

### Accessibility

These color palettes were commissioned by a data scientist with color blindness, though we cannot guarantee usefulness for all individuals with color blindness.

### License

This package is licensed under the GNU General Public License v3.0 (<a href="https://choosealicense.com/licenses/gpl-3.0/" target="_blank">GPL-3</a>).

&#8593; [return to top](#ashR)

## Usage

### Installation

```R
# Install development version.
# Note: the package devtools must be installed but need not be loaded.
devtools::install_github("jmaasch/ashR")

# Load package.
library(ashR)
```

&#8593; [return to top](#ashR)

### Documentation

Precede any function by a question mark to access description, arguments, return value, and usage suggestions. **Vignette and further documentation coming soon.**

```R
# Access function documentation.
?ashR.autumn()
```

This package contains 4 "classes" of palettes: `autumn`, `berry`, `earth`, and `sea`. Each "class" contains 5 palettes (`1` through `5`) available in three lengths (3, 5, and 8), such that `berry` palette `1.8` is the 8-hue version of the 5-hue `berry` palette `1.5`. All palettes are stored in exported lists:

```R
> names(berry)
 [1] "1.8" "2.8" "3.8" "4.8" "5.8" "1.5" "2.5" "3.5" "4.5" "5.5" "1.3" "2.3" "3.3" "4.3" "5.3"
> names(earth)
 [1] "1.8" "2.8" "3.8" "4.8" "5.8" "1.5" "2.5" "3.5" "4.5" "5.5" "1.3" "2.3" "3.3" "4.3" "5.3"
> names(sea)
 [1] "1.8" "2.8" "3.8" "4.8" "5.8" "1.5" "2.5" "3.5" "4.5" "5.5" "1.3" "2.3" "3.3" "4.3" "5.3"
> names(autumn)
 [1] "1.8" "2.8" "3.8" "4.8" "5.8" "1.5" "2.5" "3.5" "4.5" "5.5" "1.3" "2.3" "3.3" "4.3" "5.3"
> 
```

To use a palette, pass the desired palette name as a string to one of the following functions:

```R
autumn_palette <- ashR.autumn("1.3")
berry_palette <- ashR.berry("2.5")
earth_palette <- ashR.earth("1.8")
sea_palette <- ashR.sea("4.3")
```

Demo plots can be viewed by invoking `ashR.autumn.demo()`, `ashR.berry.demo()`, `ashR.earth.demo()`, and `ashR.sea.demo()` functions. Valid inputs include any single palette name as a string (e.g. `"1.5"`) or `"all"` to print demo plots for all palettes. All demo plots can be viewed [here](#View-demo-plots).

```R
ashR.autumn.demo("1.3")
ashR.berry.demo("all")
```

Hexadecimal color codes are accessible as shown below. Demo plots also feature hexadecimal legends for convenience. Hex values may be "cherry-picked" to create custom palettes.

```R
> ashR.autumn("1.5")
[1] "#9F2700FF" "#B25233FF" "#C57D66FF" "#D8A899FF" "#EBD3CCFF"

> ashR.sea("1.3")[1]
[1] "#0D2B52FF"
```

&#8593; [return to top](#ashR)

### Use with `ggplot2`

The following reproducible example produces the plots below.

```r

density_plot <- ggplot(diamonds, aes(carat, fill = cut)) +
                geom_density(position = "stack") +
                theme_classic() +
                xlim(0, 3) +
                scale_fill_manual(values = ashR.earth("5.5")) +
                theme(axis.title = element_blank(),
                      legend.position = "none") +
                labs(title = "Earth 5.5")

```

![density_grid](https://github.com/jmaasch/ashR/blob/master/figures/density_grid2.jpg)

&#8593; [return to top](#ashR)

<img src="https://github.com/jmaasch/ashR/blob/master/figures/line.jpg" width="400" align="right"/>

### Use with base R

The following reproducible example produces the plot at right.


```r

# Construct toy data.
set.seed(5)
x <- 1:100
y1 <- cumsum(rnorm(100))
set.seed(19)
y2 <- cumsum(rnorm(100))
set.seed(24)
y3 <- cumsum(rnorm(100))

# Construct line plot.
plot(y1, 
     type = "l", 
     xlim = c(0, 100),
     ylim = c(-15, 15),
     xlab = "", 
     ylab = "", 
     col = ashR.berry("2.3")[1],
     lty = 1,
     lwd = 2,
     main = "Berry 2.3")
lines(y2, 
      type = "l", 
      col = ashR.berry("2.3")[2], 
      lty = 3,
      lwd = 3)
lines(y3, 
      type = "l", 
      col = ashR.berry("2.3")[3],
      lty = 5,
      lwd = 2)

```

&#8593; [return to top](#ashR)

## View demo plots

### Autumn
![autumn_grid](https://github.com/jmaasch/ashR/blob/master/figures/autumn_grid.jpg)

&#8593; [return to top](#ashR)

### Sea
![sea_grid](https://github.com/jmaasch/ashR/blob/master/figures/sea_grid.jpg)

&#8593; [return to top](#ashR)

### Earth
![earth_grid](https://github.com/jmaasch/ashR/blob/master/figures/earth_grid.jpg)

&#8593; [return to top](#ashR)

### Berry
![berry_grid](https://github.com/jmaasch/ashR/blob/master/figures/berry_grid.jpg)

&#8593; [return to top](#ashR)
