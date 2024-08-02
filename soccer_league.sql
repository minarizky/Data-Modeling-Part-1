-- Soccer League Schema

CREATE TABLE Teams (
    TeamID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE Players (
    PlayerID INT PRIMARY KEY,
    Name VARCHAR(100),
    TeamID INT,
    FOREIGN KEY (TeamID) REFERENCES Teams(TeamID)
);

CREATE TABLE Matches (
    MatchID INT PRIMARY KEY,
    MatchDate DATE,
    HomeTeamID INT,
    AwayTeamID INT,
    FOREIGN KEY (HomeTeamID) REFERENCES Teams(TeamID),
    FOREIGN KEY (AwayTeamID) REFERENCES Teams(TeamID)
);

CREATE TABLE Goals (
    GoalID INT PRIMARY KEY,
    PlayerID INT,
    MatchID INT,
    Timestamp TIMESTAMP,
    FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID),
    FOREIGN KEY (MatchID) REFERENCES Matches(MatchID)
);

CREATE TABLE Referees (
    RefereeID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE MatchReferees (
    MatchRefereeID INT PRIMARY KEY,
    MatchID INT,
    RefereeID INT,
    FOREIGN KEY (MatchID) REFERENCES Matches(MatchID),
    FOREIGN KEY (RefereeID) REFERENCES Referees(RefereeID)
);

CREATE TABLE Seasons (
    SeasonID INT PRIMARY KEY,
    StartDate DATE,
    EndDate DATE
);

CREATE TABLE Standings (
    StandingID INT PRIMARY KEY,
    TeamID INT,
    SeasonID INT,
    Wins INT,
    Losses INT,
    Draws INT,
    Points INT,
    FOREIGN KEY (TeamID) REFERENCES Teams(TeamID),
    FOREIGN KEY (SeasonID) REFERENCES Seasons(SeasonID)
);

-- Sample Data for Soccer League

INSERT INTO Teams (TeamID, Name) VALUES
(1, 'Team A'),
(2, 'Team B');

INSERT INTO Players (PlayerID, Name, TeamID) VALUES
(1, 'Player 1', 1),
(2, 'Player 2', 2);

INSERT INTO Matches (MatchID, MatchDate, HomeTeamID, AwayTeamID) VALUES
(1, '2024-08-01', 1, 2);

INSERT INTO Goals (GoalID, PlayerID, MatchID, Timestamp) VALUES
(1, 1, 1, '2024-08-01 12:34:56'),
(2, 2, 1, '2024-08-01 12:56:34');

INSERT INTO Referees (RefereeID, Name) VALUES
(1, 'Referee 1'),
(2, 'Referee 2');

INSERT INTO MatchReferees (MatchRefereeID, MatchID, RefereeID) VALUES
(1, 1, 1),
(2, 1, 2);

INSERT INTO Seasons (SeasonID, StartDate, EndDate) VALUES
(1, '2024-01-01', '2024-12-31');

INSERT INTO Standings (StandingID, TeamID, SeasonID, Wins, Losses, Draws, Points) VALUES
(1, 1, 1, 10, 2, 3, 33),
(2, 2, 1, 8, 4, 3, 27);
