GetSymbols.netease("0000001")

head(SH000001)

SH000001$DATE <- as.POSIXct(SH000001$DATE)

temp <- as.xts(SH000001)

t1 <- subset(SH000001, select = c("DATE","TOPEN", "HIGH", "LOW", "TCLOSE", "VOTURNOVER"))
t1 <- as.matrix(t1)


t2 <- as.xts(subset(SH000001, select = c("TOPEN", "HIGH", "LOW", "TCLOSE", "VOTURNOVER")), dateFormat="POSIXct", order.by = SH000001$DATE)
  
t3 <- subset(SH000001, select = c("TOPEN", "HIGH", "LOW", "TCLOSE", "VOTURNOVER"),)

names(t2) <- c("Open", "High","Low", "Close", "Volume")

t2 <- as.quantmod.OHLC(t2, col.names = c("Open", "High","Low", "Close", "Volume"))


chart_Series(t2)

SH000001 %>% 
  subset( select = c("TOPEN", "HIGH", "LOW", "TCLOSE", "VOTURNOVER")) %>%
  as.xts( dateFormat="POSIXct", order.by = SH000001$DATE) -> SHCI
  

SHCI <- as.quantmod.OHLC(SHCI, col.names = c("Open", "High","Low", "Close", "Volume")) %>%
  head()
