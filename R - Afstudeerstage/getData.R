#This page is used to execute different queries to select data from the database.
source("DB_connection.R")

getBookingRouteData <- function() {
  con <- dbConnection()
  rs <- dbSendQuery(con, "select *
                          from XXYSS_HINTERLAND.booking bk
                          JOIN XXYSS_HINTERLAND.booking_line bkl ON bk.bookingno = bkl.bookingno
                          JOIN XXYSS_HINTERLAND.COMPANY cp ON bk.customer = cp.seq
                          order by bk.createdatetime asc")
  data <- fetch(rs)
  
  return(data)
}

getEventDateData <- function() {
  con <- dbConnection()
  rs <- dbSendQuery(con, "SELECT  ROUND(T2.CREATEDATETIME - T1.CREATEDATETIME) as dateDiff,
                          ROUND(COUNT(*) * 100 / (SELECT COUNT(*) 
                            FROM XXYSS_HINTERLAND.EVENT T1
                            LEFT JOIN XXYSS_HINTERLAND.EVENT T2
                                ON T1.BOOKINGNO = T2.BOOKINGNO
                                AND T1. BOOKINGLINENO = T2.BOOKINGLINENO
                                AND T2.eventcode = 'ARRIVED'
                            WHERE T1.eventcode = 'PLANNED'), 1) as percentage
                          FROM    XXYSS_HINTERLAND.EVENT T1
                          LEFT JOIN XXYSS_HINTERLAND.EVENT T2
                            ON T1.BOOKINGNO = T2.BOOKINGNO
                            AND T1. BOOKINGLINENO = T2.BOOKINGLINENO
                            AND T2.eventcode = 'ARRIVED'
                          WHERE T1.eventcode = 'PLANNED'
                          GROUP BY ROUND(T2.CREATEDATETIME - T1.CREATEDATETIME)
                          ORDER BY ROUND(T2.CREATEDATETIME - T1.CREATEDATETIME)")
  data <- fetch(rs)
  
  return(data)
}

getEventTimeData <- function() {
  con <- dbConnection()
  rs <- dbSendQuery(con, "SELECT *
                          FROM rvanoldenbarneveld.r_eventtimepercentages")
  data <- fetch(rs)
  
  return(data)
}

getEventData <- function() {
  con <- dbConnection()
  rs <- dbSendQuery(con, "select * from XXYSS_HINTERLAND.event")
  data <- fetch(rs)
  
  return(data)
}