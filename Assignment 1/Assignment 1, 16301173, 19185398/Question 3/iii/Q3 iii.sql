SELECT Swimmer.name, Swim.position, Competition.compName, Event.eventName
FROM Swimmer, Swim, Competition, Event
WHERE Swim.swimmerId = Swimmer.swimmerId AND
      Swim.compId = Competition.compId AND
      Swim.eventId = Event.eventId AND
      Swim.position = 1;
