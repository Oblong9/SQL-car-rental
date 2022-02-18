-- @BLOCK
CREATE TABLE Users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    state_code VARCHAR(2),
    first_name VARCHAR(15),
    last_name VARCHAR(15),
    age INT (3),
    home_address VARCHAR(255),
    phone INT(10)
);

-- @BLOCK
INSERT INTO Users(email, state_code, first_name, last_name, age, home_address, phone)
VALUES 
    ('carlover123@gmail.com', 'NJ', 'KYLE', 'RIDER', 27, '354 Home Add', 1234567890),
    ('vroomvroom@gmail.com', 'NY', 'DEVIN', 'CRANK', 45, '123 More Houses', 1234567891),
    ('mannualzforlife@gmail.com', 'CA', 'ASHLEY', 'MANNUAL', 31, '40 Car Road', 1234567892),
    ('taxigirl@gmail.com', 'MI', 'CARLY', 'WHEELZ', 55, '651 Cab Lane', 1234567893);

-- @BLOCK
SELECT * FROM Users;

-- @BLOCK
CREATE TABLE Cars(
    id INT PRIMARY KEY AUTO_INCREMENT,
    car_brand VARCHAR(255),
    car_type VARCHAR(20),
    transmission VARCHAR(4),
    seats INT(2),
    daily_rate FLOAT,
    details TEXT,
    available BOOLEAN,
    vin VARCHAR(255) NOT NULL UNIQUE,
    year INT (4),
    license_plate VARCHAR(6) NOT NULL UNIQUE
);
-- @BLOCK 
INSERT INTO Cars(car_brand, car_type, transmission, seats, daily_rate, available, vin, license_plate)
VALUES 
    ('Volkswagen', 'Sedan', 'Auto', 5, 30.15, TRUE, 'abc123456789', 'ABC123'),
    ('Toyota', 'Sedan', 'Auto', 4, 20.00, TRUE, 'abc123456788', 'ABC124'),
    ('Toyota' , 'Hatchback', 'Auto', 5, 31.25, FALSE, 'abc123456777', 'ABC125'),
    ('Honda', 'Sedan', 'Man', 5, 15.75, TRUE, 'abc123456666', 'ABC126'),
    ('Hyundai', 'Hatchback', 'Man', 4, 35.15, FALSE, 'abc123455555', 'ABC127'),
    ('Ford', 'Truck', 'Auto', 5, 45.00, TRUE, 'abc123444444', 'ABC128'),
    ('Ford', 'Truck', 'EV', 7, 55.50, FALSE, 'abc123333333', 'ABC129'),
    ('Ford', 'Coupe', 'Man', 5, 60.45, TRUE, 'abc12222222', 'ABC130'),
    ('Audi', 'Sedan', 'Auto', 5, 37.15, TRUE, 'abc111111111', 'ABC131');

-- @BLOCK
SELECT * FROM Cars;

-- @BLOCK
SELECT car_brand, car_type, transmission, seats, daily_rate, available FROM cars
WHERE seats > 4
AND available = TRUE
ORDER BY seats DESC;

-- @BLOCK
CREATE TABLE LOCATIONS(
    id INT PRIMARY KEY AUTO_INCREMENT,
    num_of_cars INT,
    name VARCHAR(255)
);

-- @BLOCK
INSERT INTO LOCATIONS(name, num_of_cars)
VALUES
    ('Los Angeles', 4),
    ('New York', 3),
    ('Chicago', 2);

-- @BLOCK
SELECT * FROM LOCATIONS;

-- @BLOCK
CREATE TABLE Reservations(
    id INT AUTO_INCREMENT,
    driver_id INT NOT NULL,
    car_id INT NOT NULL,
    location_id INT NOT NULL,
    begin_date DATETIME,
    end_date DATETIME,
    price FLOAT,
    total FLOAT,
    created DATETIME,
    PRIMARY KEY (id),
    FOREIGN KEY (driver_id) REFERENCES Users(id),
    FOREIGN KEY (car_id) REFERENCES Cars(id),
    FOREIGN KEY (location_id) REFERENCES LOCATIONS(id)
);
-- @BLOCK
INSERT INTO Reservations(driver_id, car_id, location_id, begin_date, end_date, price)
VALUES
    ('1', '2', '1', '2022-03-15 10:00:00', '2022-03-20 10:00:00', 125),
    ('3', '8', '3', '2022-04-01 10:00:00', '2022-04-15 10:00:00', 735),
    ('4', '1', '3', '2022-03-10 10:00:00', '2022-03-11 10:00:00', 70),
    ('2', '6', '2', '2022-06-09 10:00:00', '2022-03-16 10:00:00', 560);

-- @BLOCK
SELECT * FROM Reservations;

-- @BLOCK
SELECT * FROM Users
Inner JOIN Reservations
ON Reservations.driver_id = Users.id
ORDER BY Reservations.id ASC;