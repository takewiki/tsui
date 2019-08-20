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
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           mdl_dataTable('dt1')
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

 run_dataTable(proc_func = proc_dataTable,id = 'dt1',data = data.frame(letters,LETTERS))
}

# Run the application 
shinyApp(ui = ui, server = server)
