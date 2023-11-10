# mtcars Dashboard

**Created by: Aviral Sharma [20BCE2918]**

This dashboard is built using R with Flexdashboard and Shiny. It visualizes data from the mtcars dataset, showcasing various plots and interactive features.

## Table of Contents

1. [Introduction](#introduction)
2. [Getting Started](#getting-started)
3. [Pages Overview](#pages-overview)
   - [Page 1](#page-1)
   - [Page 2](#page-2)
   - [Page 3](#page-3)
   - [Page 4](#page-4)
   - [Page 5](#page-5)

## Introduction

This dashboard provides visual insights into the mtcars dataset, exploring relationships between different variables using interactive plots and charts. It leverages Flexdashboard for layout and Shiny for interactivity.

## Getting Started

To run this dashboard locally, make sure you have R and the required packages installed. You can install the necessary packages by running the following commands in your R console:

```R
install.packages(c("flexdashboard", "tidyverse", "shiny", "plotly", "ggplot2", "colourpicker"))
```

After installing the required packages, open the R script in your preferred editor or IDE. Execute the script to launch the dashboard locally.

## Pages Overview

### Page 1

This page displays two plots:

- Scatter plot of Miles per Gallon vs. Weight
- Bar chart showing the number of cars by cylinder

### Page 2

This page contains a tabset with two tabs:

- Tab1: Line chart depicting Displacement vs. Miles per Gallon by Cylinder
- Tab2: Boxplot showing Horsepower Distribution by Gear

### Page 3

This page features a plot allowing users to explore Horsepower Distribution by Gear for a selected cylinder. A radio button is provided to choose the cylinder.

### Page 4

A bar chart illustrating the mean of a selected variable by gear. Users can choose the variable using a dropdown menu.

### Page 5

This page includes a scatter plot of Horsepower vs. Miles per Gallon for a selected cylinder. Users can choose the cylinder using a slider and the color using a color picker.
