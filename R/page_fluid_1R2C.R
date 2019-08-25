#' 定义page_fluid_一行两列的模板
#'
#' @param HeadingName 标题
#' @param R1C1List 第一行第一列取值内容
#' @param R1C2List 第二行第二列取值
#' @param leftAreaList 左区分内容
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
#'R1C2List <- tagList(fileInput('file1','文件R1C2'));
#'
#'
#'ui <- page_fluid_default(HeadingName,leftAreaList,R1C1List,R1C2List);
page_fluid_1R2C <- function(HeadingName,leftAreaList,R1C1List,R1C2List) {
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
       fluidRow(box(R1C1List),
                box(R1C2List))
      )
    )
  )
  
  return(res)
  
}