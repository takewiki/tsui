# 1. 文本类型基础控件-----
# 1.01 编写模块化的文本字段 for text ------
#' 编写模块化的文本字段
#'
#' @param id  内码字段
#' @param label 标签字段
#' @param is.test 是否测试模式
#'
#' @return 返回值
#' @export
#'
#' @examples
#' 示例1 shiny应用程序: 
#' library(shiny);
#' library(tsui);
#' ui <- fluidPage(
#'  mdl_text('text1',label = '姓名',is.test = T),
#'  mdl_text('text2',label = '密码',is.test = T)
#' )
#' 
#' server <- function(input, output, session) {
#'  run_text_test('text1')
#'  run_text_test('text2')
#'  
#' }
#'
#' shinyApp(ui, server)
mdl_text <- function(id, label = "文本",is.test=FALSE) {
  ns <- NS(id)
  if (is.test == FALSE){
    tagList(
      tsui(ui_text(inputId = ns("mdl_text"),label = label))
    )
    
  }else{
    tagList(
      tsui(ui_text(inputId = ns("mdl_text"),label = label)),
      verbatimTextOutput(ns("test_text"))
    )
  }

}

#' 定义通过的text处理模板
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#'
#' @return  返回值
#' @export
#'
#' @examples
#' proc_text();
proc_text <- function(input, output, session) {
  
  # code here
  res <- TRUE;
  return(res);
  
}

#' 指定text运行处理函数
#'
#' @param proc_func 逻辑函数
#' @param id  input对应的id
#'
#' @return 返回值
#' @export
#'
#' @examples
#'run_text();
run_text <-function(proc_func,id){
  callModule(proc_func, id)
}
#' 定义一个测试的text处理输入
#'
#' @param input 输入
#' @param output 输出
#' @param session  会话
#'
#' @return 返回值
#' @export
#'
#' @examples
#' test_text();
test_text <- function(input, output, session) {
  
  output$test_text <- renderText({
    input$mdl_text
  })

}







#' 测试相应的组织是否完好
#'
#' @param id 输入相应的id
#'
#' @return 返回值
#' @export
#'
#' @examples
#' run_text_test()
run_text_test <- function(id) {
  run_text(test_text,id)
}

#1.02 处理密码类型的字段------
#' 处理密码控件
#'
#' @param id 密码ID
#' @param label 标签名称
#' @param is.test 是否测试
#'
#' @return 返回值
#' @export
#'
#' @examples
#' library(shiny);
#' library(tsui);
#' test_tsui(mdl_password,'123',label = '密码:',f_test = run_password_test);
mdl_password <- function(id, label = "密码",is.test=FALSE) {
  
  ns <- NS(id)
  if (is.test == FALSE){
    tagList(
      tsui(ui_password(inputId = ns("mdl_password"),label = label))
    )
    
  }else{
    tagList(
      tsui(ui_password(inputId = ns("mdl_password"),label = label)),
      verbatimTextOutput(ns("test_password"))
    )
  }
  
}

#' 定义处理密码字段的控件
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#'
#' @return 返回值
#' @export
#'
#' @examples
#' proc_password();
proc_password <- function(input, output, session) {
  
  # code here
  #input$mdl_password
  #output$test_password
  res <- TRUE;
  return(res);
  
}

#' 定义处理密码的逻辑函数
#'
#' @param proc_func 逻辑函数名
#' @param id inputID
#'
#' @return 返回值
#' @export
#'
#' @examples
#' run_password();
run_password <-function(proc_func,id){
  callModule(proc_func, id)
}

#' 定义处理密码字段的逻辑
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#'
#' @return 返回值
#' @export
#'
#' @examples
#' test_password();
test_password <- function(input, output, session) {
  
  output$test_password <- renderText({
    input$mdl_password
  })
  
}


#' 定义处理密码的演示逻辑
#'
#' @param id 输入密码控件ID
#'
#' @return 返回值
#' @export
#'
#' @examples
#' run_password_test();
run_password_test <- function(id) {
  run_password(test_password,id)
}


