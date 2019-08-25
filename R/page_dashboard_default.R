#' 定义仪表盘风格的页面
#'
#' @param HeadingName 标题栏
#' @param leftAreaList 左内容
#' @param rightAreaList 右内容
#'
#' @return 返回值
#' @import shinydashboard
#' @export
#'
#' @examples
#' page_dashboard_default();
page_dashboard_default <- function(HeadingName='Basic dashboard',
                                   leftAreaList,
                                   rightAreaList) {
  res <- dashboardPage(
    dashboardHeader(title = HeadingName),
    dashboardSidebar(leftAreaList),
    dashboardBody(
     rightAreaList
    )
  )
  return(res);
  
}