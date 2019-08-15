library(shiny);
library(tsui);
ui <- fluidPage(
  mdl_text('text1',label = '姓名',is.test = T),
  mdl_text('text2',label = '密码',is.test = T)
)

server <- function(input, output, session) {
  run_text_test('text1')
  run_text_test('text2')

}

shinyApp(ui, server)