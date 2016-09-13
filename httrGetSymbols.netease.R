httrGetSymbols.netease("002578")

code <- "002578"
market <- NA

# Make code into 7 digits if it's not
if (nchar(code) < 6) {
  code <- paste(c(rep(0, 6-nchar(code)), code), collapse="")
}
if (nchar(code)==7) {
  market <- substr(code, 1, 1)
  code <- substr(code, 2, 7)
}
if (nchar(code) == 6) {
  if (missing("market")) {
    market <- ifelse(substr(code, 1, 1)<5, "SZ", "SH")
  } else if (market %in% c("0", "Shanghai", "SH", "sh")) {
    market <- "SH"
  } else if (market %in% c("1", "Shenzhen", "SZ", "sz")) {
    market <- "SZ"
  } else {
    stop("Cannot recognize market")
  }
}
# codename is for the name of data frame and file to save.
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
