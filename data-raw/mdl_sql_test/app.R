library(shiny)
library(tsui);


ui <- fluidPage(
    
    
    titlePanel("SQL SERVER 数据库连接信息测试"),
    
    
    sidebarLayout(
        sidebarPanel(
            
            mdl_sql_conn('sql')
            
        ),
        
        mainPanel(
            mdl_dataTable('select')
        )
    )
)


server <- function(input, output) {
    
    con <- run_sql_common('sql');
    
    data <- reactive(
        {
            res  <- RJDBC::dbGetQuery(con(),'select top 100 * from T_GL_VOUCHER;')
            return(res)
        }
        
    )
    run_dataTable(proc_dataTable,id = 'select',data=data())
    
    
}

# Run the application 
shinyApp(ui = ui, server = server)