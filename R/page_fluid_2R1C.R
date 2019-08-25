#' 定义page_fluid_两行一列的模板
#'
#' @param HeadingName 标题
#' @param R1C1List 第一行第一列取值内容
#' @param leftAreaList 左区分内容
#' @param R2C1List 第二行第一列取值内容
#'
#' @return 返回值
#' @export
#'
#' @examples
#' HeadingName <-"Old Faithful Geyser Data";
#'leftAreaList <- tagList( sliderInput("bins",
#'                                     "Number of bins:",
#'                                     min = 1,
#'                                     max = 50,
#'                                     value = 30),
#'                         fileInput('file1','文件'));
#'R1C1List <- tagList(fileInput('file1','文件R1C1'));
#'R2C1List <- tagList(fileInput('file1','文件R2C1'));
#'
#'
#'ui <- page_fluid_2R1C(HeadingName,leftAreaList,R1C1List,R2C1List);
page_fluid_2R1C <- function(HeadingName,leftAreaList,R1C1List,R2C1List) {
  res <- fluidPage(
    
    # Application title
    titlePanel(HeadingName),
    
    # Sidebar with a slider input for number of bins
    sidebarLayout(
      sidebarPanel(
       leftAreaList
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
       fluidRow(box(R1C1List)),
       fluidRow(box(R2C1List))
      )
    )
  )
  
  return(res)
  
}