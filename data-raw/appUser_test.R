library(tsui)
library(tsda)

bb <- readUserFile()

View(bb)

cc <- userRight_upload(app_id = 'caas',data = bb)



#deal with bb

dd <-userInfo_upload(data = bb,app_id = 'caas')

View(dd)
names(dd)


userQueryField(app_id = 'caas',user = '巴豆2',key = 'Femail')
