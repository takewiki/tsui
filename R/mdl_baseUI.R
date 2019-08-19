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



#3. 处理日期字段------

#3.1 单个日期字段-----
#' 处理日期字段
#'
#' @param id  id
#' @param label  标签
#' @param is.test 是否测试
#' @param value  默认值
#'
#' @return 返回值
#' @export
#'
#' @examples
#' mdl_date();
#' library(tsui);
#' library(shiny);
#' test_tsui(mdl_date,id='date1','日期',run_date_test);

mdl_date <- function(id,label='日期',is.test=FALSE,value=Sys.Date()) {
  ns <- NS(id)
  if (is.test == FALSE){
    tagList(
    tsui(input.date(Id = ns('mdl_date'),label = label,value = value))  
    )
    
  }else{
    tagList(
      tsui(input.date(Id = ns('mdl_date'),label = label,value = value)) 
      ,
      verbatimTextOutput(ns("test_date"))
    )
  }
  
}

#' 处理日期的逻辑框架
#'
#' @param input   输入
#' @param output  输出
#' @param session  会话
#'
#' @return 返回值
#' @export
#'
#' @examples
#' proc_date();
proc_date <- function(input, output, session) {
  
  # code here
  #input$mdl_date
  #output$test_date
  res <- TRUE;
  return(res);
  
}

#' 处理日期字段
#'
#' @param proc_func  日期处理逻辑
#' @param id 内码
#'
#' @return 返回值
#' @export
#'
#' @examples
#' run_date();
run_date <-function(proc_func,id){
  callModule(proc_func, id)
}

#' 处理日期字段
#'
#' @param input 输入 
#' @param output 输出
#' @param session 会话
#'
#' @return 返回值
#' @export
#'
#' @examples
#' test_date();
test_date <- function(input, output, session) {
  
  output$test_date <- renderText({
    as.character(input$mdl_date)
  })
  
}

#' 日期字段测试
#'
#' @param id  内码 
#'
#' @return 返回值
#' @export
#'
#' @examples
#' run_date_test();
run_date_test <- function(id) {
  run_date(test_date,id)
}

#3.2 两个日期字段------

#' 处理日期范围字段
#'
#' @param id 内码
#' @param label 标签
#' @param is.test 是否测试
#' @param startDate 开始日期
#' @param endDate  结束日期
#'
#' @return 返回值
#' @export
#'
#' @examples
#' mdl_dateRange();
mdl_dateRange <- function(id,
                          label='日期范围',
                          is.test=FALSE,
                          startDate=Sys.Date(),
                          endDate=Sys.Date()+14) {
  ns <- NS(id)
  if (is.test == FALSE){
    tagList(
      tsui(input.dateRange(Id = ns('mdl_dateRange'),label = label,start = startDate,end = endDate))
    )
    
  }else{
    tagList(
      tsui(input.dateRange(Id = ns('mdl_dateRange'),label = label,start = startDate,end = endDate))
      ,
      verbatimTextOutput(ns("test_dateRange"))
    )
  }
  
}
#' 处理日期的逻辑框架
#'
#' @param input   输入
#' @param output  输出
#' @param session  会话
#'
#' @return 返回值
#' @export
#'
#' @examples
#' proc_dateRange();
proc_dateRange <- function(input, output, session) {
  
  # code here
  #input$mdl_dateRange
  #output$test_dateRange
  res <- TRUE;
  return(res);
  
}

#' 处理日期字段
#'
#' @param proc_func  日期处理逻辑
#' @param id 内码
#'
#' @return 返回值
#' @export
#'
#' @examples
#' run_dateRange();
run_dateRange <-function(proc_func,id){
  callModule(proc_func, id)
}

#' 处理日期字段
#'
#' @param input 输入 
#' @param output 输出
#' @param session 会话
#'
#' @return 返回值
#' @export
#'
#' @examples
#' test_dateRange();
test_dateRange <- function(input, output, session) {
  
  output$test_dateRange <- renderText({
    res <-as.character(input$mdl_dateRange)
    txt <- paste('日期从',res[1],'到',res[2],sep = " ")
  })
  
}

#' 日期字段测试
#'
#' @param id  内码 
#'
#' @return 返回值
#' @export
#'
#' @examples
#' run_date_test();
run_dateRange_test <- function(id) {
  run_dateRange(test_dateRange,id)
}


# 4.处理文件-----
# 4.1 处理一个文件----
#' 处理单一文件控制
#'
#' @param id  内码
#' @param label 标签
#' @param is.test 是否测试
#' @param fileType 文件后缀类型xlsx
#'
#' @return 返回值
#' @export
#'
#' @examples
#' mdl_file();
mdl_file <- function(id,label='单文件选择器：',is.test=FALSE,fileType='.xlsx') {
  ns <- NS(id)
  if (is.test == FALSE){
    tagList(
      tsui(input.file(Id = ns("mdl_file"),
                      label = label,
                      width = '100%',
                      multiple = FALSE,
                      accept = fileType,
                      buttonLabel = '请选择一个文件...'))
    )
    
  }else{
    tagList(
      tsui(input.file(Id = ns("mdl_file"),
                      label = label,
                      width = '100%',
                      multiple = FALSE,
                      accept = fileType,
                      buttonLabel = '请选择一个文件...'))
      ,
      verbatimTextOutput(ns("test_file"))
    )
  }  
  
}

#' 处理单个文件逻辑
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#'
#' @return 返回值
#' @export
#'
#' @examples
#' proc_file();
proc_file <- function(input, output, session) {
  
  # code here
  #input$mdl_file
  #output$test_file
  res <- TRUE;
  return(res);
  
}

#' 处理文件执行逻辑
#'
#' @param proc_func 逻辑函数 
#' @param id 内码 
#'
#' @return 返回值
#' @export
#'
#' @examples
#' run_file();
run_file <-function(proc_func,id){
  callModule(proc_func, id)
}


#' 测试文件
#'
#' @param input 输入 
#' @param output 输出
#' @param session 会话
#'
#' @return 返回值
#' @export
#'
#' @examples
#' test_file();
test_file <- function(input, output, session) {
  
  output$test_file <- renderText({
    input$mdl_file$datapath;
  })
  
}

#' 建立一个测试示例
#'
#' @param id 内码
#'
#' @return 返回值
#' @export
#'
#' @examples 
#' run_file_test();
run_file_test <- function(id) {
  run_file(test_file,id)
}


# 4.2 处理多个文件-----
#' 多个文件上传处理器
#'
#' @param id 内码
#' @param label 标签
#' @param is.test 是否测试
#' @param fileType 文件类型
#'
#' @return 返回值
#' @export
#'
#' @examples
#' mdl_files();
mdl_files <- function(id,label='多文件选择器：',is.test=FALSE,fileType='.xlsx') {
  ns <- NS(id)
  if (is.test == FALSE){
    tagList(
      tsui(input.file(Id = ns("mdl_files"),
                      label = label,
                      width = '100%',
                      multiple = TRUE,
                      accept = fileType,
                      buttonLabel = '请选择多个文件...'))
    )
    
  }else{
    tagList(
      tsui(input.file(Id = ns("mdl_files"),
                      label = label,
                      width = '100%',
                      multiple = TRUE,
                      accept = fileType,
                      buttonLabel = '请选择多个文件...'))
      ,
      verbatimTextOutput(ns("test_files"))
    )
  }    
  
}

#' 撰写逻辑处理通用框架
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#'
#' @return 返回值
#' @export
#'
#' @examples
#' proc_files();
proc_files <- function(input, output, session) {
  
  # code here
  #input$mdl_files
  #output$test_files
  res <- TRUE;
  return(res);
  
}

#' 运行模块调用逻辑
#'
#' @param proc_func 处理逻辑 
#' @param id 内码
#'
#' @return 返回值
#' @export
#'
#' @examples
#' run_files();
run_files <-function(proc_func,id){
  callModule(proc_func, id)
}


#' 测试多个文件的处理
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#'
#' @return 返回值
#' @export
#'
#' @examples
#' test_files();
test_files <- function(input, output, session) {
  
  output$test_files <- renderText({
    # input$mdl_files是一个数据框，这样可以理解相应的数据结构及方法处理
    #文件真实存放路径
    files <-input$mdl_files$datapath;
    #文件名
    names <-input$mdl_files$name;
    #文件大小
    sizes <- input$mdl_files$size;
    paste(names,sizes,files,sep=" ",collapse = '\n')
    
  
  })
  
}

#' 运行测试数据
#'
#' @param id  内码 
#'
#' @return 返回值
#' @export
#'
#' @examples
#' run_files_test();
run_files_test <- function(id) {
  run_files(test_files,id)
}

