-- Q3 ii a
-- Pick coach Alan Jones on 10th of october

SELECT c.firstName AS coachName, cl.fName AS clientName
FROM Coach c JOIN ExpertiseCoach ec ON c.coachID = ec.coachID
JOIN TrainingItem t ON ec.expertiseCoachID = t.expertiseCoachID
JOIN _Booking b ON t.trainingItemID = b.trainingItemID
JOIN _Client cl ON b.clientID = cl.clientID
WHERE c.coachID = 1 AND b.timeStart > '10-Oct-2019' AND b.timeStart < '11-Oct-2019';
