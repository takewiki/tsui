#' 定义test_tsui的测试函数
#'
#' @param f input_func
#' @param id id
#' @param label 标签 
#' @param f_test 逻辑test函数
#'
#' @return 返回值
#' @import shiny
#' @export
#'
#' @examples
#' test_tsui();
test_tsui <- function(f,id,label,f_test) {
  ui <- fluidPage(
    f(id,label = label,is.test = T)
  )
  
  server <- function(input, output, session) {
    f_test(id)
  
    
  }
  
  shinyApp(ui, server)
  
}


#' 写入日志信息
#'
#' @param app_id 程序名称 
#' @param info 信息
#'
#' @return 返回值
#' @export
#'
#' @examples
#' log_it
log_it <- function(app_id,info) {
  #时间字符串
  time_str <- as.character(Sys.time())
  res <- paste(app_id,"于",time_str,":",info)
  print(res)
  
}
