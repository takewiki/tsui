library(shiny)
library(tsui);
library(tsda);


ui <- fluidPage(
    
    
    titlePanel(" My SQL数据库连接信息测试"),
    
    
    sidebarLayout(
        sidebarPanel(
            
            mdl_mysql_conn('sql')
            
        ),
        
        mainPanel(
            mdl_dataTable('select')
        )
    )
)


server <- function(input, output) {
    
    con <- tsui::run_myql_common('sql');
    
    data <- reactive(
        {
            res  <- RJDBC::dbGetQuery(con(),'select * from  tsuser;')
            return(res)
        }
        
    )
    run_dataTable(proc_dataTable,id = 'select',data=data())
    
    
}

# Run the application 
shinyApp(ui = ui, server = server)