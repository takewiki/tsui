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

# 2. 处理数值字段--------
# 2.1 处理小数类型的字段-----

#' 处理小数型字段处理
#'
#' @param id ID
#' @param label  名称
#' @param is.test 是否测试
#' @param value 默认值
#' @param min 最小值
#' @param max 最大值
#' @param step 步长
#' @param width 宽度
#'
#' @return 返回值
#' @export
#'
#' @examples
#' library(shiny);
#' library(tsui);
#' test_tsui(mdl_numeric,id='num1','小数',run_numeric_test);
mdl_numeric <- function(id, label = "小数",is.test=FALSE,value=10,min=0,max=30,step=0.5,width="100%") {
  ns <- NS(id)
  if (is.test == FALSE){
    tagList(
      tsui(input.numeric(Id = ns('mdl_numeric'),label = label,value = value,min = min,max = max,step = step,width = width))
    )
    
  }else{
    tagList(
      tsui(input.numeric(Id = ns('mdl_numeric'),label = label,value = value,min = min,max = max,step = step,width = width))
    ,
      verbatimTextOutput(ns("test_numeric"))
    )
  }
  
}


#' 定义函数的处理逻辑
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#'
#' @return 返回值
#' @export
#'
#' @examples
#' proc_numeric();
proc_numeric <- function(input, output, session) {
  
  # code here
  #input$mdl_numeric
  #output$test_numeric
  res <- TRUE;
  return(res);
  
}

#' 定义相应的处理函数
#'
#' @param proc_func 逻辑函数
#' @param id ID
#'
#' @return 返回值
#' @export
#'
#' @examples
#' run_numeric();
run_numeric <-function(proc_func,id){
  callModule(proc_func, id)
}


#' 定义numeric测试逻辑
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#'
#' @return 返回值
#' @export
#'
#' @examples
#' test_numeric();
test_numeric <- function(input, output, session) {
  
  output$test_numeric <- renderText({
    input$mdl_numeric
  })
  
}

#' 处理相关的演示
#'
#' @param id id
#'
#' @return 返回值
#' @export
#'
#' @examples
#' run_numeric_test();
run_numeric_test <- function(id) {
  run_numeric(test_numeric,id)
}

# 2.2 处理整数类型的字段------
#' 处理整数控件
#'
#' @param id  id
#' @param label 标签
#' @param min 最小值
#' @param max 最大值
#' @param value 默认值
#' @param step 步长1
#' @param round 小数位
#' @param width 宽度
#' @param is.test 是否测试
#'
#' @return 返回值
#' @export
#'
#' @examples
#' library(shiny);
#' library(tsui);
#' test_tsui(mdl_integer,id='int1','整数',run_integer_test);
mdl_integer <- function(id,label='整数',is.test=FALSE,min=0,max=10,value=3,step=1,round=0L,width='100%') {

  ns <- NS(id)
  if (is.test == FALSE){
    tagList(
      tsui(input.slider(Id = ns('mdl_integer'),label = label,min = min,max = max,value = value,step = step,round = round,width = width))
    )
    
  }else{
    tagList(
      tsui(input.slider(Id = ns('mdl_integer'),label = label,min = min,max = max,value = value,step = step,round = round,width = width))
      ,
      verbatimTextOutput(ns("test_integer"))
    )
  }
  
}

#' 处理整数的处理逻辑
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#'
#' @return 返回值
#' @export
#'
#' @examples
#' proc_integer();
proc_integer <- function(input, output, session) {
  
  # code here
  #input$mdl_integer
  #output$test_integer
  res <- TRUE;
  return(res);
  
}

#' 处理整数的函数
#'
#' @param proc_func 函数
#' @param id id
#'
#' @return 返回值
#' @export
#'
#' @examples
#' run_integer();
run_integer <-function(proc_func,id){
  callModule(proc_func, id)
}

#' 定义示例的整数处理逻辑
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#'
#' @return 返回值
#' @export
#'
#' @examples
#' test_integer();
test_integer <- function(input, output, session) {
  
  output$test_integer <- renderText({
    input$mdl_integer
  })
  
}


#' 处理整数演示调用函数
#'
#' @param id id
#'
#' @return 返回值
#' @export
#'
#' @examples
#' run_integer_test();
run_integer_test <- function(id) {
  run_numeric(test_integer,id)
}

