#' 处理登界面
#'
#' @param id 内码
#' @param label 标签
#'
#' @return 返回值
#' @export
#'
#' @examples
#' mdl_login();
mdl_login <- function(id,label="登录界面"){
  ns <- NS(id);
  tagList(
    h3(label),
    fluidRow(
      mdl_text(id = ns('user_name'),label = '用户名:'),
      mdl_password(id = ns('password'),label = '密码:')
    ),
    fluidRow(
      
      mdl_action_button(id = ns('login'),label = '登录')
    )
 
    
  )
}


#' 处理登录窗口逻辑
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#'
#' @return 返回值
#' @export
#'
#' @examples
#' proc_login();
proc_login <- function(input,output,session){
  user_name <- var_text('user_name')
  password <- var_password('password')
  login <- var_action_button('login')
  
  res <- eventReactive(login(),{
    list(username=user_name(),password=password())
  })
   
  return(res);

}

#' 处理登录窗口运行接口
#'
#' @param id 内码
#'
#' @return 返回值
#' @export
#'
#' @examples
#' run_login();
run_login <- function(id){
  res <-callModule(proc_login,id)
  return(res);
}



