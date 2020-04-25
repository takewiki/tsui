#' 处理APP菜单单项设置
#'
#' @param itemConfig 单项设置
#'
#' @return 返回值
#' @import shiny
#' @import shinydashboard
#' @export
#'
#' @examples
#' getMenuItem()
getMenuItem <- function(itemConfig){
  if(itemConfig$Fshow){
    res <- menuItem(itemConfig$Fname,tabName = itemConfig$Fid,icon=icon(itemConfig$Ficon))
  }else{
    res <- NULL
  }
  return(res)
}

#' 构建一个菜单
#'
#' @param config 配置文件
#'
#' @return 返回一个菜单项
#' @export
#'
#' @examples
#' getSideBarMenu()
getSideBarMenu <- function(config){
  item_list <-lapply(config, getMenuItem)
  names(item_list) <-NULL
  # print(item_list)
  res <- sidebarMenu(.list = item_list)
  return(res)
}


#' 格式化配置文件
#'
#' @param data 数据框的配置文件
#'
#' @return 返回值
#' @export
#'
#' @examples
#' config_formatter()
#' # config <- list(
#'#           row = list(
#'#             Fshow =TRUE,
#'#             Fname='第一行',
#'#             Fid='row',
#'#             Ficon='clock'
#'#           ),
#'#           column =list(
#'#             Fshow=FALSE,
#'#             Fname='测试一下',
#'#             Fid='column',
#'#             Ficon='history'
#'#           ),
#'#           book = list(
#'#             Fshow=TRUE,
#'#             Fname='第三项',
#'#             Fid='book',
#'#             Ficon='plane'
#'#           ),
#'#           series=list(
#'#             Fshow=TRUE,
#'#             Fname='第四项',
#'#             Fid='series',
#'#             Ficon='car-side'
#'#           ),
#'#           majority=list(
#'#             Fshow=FALSE,
#'#             Fname='第五项',
#'#             Fid='majority',
#'#             Ficon='hourglass'
#'#           
#'#           ),
#'#           tutor=list(
#'#             Fshow=TRUE,
#'#             Fname='第六项',
#'#             Fid='tutor',
#'#             Ficon='user-times'
#'#           )
#'#            
#'# )
#'data_config <- data.frame(Fshow=c(TRUE,TRUE,TRUE,TRUE,TRUE,TRUE),
#'Fname=LETTERS[1:6],
#'Fid = c('row','column','book','series','majority','tutor'),
#'Ficon=c('clock','history','plane','car-side','hourglass','user-times'),
#'stringsAsFactors = F)
#'
#'格式化为列表
#'
#'config <- config_formatter(data_config)
#'
config_formatter <- function(data) {
  data_split <- split(data,data$Fid)
  res <- lapply(data$Fid, function(id){
    as.list(data_split[[id]])
  })
  return(res)
  
}


#' 获取用户登录信息
#'
#' @param conn 数据库信息
#' @param app_id 指定APP
#'
#' @return 返回值
#' @export
#'
#' @examples
#' getUsers()
getUsers <- function(conn=conn_rds('rdbe'),app_id='appTpl') {
 # conn <- conn_rds('rdbe')
  sql <-paste0("select Fuser,Fpassword,Fpermissions,Fname from t_md_userRight
where FappId ='",app_id,"'")
  res <- tsda::sql_select(conn,sql)
  return(res)
  
}


#' 根据角色与数据库设置边栏
#'
#' @param conn 数据库连接
#' @param app_id 程序ID
#' @param permission 角色
#'
#' @return 返回值
#' @export
#'
#' @examples
#' setSideBarMenu()
setSideBarMenu <- function(conn=conn_rds('rdbe'),app_id='appTpl',permission='admin'){
  sql <-paste0("select Fshow,Fname,Fid,Ficon from t_md_rolePermission
where Fpermissions ='",permission,"' and FappId='",app_id,"'")  
  res <- tsda::sql_select(conn,sql)
  res$Fshow <- as.logical(as.integer(res$Fshow))
  config <- config_formatter(res)
  sidebarMenu <- getSideBarMenu(config)
  return(sidebarMenu)
}
