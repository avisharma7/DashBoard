---
title: "mtcars dashboard created by Aviral Sharma [20BCE2918]"
output: 
  flexdashboard::flex_dashboard:
    orientation: columns
    vertical_layout: fill
    runtime: shiny
    output: html_document
---

```{r setup, include=FALSE}
library(flexdashboard)
library(tidyverse)
library(shiny)
library(dplyr)
library(plotly)
library(ggplot2)
library(colourpicker)
library(datasets)
data(mtcars)
```

Page 1
===
column 1 {data-width 400} 
----
```{r}
renderPlot({
  ggplot(mtcars, aes(x = mpg, y = wt)) +
    geom_point() +
    ggtitle("Miles per Gallon vs. Weight")
})

```

column 2 {data-width 500}
---
```{r}
renderPlot({
  ggplot(mtcars, aes(x = factor(cyl), fill = factor(cyl))) +
    geom_bar() +
    ggtitle("Number of Cars by Cylinder")
})

```



page 2
===
Column {data-width=400, .tabset}
-----------------------------------------------------------------------
### Tab1
```{r}
renderPlot({
  ggplot(mtcars, aes(x = disp, y = mpg, group = factor(cyl), color = factor(cyl))) +
    geom_line() +
    ggtitle("Displacement vs. Miles per Gallon by Cylinder")
})

```

### Tab2
```{r}
renderPlot({
  ggplot(mtcars, aes(x = factor(gear), y = hp, fill = factor(gear))) +
    geom_boxplot() +
    ggtitle("Horsepower Distribution by Gear")
})

```

page 3
===
column 1 {data-width 700}
---

```{r}
## Visualization
radioButtons("cyl_radio", label = "Select Cylinder:", choices = unique(mtcars$cyl), selected = 4)

renderPlot({
  selected_cyl <- input$cyl_radio
  ggplot(mtcars %>% filter(cyl == selected_cyl), aes(x = hp, fill = factor(gear))) +
    geom_histogram(binwidth = 20, position = "dodge", color = "black", alpha = 0.7) +
    facet_wrap(~factor(gear), scales = "free_y") +
    ggtitle(paste("Horsepower Distribution by Gear for Cylinder", selected_cyl))
})

```


page 4
===
```{r}
dropdown_choices <- names(mtcars)

selectInput("var_dropdown", label = "Select Variable:", choices = dropdown_choices)

renderPlot({
  selected_var <- input$var_dropdown
  ggplot(mtcars, aes(x = factor(gear), y = get(selected_var))) +
    geom_bar(stat = "summary", fun = "mean", fill = "orange") +
    ggtitle(paste("Mean", selected_var, "by Gear"))
})

```



page 5
===
column {data-width=700}
---

```{r}
sliderInput("cyl_slider", label = "Select Cylinder:", min = min(mtcars$cyl), max = max(mtcars$cyl), value = min(mtcars$cyl), step = 1)

colourInput("col_picker", "Choose Colour", "blue")

# Reactive variable to store the selected color
selected_col <- reactive({
  input$col_picker
})

renderPlot({
  selected_cyl_slider <- input$cyl_slider
  ggplot(mtcars %>% filter(cyl == selected_cyl_slider), aes(x = hp, y = mpg, color = selected_col())) +
    geom_point() +
    ggtitle(paste("Horsepower vs. Miles per Gallon for Cylinder", selected_cyl_slider))
})

```






