INSERT INTO Person(FirstName, LastName, Birthday, Email)
VALUES
    ('Peter', 'Kvillegard', '1982-07-05', 'emailexample@email.com'),
    ('Kalle', 'Andreasson', '1906-12-24', 'bill@microsoft.com')

INSERT INTO Event(EventTime, EventPlace)
VALUES
    ('2026-11-01T17:00:00', '123 Bradford St., Malmö')

INSERT INTO Coordinator (PersonId, EventId)
VALUES
    (1, 1)

INSERT INTO Registration (PersonId, EventId)
VALUES
    (1,1)

INSERT INTO MealPreference (RegistrationId, IsVegetarian, IsDrinking)
VALUES
    (1,1,0)
