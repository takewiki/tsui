#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
          mdl_logical('lg','逻辑测试')
    
        ),

        # Show a plot of the generated distribution
        mainPanel(
          
           verbatimTextOutput('bb')
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

  data2 <- var_logical('lg')

  output$bb <-renderPrint({
      data2();
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
