

#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(tidycensus)


# Define UI for application that draws a histogram
ui <- navbarPage(
    "Final Project Title",
    tabPanel("Model",
             fluidPage(
                 titlePanel("Model Title"),
                 sidebarLayout(
                     sidebarPanel(
                         selectInput(
                             "plot_type",
                             "Plot Type",
                             c("0-19 First Dose" = "a", "Total First Dose" = "b")
                         )),
                     mainPanel(imageOutput("map")))
             )),
    tabPanel("Discussion",
             titlePanel("Discussion Title"),
             p("Tour of the modeling choices you made and 
              an explanation of why you made them")),
    tabPanel("About", 
             titlePanel("About"),
             h3("In this project I sought to uncover the connection between socio-economic status and vaccination rate. I am using Israel as a case study, as it is the country with the largest number of vaccinated per population and there is a lot of importance in studying this considering other countries will face similar issues with vaccination and methods to incentivise lower income households and minorities to obtain a vaccine is relevant and important in combating the pandemic."),
             p("My project has been an interesting challange. I have so far shown two plots, one which shows the cumillative in crease in vaccine rates for different areas, the second is a posterior for the likelyhood that any 50 year old is vaccinated or not yet."),
             h3("Planning more regressions when I start to work with the population and economic data."),
             p("My name is Shai-Li and I study at Harvard College. 
             You can reach me at shailiron@college.harvard.edu.")))

# Define server logic required to draw a histogram
server <- function(input, output) {
    output$map <- renderImage({
        list(src = 'map.png',
             width = 500,
             height = 500,
             alt = "Map")
    }, deleteFile = FALSE)
}




server <- function(input, output) {
    
    output$map <- renderImage({
        if(input$plot_type == "a"){            
            list(
                src = "test_plot.png",
                width = 500,
                height = 500,
                alt = "19 year olds")
        }                                        
        else if(input$plot_type == "b"){
            list(
                src = "posterior_plot.png",
                width = 500,
                height = 500,
                alt = "Posterior")
        }
    })
}


# Run the application 
shinyApp(ui = ui, server = server)





