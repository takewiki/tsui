#' 撰写数据库连接组件
#'
#' @param id 内码 
#' @param label 标签
#' @param ip 地址
#' @param port 端口
#' @param user_name 用户名 
#' @param password 密码
#' @param db_name 数据库名称
#'
#' @return 返回值
#' @export
#'
#' @examples
#' library(shiny)
#' library(tsui);
#' 
#' 
#' ui <- fluidPage(
#'    
#'    
#'    titlePanel("SQL SERVER 数据库连接信息测试"),
#'    
#'    
#'    sidebarLayout(
#'       sidebarPanel(
#'          
#'          mdl_sql_conn('sql')
#'          
#'       ),
#'       
#'       mainPanel(
#'          mdl_dataTable('select')
#'       )
#'    )
#' )
#' 
#' 
#' server <- function(input, output) {
#'    
#'    con <- run_sql_common('sql');
#'    
#'    data <- reactive(
#'       {
#'          res  <- RJDBC::dbGetQuery(con(),'select top 100 * from T_GL_VOUCHER;')
#'          return(res)
#'       }
#'       
#'    )
#'    run_dataTable(proc_dataTable,id = 'select',data=data())
#'    
#'    
#' }
#' 
#' # Run the application 
#' shinyApp(ui = ui, server = server)
mdl_sql_conn <- function(id, label = "SQL Server配置信息",
                         ip='115.159.201.178',
                         port='1433',
                         user_name='sa',
                         password='88888888',
                         db_name='demo'
                         ){
   ns <- NS(id)
   tagList(
      h3(label),
      br(),
      fluidRow(
         tsui(ui_text(inputId = ns('ip'),label = 'IP地址:',value = ip,width='90%')),
         #br(),
         tsui(ui_text(inputId = ns('port'),label = '端口号:',value = port,width='90%')),
         #br(),
         tsui(ui_text(inputId = ns('user_name'),label = '用户名:',value = user_name,width='90%')),
         #br(),
         tsui(ui_password(inputId = ns('password'),label = '密码:',value = password,width='90%')),
         # br(),
         tsui(ui_text(inputId = ns('db_name'),label = '数据库名称:',value = db_name,width='90%'))
      ),
      fluidRow(
      
                actionButton(ns('done'),label = '获取连接')
      ))

}

#' 定义数据库连接的处理信息
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#'
#' @return 返回值
#' @export
#'
#' @examples
#' proc_sql_common();
proc_sql_common <- function(input,output,session) {
   
   con <-eventReactive(input$done,{
      res <- sql_conn_common(ip = input$ip,
                             port = input$port,
                             user_name =input$user_name,
                             password = input$password,
                             db_name = input$db_name
                           );
      return(res)
      
   })
     
   
   
}

#' 定义数据库连接的处理逻辑
#'
#' @param id 内码
#'
#' @return 返回值
#' @export
#'
#' @examples
#' library(shiny)
#' library(tsui);
#' 
#' 
#' ui <- fluidPage(
#'    
#'    
#'    titlePanel("SQL SERVER 数据库连接信息测试"),
#'    
#'    
#'    sidebarLayout(
#'       sidebarPanel(
#'          
#'          mdl_sql_conn('sql')
#'          
#'       ),
#'       
#'       mainPanel(
#'          mdl_dataTable('select')
#'       )
#'    )
#' )
#' 
#' 
#' server <- function(input, output) {
#'    
#'    con <- run_sql_common('sql');
#'    
#'    data <- reactive(
#'       {
#'          res  <- RJDBC::dbGetQuery(con(),'select top 100 * from T_GL_VOUCHER;')
#'          return(res)
#'       }
#'       
#'    )
#'    run_dataTable(proc_dataTable,id = 'select',data=data())
#'    
#'    
#' }
#' 
#' # Run the application 
#' shinyApp(ui = ui, server = server)
run_sql_common <- function(id) {
   callModule(proc_sql_common,id)
   
}



#' 设置mysql的连接信息
#'
#' @param id 内码
#' @param label  标签
#'
#' @return 返回值
#' @export
#'
#' @examples
#' mdl_mysql_conn();
mdl_mysql_conn <- function(id, label = "MySQL配置信息"){
   ns <- NS(id)
   tagList(
      h3(label),
      br(),
      fluidRow(
         tsui(ui_text(inputId = ns('ip'),label = 'IP地址:',value = 'localhost')),
         #br(),
         tsui(ui_text(inputId = ns('port'),label = '端口号:',value = '3306')),
         #br(),
         tsui(ui_text(inputId = ns('user_name'),label = '用户名:',value = 'root')),
         #br(),
         tsui(ui_password(inputId = ns('password'),label = '密码:',value = 'Hoolilay889@')),
         # br(),
         tsui(ui_text(inputId = ns('db_name'),label = '数据库名称:',value = 'rdkc'))
      ),
      fluidRow(
         
         actionButton(ns('done'),label = '获取连接')
      ))
   
}


#' 处理mysql的逻辑
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#'
#' @return 返回值
#' @export
#'
#' @examples proc_mysql_common();
proc_mysql_common <- function(input,output,session) {
   
   con <-eventReactive(input$done,{
      res <- tsda::mysql_conn_common(ip = input$ip,
                             port = input$port,
                             user_name =input$user_name,
                             password = input$password,
                             db_name = input$db_name
      );
      return(res)
      
   })
   
   
   
}



#' mysql的运行函数
#'
#' @param id 内码
#'
#' @return 返回值
#' @export
#'
#' @examples
#' run_myql_common();
run_myql_common <- function(id) {
   callModule(proc_mysql_common,id)
   
}


#