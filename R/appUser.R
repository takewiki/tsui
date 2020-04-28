#' 读取用户文件
#'
#' @param file 文件名
#'
#' @return 返回值
#' @import readxl
#' @export
#'
#' @examples
#' readUserFile()
readUserFile <- function(file="data-raw/sample_users.xlsx") {
  res <- read_excel(file,
                    col_types = c("text", "text", "text",
                                  "text", "text", "text", "text", "text",
                                  "text"))
  res <- as.data.frame(res)
  return(res)
  
}


#' 上传用户数据
#'
#' @param app_id 程序id
#' @param data  用户数据
#' @param default_pwd 默认密码
#' @param conn 连接信息
#'
#' @return 返回值
#' @import tsda
#' @export
#'
#' @examples
#' userRight_upload()
userRight_upload <- function(conn=conn_rds('rdbe'),app_id ='appTpl',data=readUserFile(),default_pwd='123456'){
  res1 <- data[,c('Fuser','Fpermissions','Fname')]
  res1$Fpassword <-password_md5(default_pwd)
  #print(res1)
  res1$FappId <- app_id
  #print(res1)
  res <- res1[,c('Fuser','Fpassword','Fpermissions','Fname','FappId')]
  #print(res)
  tsda::upload_data(conn=conn,table_name = 't_md_userRight',data = res)
  return(res)
}



#' 用户详细描述上传
#'
#' @param conn 连接
#' @param data 数据
#' @param app_id 程序id
#'
#' @return 返回值
#' @import reshape2
#' @export
#'
#' @examples
#' userInfo_upload()
userInfo_upload <- function(conn=conn_rds('rdbe'),data,app_id){
  
  data$FappId <-app_id
  

  
  res <- melt(data,id.vars=c('FappId','Fuser'),variable.name = 'Fkey',value.name = 'Fvalue')
  tsda::upload_data(conn=conn,table_name = 't_md_userInfo',data = res)
  
  return(res)
  
}



#' 查询用户字段
#'
#' @param conn 连接
#' @param app_id 程序
#' @param user 用户
#' @param key 关键字
#'
#' @return 返回值
#' @export
#'
#' @examples
#' userQueryField()
userQueryField <- function(conn=conn_rds('rdbe'),app_id='appTpl',user='demo',key='Fname'){
  sql<- paste0("select Fvalue  from t_md_userInfo
where FappId='",app_id,"' and Fuser='",user,"' and Fkey='",key,"'")
  r <- tsda::sql_select(conn,sql)
  ncount <- nrow(r)
  if(ncount>0){
    res <- as.character(r$Fvalue)
  }else{
    res <-'未知'
  }
  return(res)
  
}