#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tsui);

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
         mdl_ListChoose1('test')
        ),

        # Show a plot of the generated distribution
        mainPanel(
           mdl_print('show')
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    data <- var_ListChoose1('test');
    observe({
        data();
        run_print('show',data())
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
