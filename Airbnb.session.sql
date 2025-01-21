-- @bock
create table Users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    bio TEXT, 
    country VARCHAR(2)
);

-- @block
INSERT INTO Users (email, bio, country)
VALUES
 ('code@asia.com', 'developer', 'NA'),
 ('beli@world.com', 'mat', 'MA'),
 ('speed@ishow.com', 'bar', 'MO'),
 ('oli@care0.com', 'baz', 'AS'),
 ('kud@mial.com', 'officer', 'SA'),
 ('uui@asco.com', 'librarian', 'CA'),
 ('shika@mre.com', 'driver', 'US');

 -- @bock
 SELECT * FROM Users;

 -- @block 
-- wanting to retrive specific rows 

 SELECT email, id FROM Users;


 -- @block
-- limiting

SELECT email, id FROM users
LIMIT 3;

-- @block

-- limiting(SORTING Results)

SELECT email, id FROM users
WHERE country = 'NA'--where clause
ORDER BY id DESC
LIMIT 1;

-- @block

SELECT email, id FROM users
WHERE country = 'NA'
AND email LIKE 'c%'

ORDER BY id DESC
LIMIT 1;

--database index

-- @block
CREATE INDEX email_index ON Users(email);


-- Rooms table
-- @block
CREATE TABLE Rooms(
    id INT AUTO_INCREMENT,
    street VARCHAR(255),
    owner_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES Users(id)
)

-- @block 

INSERT INTO Rooms (owner_id, street)
VALUES 
(1, 'Independence Avenue'),
(1, 'Newcastle street'),
(3, 'John Menert street'),
(5, 'Orban street'),
(6, 'Clemence Kapuuo street'),
(4, 'Gadafi street'),
(1, 'Jckson K street'),
(3, 'Luxury Hill street'),
(2, 'Gordon Ramsey street'),
(4, 'London street'),
(6, 'Robert Mugabe avenue'),
(5, 'Moses Garueb street'),
(7, 'Eveline street'),
(3, 'octagon Kapuuo street'),
(7, 'Gusto street'),
(6, 'vitinua street');

-- SQL JOINS
-- @block
-- to query users who own rooms
-- reading data from 2 different tables

-- performing an inner join for users associated rooms 

SELECT * FROM users
INNER JOIN rooms
ON Rooms.owner_id = Users.id;

-- Performing a Left join for users who don't have an asccociated room
-- @block 
SELECT * FROM users
LEFT JOIN rooms
ON Rooms.owner_id = Users.id;

-- @block
--Full Outer Join is not suppoter in mysql databases
SELECT * FROM Users
FULL OUTER JOIN Rooms
ON Rooms.owner_id = Users.id;

-- SQL Aliases
-- @block
SELECT
    Users.id AS users_id,
    Rooms.id AS room_id,
    email,
    street
FROM Users
INNER JOIN Rooms ON Rooms.owner_id;



--Reservations/Booking table
-- @block
CREATE TABLE Bookings(
    id INT AUTO_INCREMENT,
    guest_id INT NOT NULL,
    room_id INT NOT NULL,
    check_in DATETIME,
    PRIMARY KEY(id),
    FOREIGN KEY (guest_id) REFERENCES Users(id), -- user has booked many rooms
    FOREIGN KEY (room_id) REFERENCES Rooms(id) -- room has been booked by users
)

-- Rooms a users has booked
-- @block
SELECT
   guest_id,
   street,
   check_in
FROM Bookings
INNER JOIN Rooms ON Rooms.owner_id = guest_id
WHERE guest_id = 1;

-- Getting the history of guests who stayed in a room

-- @block
SELECT
   room_id,
   guest_id,
   email,
   bio
FROM Bookings
INNER JOIN Users ON Users.id = guest_id
WHERE room_id = 2; --(filtering)join users for room 2

-- no work

-- @bock
create table Users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    bio TEXT, 
    country VARCHAR(2)
);






