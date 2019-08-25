#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tsui)

# Define UI for application that draws a histogram
HeadingName <-"Old Faithful Geyser Data";
leftAreaList <- tagList( sliderInput("bins",
                                     "Number of bins:",
                                     min = 1,
                                     max = 50,
                                     value = 30),
                         fileInput('file1','文件'));
R1C1List <- tagList(fileInput('file1','文件R1C1'));
R2C1List <- tagList(fileInput('file1','文件R2C1'));


ui <- page_fluid_2R1C(HeadingName,leftAreaList,R1C1List,R2C1List);

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
