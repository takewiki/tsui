#' 处理数据
#'
#' @param id 内码 
#' @param label 文件
#' @param value 值
#' @param is.test 是否测试
#'
#' @return 返回值
#' @export
#'
#' @examples
#' mdl_text2
mdl_text2 <-function(id, label = "文本",value='',is.test=FALSE) {
  ns <- NS(id)
  if (is.test == FALSE){
    tagList(
      tsui(ui_text(inputId = ns("mdl_text"),label = label,value = value))
    )
    
  }else{
    tagList(
      tsui(ui_text(inputId = ns("mdl_text"),label = label)),
      verbatimTextOutput(ns("test_text"))
    )
  }
  
}