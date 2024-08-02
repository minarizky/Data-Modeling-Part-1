-- Craigslist Schema

CREATE TABLE Regions (
    RegionID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    PreferredRegionID INT,
    FOREIGN KEY (PreferredRegionID) REFERENCES Regions(RegionID)
);

CREATE TABLE Posts (
    PostID INT PRIMARY KEY,
    Title VARCHAR(255),
    Text TEXT,
    UserID INT,
    Location VARCHAR(255),
    RegionID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (RegionID) REFERENCES Regions(RegionID)
);

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE PostCategories (
    PostCategoryID INT PRIMARY KEY,
    PostID INT,
    CategoryID INT,
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Sample Data for Craigslist

INSERT INTO Regions (RegionID, Name) VALUES
(1, 'San Francisco'),
(2, 'Atlanta'),
(3, 'Seattle');

INSERT INTO Users (UserID, Name, Email, PreferredRegionID) VALUES
(1, 'Alice', 'alice@example.com', 1),
(2, 'Bob', 'bob@example.com', 2);

INSERT INTO Posts (PostID, Title, Text, UserID, Location, RegionID) VALUES
(1, 'Bike for sale', 'A nice bike for sale', 1, 'Downtown', 1),
(2, 'Apartment available', 'Spacious apartment', 2, 'Midtown', 2);

INSERT INTO Categories (CategoryID, Name) VALUES
(1, 'For Sale'),
(2, 'Housing');

INSERT INTO PostCategories (PostCategoryID, PostID, CategoryID) VALUES
(1, 1, 1),
(2, 2, 2);
