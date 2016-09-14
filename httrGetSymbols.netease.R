
code <- "002578"
market <- "SZ"

# codenum is for the link to netease.
codename <- paste("CODE", code, sep="")
codenum <- paste(ifelse(market=="SH", 0, 1), code, sep="")


from <- "20160101"
to <- format(Sys.Date(), format="%Y%m%d")

fields=c("TCLOSE", "HIGH", "LOW", "TOPEN",
         "LCLOSE", "CHG", "PCHG",
         "TURNOVER", "VOTURNOVER",
         "VATURNOVER", "TCAP", "MCAP")

link <- paste("http://quotes.money.163.com/service/chddata.html?",
              "code=", codenum, "&",
              "start=", from, "&",
              "end=", to, "&",
              "fields=", paste(fields, collapse=";"),
              sep="")

# fields # 字段中文名和含义
# TCLOSE # 收盘价
# HIGH # 最高价
# LOW # 最低价
# TOPEN # 开盘价
# LCLOSE # 前收盘
# CHG # 涨跌额
# PCHG # 涨跌幅
# TURNOVER # 换手率
# VOTURNOVER # 成交量
# VATURNOVER # 成交金额
# TCAP # 总市值
# MCAP # 流通市值


library(httr)
library(magrittr)
library(stringr)


GET(link) %>% 
  content(type = "text", encoding = "gb18030") %>%
  str_split("\\r\\n") %>% 
  unlist() %>% # 将列表转为向量
  extract(2:length(.)-1) %>% # 第一行是字段名，最后一个行是空字符 
  str_split(",", simplify = TRUE) %T>%

  
  
  
  
  
