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

<img src="https://github.com/jmaasch/ashR/blob/master/figures/base_scatterplot.jpg" width="400" align="right"/>

### Use with base R

The following reproducible example produces the plot below.


```r

x <- rnorm(800)
y <- rnorm(800) 

plot(x, 
     y, 
     xlab = "",
     ylab = "",
     main = "Autumn 1.3", 
     col = ashR.autumn("1.3"), 
     pch = c(17, 18, 19))

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
