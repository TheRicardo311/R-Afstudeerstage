#This page is used to execute different queries to select data from the database.
source("DB_connection.R")

getBookingData <- function() {
  con <- dbConnection()
  rs <- dbSendQuery(con, "select * from XXYSS_HINTERLAND.BOOKING")
  data <- fetch(rs)
  
  return(data)
}

getEventData <- function() {
  con <- dbConnection()
  rs <- dbSendQuery(con, "select * from XXYSS_HINTERLAND.event")
  data <- fetch(rs)
  
  return(data)
}