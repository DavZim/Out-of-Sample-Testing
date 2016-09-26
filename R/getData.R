library(data.table)
library(quantmod)
library(readr)
library(tidyr)

# setwd("...")

source("functions.R") # loads the functions

tickers = c("PG", "CAT", "DIS", "V", "MSFT", "MRK", "VZ", "TRV", "GE", "AXP", 
            "JNJ", "DD", "KO", "NKE", "AAPL", "PFE", "WMT", "HD", "MCD", "BA", 
            "MMM", "IBM", "JPM", "XOM", "GS", "CSCO", "CVX", "UNH", "UTX", 
            "INTC")

df <- getDataMult(tickers, from = "2010-01-01")

df[, ':=' (ret = price/shift(price) - 1), 
   by = ticker]

write_csv(df, "data/djia_data.csv")