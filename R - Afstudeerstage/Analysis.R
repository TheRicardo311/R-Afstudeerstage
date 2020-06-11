library("tidyverse")

source("getData.R")
#bookingData <- getBookingData()
#eventData <- getEventData()
eventDateData <- getEventDateData()
eventTimeData <- getEventTimeData()

#eventTimeDataFilled <- function(dataTable) {
#  if(nrow(dataTable) == 0){
#    datayn <- 0
#    return(datayn)
#  } else { 
#    datayn <- 1
#    return(datayn)
#  }
#}



#filteredData <- eventTimeDataFilled(eventTimeData)
#print(filteredData)

write.csv(eventDateData, file = 'event-date-data.csv')
#write.csv(format(eventDateData[4], format="%y/%m/%d"), file = 'Booking-date-data.csv')

#finish <- format(bookingDateData[4], format="%d/%B/%Y")
#start <- format(bookingDateData[3], format="%d/%B/%Y")
#diff <- finish - start


