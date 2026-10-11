DROP TABLE IF EXISTS MealPreference;   -- points to Guest
DROP TABLE IF EXISTS Registration;            -- points to Person + Event
DROP TABLE IF EXISTS Coordinator;      -- points to Person + Event
DROP TABLE IF EXISTS Event;            -- parent
DROP TABLE IF EXISTS Person;           -- parent

CREATE TABLE Person (
    PersonId INTEGER IDENTITY (1,1),
    FirstName VARCHAR (100) NOT NULL,
    LastName VARCHAR (100) NOT NULL,
    Phone INTEGER (50),
    Email VARCHAR (100) NOT NULL,

    CONSTRAINT PK_Person_PersonId PRIMARY KEY(PersonId),
    CONSTRAINT UQ_Person_Email UNIQUE(Email)

);

CREATE TABLE Event (
    EventId INTEGER IDENTITY (1,1),
    EventTime DATETIME2 NOT NULL,
    EventPlace VARCHAR (100) NOT NULL,

    CONSTRAINT PK_Event_EventId PRIMARY KEY(EventId)
);

CREATE TABLE Coordinator (
    CoordinatorId INTEGER IDENTITY (1,1),
    PersonId INTEGER,
    EventId INTEGER,

    CONSTRAINT PK_Coordinator_CoordinatorId PRIMARY KEY(CoordinatorId),
    CONSTRAINT FK_Coordinator_Person_PersonId FOREIGN KEY(PersonId)
        REFERENCES Person(PersonId),
    CONSTRAINT FK_Coordinator_Event_EventId FOREIGN KEY(EventId)
        REFERENCES Event(EventId)
);


CREATE TABLE Registration (
    RegistrationId INTEGER IDENTITY (1,1),
    PersonId INTEGER,
    EventId INTEGER,
    RegistrationStatus VARCHAR (100)
        CONSTRAINT DF_Registration_RegistrationStatus DEFAULT 'NotCheckedIn',


    CONSTRAINT PK_Registration_RegistrationId PRIMARY KEY(RegistrationId),
    CONSTRAINT FK_Registration_Person_PersonId FOREIGN KEY(PersonId)
        REFERENCES Person(PersonId),
    CONSTRAINT FK_Registration_Event_EventId FOREIGN KEY(EventId)
        REFERENCES Event(EventId),
    CONSTRAINT CK_Registration_RegistrationStatus
        CHECK (RegistrationStatus IN ('CheckedIn', 'NotCheckedIn', 'Cancelled')),
    CONSTRAINT UQ_Registration_PersonId_EventId UNIQUE(PersonId, EventId)


);

CREATE TABLE MealPreference (
    RegistrationId INTEGER NOT NULL,
    IsVegetarian BIT NOT NULL,
    IsDrinking BIT NOT NULL,

    CONSTRAINT FK_MealPreference_Registration_RegistrationId FOREIGN KEY (RegistrationId)
        REFERENCES Registration(RegistrationId),
);
