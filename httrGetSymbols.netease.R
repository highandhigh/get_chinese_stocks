httrGetSymbols.netease("002578")

code <- "002578"
market <- "SZ"

# codenum is for the link to netease.
codename <- paste("CODE", code, sep="")
codenum <- paste(ifelse(market=="SH", 0, 1), code, sep="")


from <- "20060101"
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

library(httr)
library(magrittr)

r <- GET(link)

GET(link) %>%
  content(type = "text", encoding = "gb18030") %>%
  writeBin("myfile.csv")
  cat() %>%
