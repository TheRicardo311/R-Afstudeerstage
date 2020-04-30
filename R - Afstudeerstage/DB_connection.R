#This function is used to connect to the Database.

library("DBI")
library("ROracle")

dbConnection <- function() {
  drv <- dbDriver("Oracle")
  host <- "10.0.72"
  port <- "1521"
  sid <- "HONKOOP"
  connect.string <- paste(
    "(DESCRIPTION=",
    "(ADDRESS=(PROTOCOL=tcp)(HOST=", host, ")(PORT=", port, "))",
    "(CONNECT_DATA=(SID=", sid, ")))", sep = "")
  
  con <- dbConnect(drv, username = "rvanoldenbarneveld", password = "rvanoldenbarneveld", dbname = connect.string, prefetch = FALSE,
                   bulk_read = 1000L, stmt_cache = 0L, external_credentials = FALSE,
                   sysdba = FALSE)

  return(con)
}