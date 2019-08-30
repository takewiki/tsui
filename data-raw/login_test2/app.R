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
ui <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
          mdl_login('nslogin')
        ),

        # Show a plot of the generated distribution
        mainPanel(
           verbatimTextOutput('show')
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

 data <- run_login('nslogin');
 output$show <- renderPrint({
     data();
 })
}

# Run the application 
shinyApp(ui = ui, server = server)
