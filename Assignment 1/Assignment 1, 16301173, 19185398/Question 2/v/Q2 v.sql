SELECT propertyNo, postcode, fName, lName
FROM PropertyForRent, Staff
WHERE PropertyForRent.staffNo = Staff.staffNo
ORDER BY postcode;
