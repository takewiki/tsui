#1.处理输出控件------
#1.1 处理下载按纽-----
#' 测试下载按钮
#'
#' @param id 内码
#' @param label 标签
#'
#' @return 返回值
#' @export
#'
#' @examples
#' mdl_download_button();
mdl_download_button <- function(id,label) {
  ns <- NS(id)
  tagList(
     tsui(input.button.download(Id = ns("mdl_download_button"),
                                label = label))
    )
    
 
  
}


#' 编写处理逻辑的框架
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#' @param data  需要下载的数据R对象
#' @param filename 文件名
#' @param func 处理函数
#'
#' @return 返回值
#' @import openxlsx
#' @export
#'
#' @examples
#' proc_download_button();
proc_download_button <- function(input, output, session,data=iris,filename='下载文件.xlsx',func=write.xlsx) {
  
  output$mdl_download_button <- downloadHandler(filename = filename,
                                            content =function(file){
                                              func(data,file)
                                            } )
  
}



#' 处理相应的逻辑
#'
#' @param proc_func 相应的函数 
#' @param id 内码
#' @param data 数据
#' @param filename  文件名
#' @param func  相关的处理函数名,必须有data与file作为入口参数
#'
#' @return 返回值
#' @export
#'
#' @examples
#' run_download_button(); 
run_download_button <-function(proc_func,id,data=iris,filename='下载文件.xlsx',func=write.xlsx){
  callModule(proc_func, id,data=data,filename=filename,func=func)
}

#2.处理data.frame显示----
#2.1 mdl_dataTable-------
#' 处理dataTable数据
#'
#' @param id 内码
#'
#' @return 返回值
#' @export
#'
#' @examples
#' mdl_dataTable();
mdl_dataTable <- function(id,label='dataTable') {
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
    DT::dataTableOutput(outputId = ns('mdl_dataTable'))
  )
  
}


#' 处理dataTable数据
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#' @param data 数据
#'
#' @return 返回值
#' @export
#'
#' @examples
#' proc_dataTable();
proc_dataTable <- function(input, output, session,data=iris) {
  
  output$mdl_dataTable <- DT::renderDataTable(data)
  
}

#' 运行dataTable数据
#'
#' @param proc_func 逻辑函数
#' @param id 内码
#' @param data 数据
#'
#' @return 返回值
#' @export
#'
#' @examples
#' run_dataTable();
run_dataTable <-function(proc_func,id,data=iris){
  callModule(proc_func, id,data=data)
}


#' 处理测试数据集
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#'
#' @return 返回值
#' @export
#'
#' @examples
#' test_dataTable();
test_dataTable <- function(input, output, session) {
  
  output$mdl_dataTable <- DT::renderDataTable(iris)
  
}

#' 测试dataTable的应用
#'
#' @param id 内码
#'
#' @return 返回值
#' @export
#'
#' @examples
#' run_dataTable_test();
run_dataTable_test <-function(id){
  callModule(test_dataTable, id)
}









