-- Create User table
CREATE TABLE User (
  UserID INT PRIMARY KEY,
  Username VARCHAR(30) NOT NULL,
  Password VARCHAR(30) NOT NULL,
  Email VARCHAR(50) NOT NULL,
  Role VARCHAR(20) NULL,  -- Changed to NULL
  CreatedAt DATETIME NOT NULL,
  UpdatedAt DATETIME NOT NULL
);

-- Create Admin table
CREATE TABLE Admin (
  AdminID INT PRIMARY KEY,
  Username VARCHAR(30) NOT NULL,
  Password VARCHAR(30) NOT NULL,
  Email VARCHAR(50) NOT NULL,  -- Remains NOT NULL
  CreatedAt DATETIME NOT NULL,
  UpdatedAt DATETIME NOT NULL
);

-- Create StudyPlan table
CREATE TABLE StudyPlan (
  StudyPlanID INT PRIMARY KEY,
  UserID INT NOT NULL,
  PlanDetails TEXT NULL,  -- Changed to NULL
  CreatedAt DATETIME NOT NULL,
  UpdatedAt DATETIME NOT NULL,
  FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Create Task table
CREATE TABLE Task (
  TaskID INT PRIMARY KEY,
  UserID INT NOT NULL,
  Title VARCHAR(100) NOT NULL,
  Description TEXT NULL,  -- Changed to NULL
  DueDate DATETIME NULL,  -- Changed to NULL
  Status VARCHAR(20) NULL,  -- Changed to NULL
  CreatedAt DATETIME NOT NULL,
  UpdatedAt DATETIME NOT NULL,
  FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Create Notification table
CREATE TABLE Notification (
  NotificationID INT PRIMARY KEY,
  UserID INT NOT NULL,
  Message TEXT NULL,  -- Changed to NULL
  IsRead BOOLEAN NOT NULL,
  CreatedAt DATETIME NOT NULL,
  FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Create Progress table
CREATE TABLE Progress (
  ProgressID INT PRIMARY KEY,
  UserID INT NOT NULL,
  StudyPlanID INT NOT NULL,
  Achievements TEXT NULL,  -- Changed to NULL
  CreatedAt DATETIME NOT NULL,
  UpdatedAt DATETIME NOT NULL,
  FOREIGN KEY (UserID) REFERENCES User(UserID),
  FOREIGN KEY (StudyPlanID) REFERENCES StudyPlan(StudyPlanID)
);

-- Create Resource table
CREATE TABLE Resource (
  ResourceID INT PRIMARY KEY,
  Title VARCHAR(100) NOT NULL,
  URL VARCHAR(200) NOT NULL,
  Type VARCHAR(50) NULL,  -- Changed to NULL
  CreatedAt DATETIME NOT NULL,
  UpdatedAt DATETIME NOT NULL
);

-- Create Whiteboard table
CREATE TABLE Whiteboard (
  WhiteboardID INT PRIMARY KEY,
  UserID INT NOT NULL,
  Content TEXT NULL,  -- Changed to NULL
  CreatedAt DATETIME NOT NULL,
  UpdatedAt DATETIME NOT NULL,
  FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Create Video table
CREATE TABLE Video (
  VideoID INT PRIMARY KEY,
  UserID INT NOT NULL,
  WhiteboardID INT NOT NULL,  -- Remains NOT NULL
  VideoURL VARCHAR(200) NOT NULL,
  CreatedAt DATETIME NOT NULL,
  UpdatedAt DATETIME NOT NULL,
  FOREIGN KEY (UserID) REFERENCES User(UserID),
  FOREIGN KEY (WhiteboardID) REFERENCES Whiteboard(WhiteboardID)
);

-- Create Recommendation table
CREATE TABLE Recommendation (
  RecommendationID INT PRIMARY KEY,
  UserID INT NOT NULL,
  ResourceID INT NOT NULL,
  Reason TEXT NULL,  -- Changed to NULL
  CreatedAt DATETIME NOT NULL,
  FOREIGN KEY (UserID) REFERENCES User(UserID),
  FOREIGN KEY (ResourceID) REFERENCES Resource(ResourceID)
);