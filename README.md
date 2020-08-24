# `ashR`

`ashR` (ash-er): Bespoke interpolated color palettes for data visualization in R.

Author: JRMA Maasch (2020).

## About

This package provides made-to-order discrete color palettes in an interpolated range. These low-contrast color palettes are intended for use cases in which subtle variation is desired. **Note: This package is currently under development.**

Bespoke color palette packages can expedite data visualization tasks. If you would like your own bespoke package, message me at www.linkedin.com/in/jmaasch.

*Note on accessibility: These color palettes were customized for use by a color-blind data scientist, though we cannot guarantee usefulness for all color-blind individuals.*

### Table of contents

* **[Usage](#Usage)** | [Installation](#Installation) | [View documentation](#View-documentation)
* **[View demo plots](#View-demo-plots)**

## Usage

### Installation

```R
# Install development version.
# Note: the package devtools must be installed but need not be loaded.
devtools::install_github("jmaasch/ashR")

# Load package.
library(ashR)
```

### View documentation

Precede any function by a question mark to access description, arguments, return value, and usage suggestions.

```R
# Access function documentation.
?ashR.autumn()
```

## View demo plots

### Autumn
![autumn_grid](https://github.com/jmaasch/ashR/blob/master/figures/autumn_grid.jpg)

### Sea
![sea_grid](https://github.com/jmaasch/ashR/blob/master/figures/sea_grid.jpg)

### Earth
![earth_grid](https://github.com/jmaasch/ashR/blob/master/figures/earth_grid.jpg)

### Berry
![berry_grid](https://github.com/jmaasch/ashR/blob/master/figures/berry_grid.jpg)
