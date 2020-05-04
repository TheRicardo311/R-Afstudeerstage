#This page is used to execute different queries to select data from the database.
source("DB_connection.R")

getBookingData <- function() {
  con <- dbConnection()
  rs <- dbSendQuery(con, "select *
                          from XXYSS_HINTERLAND.booking bk
                          JOIN XXYSS_HINTERLAND.booking_line bkl ON bk.bookingno = bkl.bookingno
                          JOIN XXYSS_HINTERLAND.COMPANY cp ON bk.customer = cp.seq
                          order by bk.createdatetime asc")
  data <- fetch(rs)
  
  return(data)
}

getBookingDateData <- function() {
  con <- dbConnection()
  rs <- dbSendQuery(con, "SELECT  T1.BOOKINGNO,
                                  T1.BOOKINGLINENO,
                                  T1.CREATEDATETIME, 
                                  MIN(T2.CREATEDATETIME) AS Date2
                          FROM    XXYSS_HINTERLAND.EVENT T1
                            LEFT JOIN XXYSS_HINTERLAND.EVENT T2
                              ON T1.BOOKINGNO = T2.BOOKINGNO
                              AND T1. BOOKINGLINENO = T2.BOOKINGLINENO
                              AND T2.eventcode = 'ARRIVED'
                          WHERE T1.eventcode = 'PLANNED'
                          GROUP BY T1.BOOKINGNO, T1.BOOKINGLINENO, T1.CREATEDATETIME;")
  data <- fetch(rs)
  
  return(data)
}

getEventData <- function() {
  con <- dbConnection()
  rs <- dbSendQuery(con, "select * from XXYSS_HINTERLAND.event")
  data <- fetch(rs)
  
  return(data)
}