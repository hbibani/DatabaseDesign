SELECT fName, lName, position, postcode
FROM Staff, Branch
WHERE Staff.branchNo = Branch.branchNo
ORDER BY postcode, lName ASC;
