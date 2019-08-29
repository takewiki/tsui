
library(tsda);
library(RJDBC);

con <- sql_conn_common();

voucher <- dbGetQuery(con,'select * from T_GL_VOUCHER;')