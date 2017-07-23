#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
#
#

library(shiny)

# Define UI for application that draws a histogram


shinyUI(bootstrapPage(

sidebarLayout(
  sidebarPanel(height = "100%",


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
                  value = FALSE)
  ),
  mainPanel(

    plotOutput(outputId = "main_plot", height = "300px"),

    # Display this only if the density is shown
    conditionalPanel(condition = "input.density == true",
                     sliderInput(inputId = "bw_adjust",
                                 label = "Bandwidth adjustment:",
                                 min = 0.2, max = 2, value = 1, step = 0.2)

    ),

    h3("App Documentation"),

    h4("App Description"),

    h5("This section of this document accompanies the Week 4 Project for the Shiny App.
    This simple app displays histograms of the four different air quality indicators in the airquality dataset that comes with the r installation."),

    h5("The user can interact with the app by selecting from any of the four air quality options from the dropdown list. S/he can select the number of columns to display in each histogram, can use a checkbox to toggle between displaying individual data points on the x-axis."),

    h4("Inputs"),

    h5("* Air quality options dropdown list with four options (Ozone, Solar.R, Wind and Temp"),

    h5("* Number of columns to display in the histogram; a dropdown list to select from."),

    h5("* A checkbox for user to chose whether to display individual data points or not."),

    h4("Outputs"),

    h5("The app's output consists of:"),

    h5("* Histograms for each of the four air quality options (Ozone, Solar.R, Wind and Temp) - depending on the option selected."),

    h5("* Histograms with varying number of columns, ddepending on the number seleccted from the dropdown list."),

    h5("* Histograms with the individual data points indicated on the x-axis.")

  )
 )

))


