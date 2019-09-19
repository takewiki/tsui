#' 处理网商品牌订单界面信息
#'
#' @param id 内码信息
#' @param label 标题信息
#'
#' @return 返回值 
#' @import tsda
#' @import tsdo
#' @export
#'
#' @examples
#' mdl_ns_brand('ns_select','请选择品牌');
mdl_ns_brand <- function(id,label){
  ns <- NS(id)
  conn_nsim <-sql_conn_common(db_name = 'nsim');
  brand_info <- sql_select(conn_nsim,'select FNumber,FName from brand
                              order by FId asc');
  brand_number <- brand_info$FNumber;
  brand_name <- brand_info$FName;
  tagList(
    mdl_ListChoose1(ns('brand'),label,
                    choiceNames = vect_as_list(brand_name),
                    choiceValues = vect_as_list(brand_number),
                    selected = 'JBLH'
    )
  )
}

#' 处理品牌的业务处理逻辑
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#'
#' @return 返回值
#' @export
#'
#' @examples
#' proc_ns_brand();
proc_ns_brand <- function(input,output,session){
  
res <- reactive(var_ListChoose1('brand'))
return(res)
}

#' 服务器处理品牌信息
#'
#' @param id 内码
#'
#' @return 返回值
#' @export
#'
#' @examples
#' var_ns_brand();
var_ns_brand <- function(id){
  res <- callModule(proc_ns_brand,id)
  return(res)
}
