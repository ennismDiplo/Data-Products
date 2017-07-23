#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
#
#

library(shiny)

# Define UI for application that draws a histogram


shinyUI(bootstrapPage(
    selectInput(inputId = "aq_indicator",
                label = "Air Quality Indicator Options:",
                choices = c("Ozone", "Solar.R", "Wind", "Temp"),
                selected = "Solar.R"),

    selectInput(inputId = "n_breaks",
                label = "Number of columns in histogram:",
                choices = c(10, 20, 30, 40, 50),
                selected = 20),

    checkboxInput(inputId = "individual_obs",
                  label = strong("Display individual observations"),
                  value = FALSE),

    plotOutput(outputId = "main_plot", height = "300px"),

    # Display this only if the density is shown
    conditionalPanel(condition = "input.density == true",
                     sliderInput(inputId = "bw_adjust",
                                 label = "Bandwidth adjustment:",
                                 min = 0.2, max = 2, value = 1, step = 0.2)
    )

))


