#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
# Remove NAs

airquality <- data.frame(airquality, na.rm = TRUE)

# Define server logic required to draw a histogram


shinyServer(function(input, output) {

    color <- c("red", "blue", "green", "yellow", "orange", "pink")

    output$main_plot <- renderPlot({
     if(input$aq_indicator == "Ozone"){
         hist(airquality$Ozone,
              probability = TRUE,
              breaks = as.numeric(input$n_breaks),
              xlab = "Ozone Levels", col = color,
              main = "Air Quality - Ozone Levels")
        }
        if(input$aq_indicator == "Solar.R"){
            hist(airquality$Solar.R,
                 probability = TRUE,
                 breaks = as.numeric(input$n_breaks),
                 xlab = "Solar Radiation Levels", col = color,
                 main = "Air Quality - Solar Radiation Levels")
        }

        if(input$aq_indicator == "Wind"){
            hist(airquality$Wind,
                 probability = TRUE,
                 breaks = as.numeric(input$n_breaks),
                 xlab = "Wind Levels", col = color,
                 main = "Air Quality - Wind Levels")
        }

        if(input$aq_indicator == "Temp"){
            hist(airquality$Temp,
                 probability = TRUE,
                 breaks = as.numeric(input$n_breaks),
                 xlab = "Temperature Levels", col = color,
                 main = "Air Quality - Temperature Levels")
        }


        if (input$individual_obs) {
            rug(airquality$Solar.R)
        }
    })
})

