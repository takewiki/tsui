#' 处理编辑器模块
#'
#' @param id 内码
#' @param label 标签
#' @param is.test  是否测试
#' @param value  默认值
#' @param fontSize 字体大小
#' @param theme 主题编号
#' @param height 默认编码器高级
#'
#' @return 返回值
#' @import shinyAce
#' @import shiny
#' @export
#'
#' @examples
#' mdl_textEditor();
mdl_textEditor <- function(id,label='多行文本编码器输入：',is.test=FALSE,
                           value=c('文本编码器测试\n测试换行'),
                           fontSize =16,
                           theme=10,
                           height='200px'
                           ){
  ns <- NS(id)
  if (is.test == FALSE){
    tagList(
      h3(label),
      br(),
      aceEditor(ns("mdl_textEditor"), mode="r", 
                value=value,
                fontSize = fontSize,
                theme =getAceThemes()[theme] ,height = height)
    )
    
  }else{
    tagList(
      h3(label),
      br(),
      aceEditor(ns("mdl_textEditor"), mode="r", 
                value=value,
                fontSize = fontSize,
                theme =getAceThemes()[theme] ,height = height),
      verbatimTextOutput(ns("test_textEditor"))
    )
  }
}

#' 将编码器的文本转化为字符向量
#'
#' @param text 文本
#'
#' @return 返回值
#'
#' @examples
#' editor_char()
editor_char <- function(text){
  res <-strsplit(text,"\n");
  res <- res[[1]]
  return(res);
}

#' 处理文本编码器的计算逻辑
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#'
#' @return 返回值
#' @export
#'
#' @examples
#' proc_textEditor();
proc_textEditor <- function(input,output,session) {
  
  res <- reactive(editor_char(input$mdl_textEditor));
  return(res);
  
}


#' 处理文本编辑器
#'
#' @param id 内码
#'
#' @return 返回值
#' @export
#'
#' @examples
#' run_textEditor();
run_textEditor <- function(id) {
  callModule(proc_textEditor,id)
  
}





#' 处理查询组件
#'
#' @param id 内码
#' @param label 标签
#' @param value 默认值
#' @param fontSize 字体大小
#' @param theme 主题
#' @param height 高度
#'
#' @return 返回值
#' @export
#'
#' @examples
#' mdl_sql_query();
mdl_sql_query <- function(id,label='SQL查询分析器：',
                           value=c('select * \n from t_item;'),
                           fontSize =16,
                           theme=10,
                           height='300px'
){
  ns <- NS(id)
  #设置为中文
  options(DT.options = list(
    searchHighlight = TRUE,
    language = list(
      info = '显示第_START_ 至 _END_ 项结果，共 _TOTAL_ 项',
      search = '搜索:',
      paginate = list(previous = '上页', `next` = '下页'),
      lengthMenu = '显示 _MENU_ 项结果')))
  #构建组件

    tagList(
      fluidRow(
        column(width = 4,
               h3(label),
               br(),
               aceEditor(ns("mdl_textEditor"), mode="r", 
                         value=value,
                         fontSize = fontSize,
                         theme =getAceThemes()[theme] ,height = height),
               actionButton(ns('exec'),label = '执行查询')
               ),
        column(width=8,
               DT::dataTableOutput(outputId = ns('mdl_dataTable'))
               )
      )
      
    )
    
  
}


#' 定义查询分析器的逻辑处理单元
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#' @param conn 连接
#'
#' @return 返回值
#' @export
#'
#' @examples
#' proc_sql_query();
proc_sql_query <- function(input,output,session,conn){
  select_str <-reactive( paste(editor_char(input$mdl_textEditor),collapse = " ")) 
 
  data <-eventReactive(input$exec,{
    res <- tsda::sql_select(conn,select_str());
    return(res);
  })
  output$mdl_dataTable <-DT::renderDataTable(data())
  
}


#' 定义查询分析器的处理单元
#'
#' @param id 内码
#' @param conn 连接
#'
#' @return 返回值
#' @export
#'
#' @examples
#' run_sql_query();
run_sql_query <- function(id,conn) {
  callModule(proc_sql_query,id,conn);
  
}