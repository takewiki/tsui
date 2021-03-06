% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mdl_baseUI.R
\name{mdl_numeric}
\alias{mdl_numeric}
\title{处理小数型字段处理}
\usage{
mdl_numeric(
  id,
  label = "小数",
  is.test = FALSE,
  value = 10,
  min = 0,
  max = 30,
  step = 0.5,
  width = "100\%"
)
}
\arguments{
\item{id}{ID}

\item{label}{名称}

\item{is.test}{是否测试}

\item{value}{默认值}

\item{min}{最小值}

\item{max}{最大值}

\item{step}{步长}

\item{width}{宽度}
}
\value{
返回值
}
\description{
处理小数型字段处理
}
\examples{
library(shiny);
library(tsui);
test_tsui(mdl_numeric,id='num1','小数',run_numeric_test);
}
