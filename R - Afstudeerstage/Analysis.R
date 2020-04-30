source("getData.R")
#bookingData <- getBookingData()
eventData <- getEventData()


#write.csv(bookingData, file = 'booking-data.csv')
write.csv(eventData, file = 'event-data.csv')