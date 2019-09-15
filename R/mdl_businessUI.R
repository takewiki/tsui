#' 从单项选择题中选择元素
#'
#' @param id 内码
#' @param label 标签
#' @param choiceNames  显示选项 
#' @param choiceValues 存储选项
#' @param selected   是否选中
#'
#' @return 返回值
#' @export
#'
#' @examples
#' mdl_ListChoose1();
mdl_ListChoose1 <- function(id,label='单项选择题',
                            choiceNames=list(icon("calendar"), icon("bed"),
                                             icon("cog"), icon("bug")),
                            choiceValues=list("calendar", "bed", "cog", "bug"),
                            selected='bed'
){
  ns <-NS(id);
  tagList(
    radioButtons(inputId = ns('mdl_ListChoose1'),label = label,
                       choiceNames=choiceNames,
                       choiceValues = choiceValues,
                       sselected = selected
    )
  )
}

#' 处理多项选择的逻辑函数
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#'
#' @return 返回值
#' @export
#'
#' @examples
#' proc_ListChoose1();
proc_ListChoose1 <- function(input,output,session){
  res <-reactive(input$mdl_ListChoose1)
  return(res);
}

#' 处理多选的变量
#'
#' @param id 内码
#'
#' @return 返回值
#' @export
#'
#' @examples
#' var_ListChoose1();
var_ListChoose1 <- function(id){
  res <- callModule(proc_ListChoose1,id)
  return(res);
}

#' 从多项选择题中选择元素
#'
#' @param id 内码
#' @param label 标签
#' @param choiceNames  显示选项 
#' @param choiceValues 存储选项
#' @param selected   是否选中
#'
#' @return 返回值
#' @export
#'
#' @examples
#' mdl_ListChooseN();
mdl_ListChooseN <- function(id,label='多项选择题',
                            choiceNames=list(icon("calendar"), icon("bed"),
                                             icon("cog"), icon("bug")),
                            choiceValues=list("calendar", "bed", "cog", "bug"),
                            selected='bed'
                           ){
  ns <-NS(id);
  tagList(
    checkboxGroupInput(inputId = ns('mdl_ListChooseN'),label = label,
                       choiceNames=choiceNames,
                       choiceValues = choiceValues,
                       selected=selected
                       )
  )
}

#' 处理多项选择的逻辑函数
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#'
#' @return 返回值
#' @export
#'
#' @examples
#' proc_ListChooseN();
proc_ListChooseN <- function(input,output,session){
  res <-reactive(input$mdl_ListChooseN)
  return(res);
}

#' 处理多选的变量
#'
#' @param id 内码
#'
#' @return 返回值
#' @export
#'
#' @examples
#' var_ListChooseN();
var_ListChooseN <- function(id){
  res <- callModule(proc_ListChooseN,id)
  return(res);
}