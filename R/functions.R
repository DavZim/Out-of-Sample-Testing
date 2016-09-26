#' Get Stock Data for a single ticker
#'
#' @param ticker the Yahoo tikcer for a stock
#' @param from the starting data (provided as a character)
#'
#' @return a data.table containing the adjusted stock prices
#' @export
#'
#' @examples
#' getData("MSFT", from = "2010-01-01")
#' 
getData <- function(ticker, from = "2000-01-01") {
  tmp <- getSymbols(ticker, from = from, auto.assign = F)
  
  df <- data.table(date = index(tmp), ticker = ticker, price = as.numeric(Ad(tmp)))
  return(df)
}

#' Get Stock Data for multiple tickers
#'
#' @param tickers a vector of tickers
#' @param from the starting data (provided as a character)
#'
#' @return a data.table containing the adjusted stock prices
#' @export
#'
#' @examples
#' getDataMult(c("AAPL", "GOOGL", "MSFT"), from = "2010-01-01")
#' 
getDataMult <- function(tickers, from = "2010-01-01") {
  res <- lapply(tickers, getData, from = from)
  
  return(rbindlist(res))
}