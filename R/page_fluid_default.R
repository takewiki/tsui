#' 定义page_fluid的默认模板
#'
#' @param HeadingName 标题
#' @param leftAreaList 左区分内容
#' @param rightAreaList 右区分内容
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
#'rightAreaList <-tagList(plotOutput("distPlot"));
#'
#'
#'ui <- page_fluid_default(HeadingName,leftAreaList,rightAreaList);
page_fluid_default <- function(HeadingName,leftAreaList,rightAreaList) {
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
       rightAreaList
      )
    )
  )
  
  return(res)
  
}