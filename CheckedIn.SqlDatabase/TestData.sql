INSERT INTO Person(FirstName, LastName, Phone, Email)
VALUES
    ('Peter', 'Kvillegard', '000', 'emailexample@email.com')

INSERT INTO Event(EventName, EventTime, EventPlace)
VALUES
    ('Öredev', '2026-11-01T17:00:00', '123 Bradford St., Malmö')

INSERT INTO Coordinator (PersonId, EventId)
VALUES
    (1, 1)

INSERT INTO Registration (PersonId, EventId, IsVegetarian, IsDrinking)
VALUES
    (1, 1, 1, 1)