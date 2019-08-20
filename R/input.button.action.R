# 定义一下下载按纽输入控件----
#' 定义input.button.action输入控件
#'
#' @return 返回值
#' @include superButton.R
#' @export
#'
#' @examples input.button.download()
setClass("input.button.action", 
         contains = 'superButton')

# 定义input.button.download同名的入口函数
#' 定义input.button.download的同名的入口函数
#'
#' @param label 标签
#' @param Id  内码
#'
#' @return 返回值
#' @export
#'
#' @examples input.button.action();
input.button.action <- function(Id='btn_action',
                                  label='点击按纽',
                                  width='100%'
                                  ) {
  res <- new('input.button.action');
  res2 <- initialize(res,Id=Id,
                         label=label,
                     width=width)
  return(res2)

}
