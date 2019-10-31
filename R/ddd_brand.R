#' 品牌选择
#'
#' @param id 内码 
#' @param name 名称
#'
#' @return 返回值
#' @export
#'
#' @examples
#' mdl_brand_tpl();
mdl_brand_tpl <-function(id,name='品牌选择'){
  ns <- NS(id);
  conn <- tsda::conn_nsim()
  brand_name <-nsim_brand_FName() %>%vect_as_list();
  brand_number <-nsim_brand_FNumber() %>% vect_as_list();
  tagList(mdl_ListChoose1(ns('mdl_brand_tpl'),name,
                  choiceNames = brand_name,
                  choiceValues = brand_number,selected = 'JBLH'
  ))
}


#' 处理问题列表
#'
#' @param id 内码 
#' @param data 数据
#' @param button_txt  提交答案
#'
#' @return 返回值
#' @export
#'
#' @examples
#' mdl_question();
mdl_question <- function(id,data,button_txt='提交答案'){
  ns <- NS(id);
  #取第一个元素
  data <- data;
  ques_id <- data[,1] %>% as.character;
  #生成唯一性
  ques_txt <-data[,2] %>% as.character %>% unique; 
  answ_id <-data[,3] %>% as.character ;
  #将问题id与答案id进行合并
  qa_id <- paste(ques_id,answ_id,sep=":") %>%vect_as_list;
  answ_txt <-data[,4] %>% as.character %>% vect_as_list ;
  tagList(mdl_ListChoose1(ns('mdl_question'),ques_txt,
                          choiceNames = answ_txt,
                          choiceValues = qa_id
  ),
    actionButton(ns('question_submit'),button_txt))
}


#' 提供处理逻辑
#'
#' @param input 输入 
#' @param output 输出
#' @param session 会话
#'
#' @return 返回值
#' @export
#'
#' @examples
#' proc_brand_tpl();
proc_brand_tpl <- function(input,output,session){
  #相当于server
  brand_tpl <- var_ListChoose1('mdl_brand_tpl');
  res <- reactive(brand_tpl())  
  return(res);
  
}

#' 处理标准问的逻辑
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#' @param table_name 写入表名
#'
#' @return 返回值
#' @import stringr
#' @import magrittr
#' @import tsda
#' @export
#'
#' @examples
#' proc_question();
proc_question <-function(input,output,session,table_name='ques_standard_answer'){
  #相当于server
  answ_choosed <-var_ListChoose1('mdl_question');
  res <-reactive({
    data <-answ_choosed();
    res <- str_split(data,":") %>% unlist;
    FQuestionId <- res[1] %>% as.integer();
    FAnswerId <- res[2] %>% as.integer();
    FStandard <-1L;
    data2 <- data.frame(FQuestionId,FAnswerId,FStandard,stringsAsFactors = F);
    return(data2)
  })
  #return(res)
  observeEvent(input$question_submit,{
    data <-res();
    nsim_save(data,table_name)
  })
}

#' 处理品牌
#'
#' @param id 内码
#'
#' @return 返回值
#' @export
#'
#' @examples
#' var_brand_tpl();
var_brand_tpl <- function(id){
  res <- callModule(proc_brand_tpl,id)
  return(res);
}
#' 运行相应的代码
#'
#' @param id 内码
#' @param table_name 表名 
#'
#' @return 返回值
#' @export
#'
#' @examples
#' run_question()
run_question <- function(id,table_name='ques_standard_answer'){
  callModule(proc_question,id,table_name=table_name)
}