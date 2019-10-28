#1.0 单层模块的设计--------
#' 处理单个模块的问题
#'
#' @param id 内码
#' @param label 标签
#'
#' @return 返回值
#' @export
#'
#' @examples
#' counterButton();
counterButton <- function(id, label = "Counter") {
  ns <- NS(id)
  tagList(
    actionButton(ns("button"), label = label),
    verbatimTextOutput(ns("out"))
  )
}

#' 处理计数器的逻辑
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#'
#' @return 返回值
#' @export
#'
#' @examples
#' counter();
counter <- function(input, output, session) {
  count <- reactiveVal(0)
  observeEvent(input$button, {
    count(count() + 1)
  })
  output$out <- renderText({
    count()
  })
  count
}


#' 计数器演示程序
#'
#' @return 返回值
#' @export
#'
#' @examples
#' counter_run(); 
counter_run <- function(){
  ui <- fluidPage(
    counterButton("counter1", "Counter #1")
  )
  
  server <- function(input, output, session) {
    callModule(counter, "counter1")
  }
  
  shinyApp(ui, server)
}


# Module UI function
#' 文件输入器
#'
#' @param id 命名空间内码
#' @param label 标签
#'
#' @return 返回值
#' @export
#'
#' @examples
#' csvFileInput();
csvFileInput <- function(id, label = "CSV file") {
  # Create a namespace function using the provided id
  ns <- NS(id)
  
  tagList(
    fileInput(ns("file"), label),
    checkboxInput(ns("heading"), "Has heading"),
    selectInput(ns("quote"), "Quote", c(
      "None" = "",
      "Double quote" = "\"",
      "Single quote" = "'"
    ))
  )
}


# Module server function
#' 处理服务器端的逻辑
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#' @param stringsAsFactors 是否字符串 
#'
#' @return 返回值
#' @export
#'
#' @examples
#' csvFile();
csvFile <- function(input, output, session, stringsAsFactors) {
  # The selected file, if any
  userFile <- reactive({
    # If no file is selected, don't do anything
    validate(need(input$file, message = FALSE))
    input$file
  })
  
  # The user's data, parsed into a data frame
  dataframe <- reactive({
    read.csv(userFile()$datapath,
             header = input$heading,
             quote = input$quote,
             stringsAsFactors = stringsAsFactors)
  })
  
  # We can run observers in here if we want to
  observe({
    msg <- sprintf("File %s was uploaded", userFile()$name)
    cat(msg, "\n")
  })
  
  # Return the reactive that yields the data frame
  return(dataframe)
}



#' 处理相应的调用csvFile
#'
#' @return 返回值
#' @export
#'
#' @examples
#' csvFile_run();
csvFile_run <- function(){
  ui <- fluidPage(
    sidebarLayout(
      sidebarPanel(
        csvFileInput("datafile", "User data (.csv format)")
      ),
      mainPanel(
        dataTableOutput("table")
      )
    )
  )
  
  server <- function(input, output, session) {
    datafile <- callModule(csvFile, "datafile",
                           stringsAsFactors = FALSE)
    
    output$table <- renderDataTable({
      datafile()
    })
  }
  
  shinyApp(ui, server)
}


#' 处理相应的UI
#'
#' @param id 内码 
#'
#' @return 返回值
#' @export
#'
#' @examples
#' linkedScatterUI();
linkedScatterUI <- function(id) {
  ns <- NS(id)
  
  fluidRow(
    column(6, plotOutput(ns("plot1"), brush = ns("brush"))),
    column(6, plotOutput(ns("plot2"), brush = ns("brush")))
  )
}

#' 处理相关的服务器
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#' @param data 数据
#' @param left 左
#' @param right 右
#'
#' @return 返回值
#' @export
#'
#' @examples
#' linkedScatter();
linkedScatter <- function(input, output, session, data, left, right) {
  # Yields the data frame with an additional column "selected_"
  # that indicates whether that observation is brushed
  dataWithSelection <- reactive({
    brushedPoints(data(), input$brush, allRows = TRUE)
  })
  
  output$plot1 <- renderPlot({
    scatterPlot(dataWithSelection(), left())
  })
  
  output$plot2 <- renderPlot({
    scatterPlot(dataWithSelection(), right())
  })
  
  return(dataWithSelection)
}



#' 处理函数处理逻辑
#'
#' @param data 数据
#' @param cols 位置
#'
#' @return 返回值
#' @import ggplot2
#' @export
#'
#' @examples
#' scatterPlot();
scatterPlot <- function(data, cols) {
  ggplot(data, aes_string(x = cols[1], y = cols[2])) +
    geom_point(aes(color = selected_)) +
    scale_color_manual(values = c("black", "#66D65C"), guide = FALSE)
}


#嵌套的模块设计-------

#' 处理内码的输入
#'
#' @param id 内码
#'
#' @return 返回值
#' @export
#'
#' @examples
#' innerUI();
innerUI <- function(id) {
  ns <- NS(id)
  tagList(
    textInput(ns('inner_text'),label = 'text'),
    verbatimTextOutput(ns('inner_res'))
  )
}

#' 外部控件的处理
#'
#' @param id 内码
#'
#' @return 返回值
#' @export
#'
#' @examples
#' outerUI();
outerUI <- function(id) {
  ns <- NS(id)
  wellPanel(
    innerUI(ns("inner1")),
    innerUI(ns("inner2"))
  )
}

#' 处理最里面的逻辑
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#'
#' @return 返回值
#' @export
#'
#' @examples
#' inner();
inner <- function(input, output, session) {
  output$inner_res <- renderPrint({
    input$inner_text
  })
}


#' 处理外面的逻辑
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#'
#' @return 返回值
#' @export
#'
#' @examples
#' outer();
outer <- function(input, output, session) {
  callModule(inner, "inner1")
  callModule(inner, "inner2")
  # outer logic
}


#' 处理调用函数
#'
#' @return 返回值
#' @export
#'
#' @examples
#' inner_outer_run();
inner_outer_run <- function(){
  ui <- fluidPage(
    outerUI('out2')
  )
  
  server <- function(input, output, session) {
    callModule(outer, "out2")
  }
  
  shinyApp(ui, server)
  
}