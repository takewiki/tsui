#' 定义print组件
#'
#' @param Id 域名内码
#'
#' @return 返回值
#' @export
#'
#' @examples mdl.print();
mdl.print <- function(Id) {
  ns <- NS(Id)
  .Deprecated('mdl_print','tsui','请使用mdl_print替代mdl.print','mdl.print');
  param.output.print<- output.print(Id =ns('printOutput1'));
  tagList(drawElement(param.output.print));

}
