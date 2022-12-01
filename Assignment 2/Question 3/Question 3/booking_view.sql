-- View for _Booking to allow for calculated fields

CREATE VIEW _Booking_v 
AS
SELECT b.*, timeFinish-timeStart AS totalHours
FROM _Booking b;
GO