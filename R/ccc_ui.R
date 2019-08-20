# 0_定义tsui Generic Func----
#' 定义通用的输入函数
#'
#' @param x 对象签名
#'
#' @return 返回值
#' @include aaa_defineClasses.R
#' @export
#'
#' @examples shiny_input(bbc);
setGeneric("tsui",
           signature = "x",
           function(x) standardGeneric("tsui"));

# 1 tsui在文本上的应用-----

# 1.01 tsui for class ui_text----
#' shiny_input用于ui_text的处理方法定义
#'
#' @param x ui_text.
#'
#' @return 返回值
#' @import shiny
#' @export
#'
#' @examples shiny_input(bb);
setMethod("tsui",
          c("x" = "ui_text"),
          function(x){
            textInput(inputId = x@inputId,
                      label= x@label,
                      value=x@value,
                      width = x@width)
                      });
# 1.02 定义tsui在ui_password上的实现-----
#' 定义shiny_input对ui_password的实现
#'
#' @param x ui_password. 实例化对象ui_password
#'
#' @return 返回值
#' @export
#'
#' @examples tsui(x);
setMethod("tsui",
          c("x" = "ui_password"),
          function(x){
             passwordInput(inputId = x@inputId,
                           label= x@label,
                           value=x@value,
                           width = x@width)
          });
# 2.定义数值的处理方法------
# 2.1定义tsui方法在input.numeric上的实现----
#' 定义drawElement方法在input.numeric上的实现
#'
#' @param x input.numeric. 定义对象
#'
#' @return 返回值
#' @include input.numeric.R
#' @export
#'
#' @examples tsui();
setMethod("tsui",
          c("x" = "input.numeric"),
          function(x){
             numericInput(inputId = x@Id,
                          label = x@label,
                          value = x@value,
                          min = x@min,
                          max = x@max,
                          step = x@step,
                          width = x@width)
          })




# 2.2 定义tsui方法在input.slider类的实现------
#' 2.2 定义tsui方法在input.slider类的实现
#'
#' @param x input.slider. 输入对象实例
#'
#' @return 返回值
#' @export
#' @import shiny
#' @include input.slider.R
#'
#'
#' @examples tsui();
setMethod("tsui",
          c("x" = "input.slider"),
          function(x){
             sliderInput(inputId = x@Id,
                         label = x@label,
                         min = x@min,
                         max = x@max,
                         value = x@value,
                         step = x@step,
                         round = x@round,
                         width = x@width)
          })


# shiny_input在ui_date上的方法实现----
#' shiny_input for ui_date
#'
#' @param x ui_date.  对象
#'
#' @return 返回值
#' @export
#'
#' @examples shiny_input(x);
setMethod("tsui",
          c("x"="ui_date"),
          function(x) {
            if (x@value == "") {
              dateInput(inputId = x@inputId,
                        label = x@label,
                        value = NULL,
                        min = x@min,
                        max = x@max,
                        format = x@format,
                        startview = x@startview,
                        weekstart = x@weekstart,
                        language = x@language,
                        width = x@width,
                        autoclose = x@autoclose)

            }else{
              dateInput(inputId = x@inputId,
                        label = x@label,
                        value = x@value,
                        min = x@min,
                        max = x@max,
                        format = x@format,
                        startview = x@startview,
                        weekstart = x@weekstart,
                        language = x@language,
                        width = x@width,
                        autoclose = x@autoclose)

            }




})

#tsui在ui_file上进行方法实现----
#' 定义shiny_input在ui_file上的实现
#'
#' @param x ui_file.  ui_file实例对象
#'
#' @return 返回值
#' @export
#'
#' @examples shinput(ui_file_ins);
setMethod("tsui", c("x"="ui_file"), function(x) {
   if (x@accept =="") {
     fileInput(inputId = x@inputId,
               label = x@label,
               multiple = x@multiple,
               accept = NULL,
               width = x@width,
               buttonLabel = x@buttonLabel,
               placeholder = x@placeholder)
   } else {
     fileInput(inputId = x@inputId,
               label = x@label,
               multiple = x@multiple,
               accept = x@accept,
               width = x@width,
               buttonLabel = x@buttonLabel,
               placeholder = x@placeholder)
   }





})

# tsui for input.file class -----
#' 定义tsui方法在input.file上的实现
#'
#' @param x input.file.  input.file类
#'
#' @return 返回值
#' @import shiny
#' @include input.file.R
#' @export
#'
#' @examples  tsui(input.file());
setMethod("tsui",
          c("x" = "input.file"),
          function(x){
             fileInput(inputId = x@Id,
                       label =x@label,
                       multiple = x@multiple,
                       accept = x@accept,
                       width = x@width,
                       buttonLabel = x@buttonLabel,
                       placeholder = x@placeholder
             )
          })



#' 用于生成下载按纽
#'
#' @param x input.button.download.
#'
#' @return 返回值
#' @export
#' @include input.button.download.R
#' @import shiny
#'
#' @examples drawElement(input.button.download());
setMethod("tsui",
          c("x" = "input.button.download"),
          function(x){
             downloadButton(outputId = x@Id,label = x@label,class = x@css_class)
          })


# 定义tsui方法在output.dataTable类的实现----

#' 定义tsui方法在output.dataTable类的实现
#'
#' @param x output.dataTable. 类output.dataTable实例对象
#'
#' @return 返回值
#' @import shiny
#' @include output.dataTable.R
#' @export
#'
#' @examples tsui(output.dataTable());
setMethod("tsui",
          c("x" = "output.dataTable"),
          function(x){
             dataTableOutput(outputId = x@Id)
          })

# 将于处理相应的数据 ---------
#' 将于处理相应的数据 
#'
#' @param x output.image.  output.image类的对象
#'
#' @return 返回值
#' @include output.image.R
#' @import shiny
#' @export
#'
#' @examples drawElement();
setMethod("tsui",
          c("x" = "output.image"),
          function(x){
             imageOutput(outputId = x@Id,
                         width = x@width,
                         height = x@height,
                         click = x@click,
                         dblclick = x@dblclick,
                         hover = x@hover,
                         brush = x@brush,
                         inline = x@inline)
          })

#' Title
#'
#' @param x output.plot.  output.plot类的对象
#'
#' @return 返回值
#' @include output.plot.R
#' @import shiny
#' @export
#'
#' @examples drawElement();
setMethod("tsui",
          c("x" = "output.plot"),
          function(x){
             plotOutput(outputId = x@Id,
                        width = x@width,
                        height = x@height,
                        click = x@click,
                        dblclick = x@dblclick,
                        hover = x@hover,
                        brush = x@brush,
                        inline = x@inline)
          })


# 定义drawElement方法在input.checkboxGroup上的实现----
#' 定义drawElement方法在input.checkboxGroup上的实现
#'
#' @param x input.checkboxGroup. 实例
#'
#' @return 返回值
#' @include input.checkboxGroup.R
#' @import shiny
#' @export
#'
#' @examples drawElement();
setMethod("tsui",
          c("x" = "input.checkboxGroup"),
          function(x){
             checkboxGroupInput(inputId = x@Id,
                                label = x@label,
                                choiceNames = x@choiceNames,
                                choiceValues = x@choiceValues,
                                selected = x@selected,
                                inline = x@inline,
                                width = x@width)
          })



# 定义drawElement方法在output.print上的实现----
#' 定义drawElement方法在output.print
#'
#' @param x output.print. output.print实例
#'
#' @return 返回值
#' @import shiny
#' @include output.print.R
#' @export
#'
#' @examples drawElement();
setMethod("tsui",
          c("x" = "output.print"),
          function(x){
             verbatimTextOutput(outputId = x@Id,
                                placeholder = x@placeholder)
             
          })

# 定义drawElement方法在output.text上的实现----
#' 定义drawElement方法在output.text上的实现
#'
#' @param x output.text.定义output.text的实例
#'
#' @return 返回值
#' @include output.text.R
#' @import shiny
#' @export
#'
#' @examples drawElement();
setMethod("tsui",
          c("x" = "output.text"),
          function(x){
             textOutput(outputId = x@Id,inline = x@inline)
             
          })


# 定义tsui方法在input.date上的实现----
#' 定义tsui方法在input.date上的实现
#'
#' @param x input.date. 实例化对象
#'
#' @return 返回值
#' @import shiny
#' @include input.date.R
#' @export
#'
#' @examples tsui();
setMethod("tsui",
          c("x" = "input.date"),
          function(x){
             dateInput(inputId = x@Id,
                       label = x@label,
                       value = x@value,
                       min = x@min,
                       max = x@max,
                       format = x@format,
                       startview = x@startview,
                       weekstart = x@weekstart,
                       language = x@language,
                       width = x@width,
                       autoclose = x@autoclose)
             
          })




# 定义tsui方法在input.dateRange上的实现----
#' 定义处理日期范围的控制
#'
#' @param x input.dateRange. 日期范围
#'
#' @return 返回值
#' @include input.dateRange.R
#' @import shiny
#' @export
#'
#' @examples tsui();
setMethod("tsui",
          c("x" = "input.dateRange"),
          function(x){
             dateRangeInput(inputId = x@Id,
                            label = x@label,
                            start=x@start,
                            end=x@end,
                            min = x@min,
                            max = x@max,
                            format = x@format,
                            startview = x@startview,
                            weekstart = x@weekstart,
                            language = x@language,
                            separator = x@separator,
                            width = x@width,
                            autoclose = x@autoclose)
             
          })


# 定义tsui在input.button.download类的上方法----
#' Title
#'
#' @param x input.button.download.
#'
#' @return 返回值
#' @export
#' @include input.button.download.R
#' @import shiny
#'
#' @examples tsui(input.button.download());
setMethod("tsui",
          c("x" = "input.button.download"),
          function(x){
             downloadButton(outputId = x@Id,label = x@label,class = x@css_class)
          })



# tsui用于input.button.acton控件上面-----
#' tsui用于input.button.acton控制上面
#'
#' @param x input.button.action. 实例化
#'
#' @return 返回值
#' @include input.button.action.R
#' @export
#'
#' @examples
#' tsui();
setMethod("tsui",
          c("x" = "input.button.action"),
          function(x){
                actionButton(inputId = x@Id,label = x@label,width = x@width)
          })


