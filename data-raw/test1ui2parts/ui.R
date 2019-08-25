#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram

HeadingName <-"Old Faithful Geyser Data2";

leftAreaList <- tagList( sliderInput("bins",
                                     "Number of bins:",
                                     min = 1,
                                     max = 50,
                                     value = 30),
                         fileInput('file1','文件'));
rightAreaList <-tagList(plotOutput("distPlot"));


ui <- page_fluid_default(HeadingName,leftAreaList,rightAreaList);
bb <-shinyUI(ui)

