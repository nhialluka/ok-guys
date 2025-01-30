/*                                    Energy Consumption Management System Project
                                              By NHIAL NHIAL LUKA DENG 
											 	 Reg No: 2309000417 
												University Of Kigali
                                                   Musanze Campus
				----------------------------------------------------------------------------------------

*/

-- create the database
create database Energy_Consumption_Management_System;



-- DCL: Create user and grant privileges
CREATE USER 'Nhial_2309000417'@'127.0.0.1' IDENTIFIED BY '2309000417';
grant all privileges on cardealership.* to 'Nhial_2309000417'@'127.0.0.1';

flush privileges;



-- Use database 
Use Energy_Consumption_Management_System;



-- create user table to store user information.
create table Users (
User_ID INT AUTO_INCREMENT PRIMARY KEY,
User_Name varchar(50) not null,
User_Email varchar(50) not null,
User_Password varchar(100) not null
);


-- create DeviceTypes table to categorize devices.
create table DeviceTypes (
DeviceType_ID int auto_increment primary key,
DeviceType_Name varchar(100) not null
);


-- create Devices table to track devices being monitored.
create table Devices (
Device_ID int auto_increment primary key,
Device_Name varchar(50) not null,
DeviceType_ID int,
User_ID int,
foreign key (User_ID) REFERENCES Users(User_ID),
foreign key  (DeviceType_ID) references DeviceTypes(DeviceType_ID)
);


-- Create EnergyConsumption table to record energy usage.
create table EnergyConsumption (
Record_ID int auto_increment primary key,
Device_ID int,
ConsumptionDate datetime not null,
EnergyUsed float not null,
foreign key (Device_ID) references Devices(Device_ID)
);


-- create Tips table to store energy-saving tips.
create table Tips (
Tip_ID int auto_increment primary key,
TipDescription text not null
);

-- create UserPreferences table to store user-specific preferences.
create table UserPreferences (
Preference_ID int auto_increment primary key,
Preference_Name varchar(50) not null,
Preference_Value varchar(50) not null,
User_ID int,
foreign key (User_ID) references Users(User_ID)
);


-- create Alerts table to manage user notifications.
create table Alerts (
Alert_ID int auto_increment primary key,
Alert_Message text not null,
Alert_Date datetime not null,
User_ID int,
foreign key (User_ID) references Users(User_ID)
);


-- create Reports table to store generated reports.
create table Reports (
Report_ID int auto_increment primary key,
Report_Date datetime not null,
Report_Content text not null,
User_ID int,
foreign key (User_ID) references Users(User_ID)
);


-- create DeviceEnergyRatings table to store energy ratings.
create table DeviceEnergyRatings (
Rating_ID int auto_increment primary key,
Energy_Rating varchar(50),
DeviceType_ID int,
foreign key (DeviceType_ID) references DeviceTypes(DeviceType_ID)
);


-- create ActivityLogs table to track user activities.
create table ActivityLogs (
Log_ID int auto_increment primary key,
Activity_Description text not null,
Activity_Date date,
User_ID int,
foreign key (User_ID) references Users(User_ID)
);

-- create EnergyPrice table to store energy prices for different periods.
create table EnergyPrice (
Price_ID int auto_increment primary key,
Price_Date date not null,
Price_PerUnit float 
);


-- create ConsumptionForecast table to store forecasted energy consumption.
create table ConsumptionForecast (
Forecast_ID int auto_increment primary key,
ForecastDate date not null,
Forecasted_Energy float not null,
Device_ID int,
foreign key (Device_ID) references Devices(Device_ID)
);


-- create WeatherData table to store weather information (useful for energy consumption analysis).
create table WeatherData (
Weather_ID int auto_increment primary key,
Weathe_rDate date not null,
Temperature float not null,
Humidity float not null
);


-- create MonthlySummaries table to store monthly summaries of energy consumption.
create table MonthlySummaries (
Summary_ID int auto_increment primary key,
Month_Year date not null,
Total_EnergyUsed float not null,
User_ID int,
foreign key (User_ID) references Users(User_ID)
);

-- create ApplianceProfiles table to store profiles of different appliance models and their typical energy usage.
create table ApplianceProfiles (
Profile_ID int auto_increment primary key,
Appliance_Model varchar(100) not null,
Average_EnergyUsage float not null
);


-- add column Gender in the Users table 
alter table Users
add column Gender varchar(10) not null;



-- NAME: NHIAL NHIAL LUKA DENG
-- REG NO: 2309000417


-- Insert records into Users table 
-- Insert sample records into Users table with the new Gender column
insert into Users (User_Name, User_Email, User_Password, Gender) 
values
('John Doe', 'john.doe@example.com', 'password123', 'Male'),
('Jane Smith', 'jane.smith@example.com', 'password456', 'Female'),
('Emily Johnson', 'emily.johnson@example.com', 'password789', 'Female'),
('Michael Brown', 'michael.brown@example.com', 'password321', 'Male'),
('Sarah Davis', 'sarah.davis@example.com', 'password654', 'Female');



-- Insert records into device types table
insert into DeviceTypes (DeviceType_Name)
values
('Refrigerator'),
('Washing Machine'),
('Air Conditioner'),
('Heater'),
('Lighting');



-- Insert records into devices table
insert into Devices (Device_Name, DeviceType_ID, User_ID) 
values
('LG Refrigerator', 1, 1),
('Samsung Washing Machine', 2, 1),
('Daikin Air Conditioner', 3, 2),
('Philips Heater', 4, 3),
('GE Lighting', 5, 4);



-- Insert records into energy consumption table
insert into EnergyConsumption (Device_ID, ConsumptionDate, EnergyUsed) 
values
(1, '2025-01-25 12:00:00', 12.5),
(2, '2025-01-25 12:30:00', 11.8),
(3, '2025-01-25 13:00:00', 32.4),
(4, '2025-01-25 13:30:00', 24.1),
(5, '2025-01-25 14:00:00', 10.9);



-- Insert records into tips table
insert into Tips (TipDescription) 
values
('Turn off lights when not in use'),
('Use energy-efficient appliances'),
('Unplug devices when not in use'),
('Lower thermostat settings in winter'),
('Use natural lighting during the day');



-- Insert records into user preferences table
insert into  UserPreferences (Preference_Name, Preference_Value, User_ID) 
values
('Notification', 'Enabled', 1),
('Dark Mode', 'Enabled', 2),
('Language', 'English', 3),
('Email Updates', 'Subscribed', 4),
('SMS Alerts', 'Enabled', 5);



-- Insert records into alerts table
insert into Alerts (Alert_Message, Alert_Date, User_ID) 
values
('High energy usage detected!', '2025-01-25 14:00:00', 1),
('Monthly energy report available', '2025-01-25 15:00:00', 2),
('New energy-saving tip available', '2025-01-25 16:00:00', 3),
('Device disconnected', '2025-01-25 17:00:00', 4),
('Energy consumption exceeded threshold', '2025-01-25 18:00:00', 5);



-- Insert records into reports table
insert into Reports (Report_Date, Report_Content, User_ID) 
values
('2025-01-25', 'Monthly energy consumption report', 1),
('2025-01-25', 'Weekly energy usage analysis', 2),
('2025-01-25', 'Daily energy report', 3),
('2025-01-25', 'Device performance summary', 4),
('2025-01-25', 'Energy efficiency report', 5);



-- Insert records into device energy ratings table
insert into DeviceEnergyRatings (Energy_Rating, DeviceType_ID) 
values
('A++', 1),
('A+', 2),
('A', 3),
('B+', 4),
('B', 5);



-- Insert records into activity logs table
insert into ActivityLogs (Activity_Description, Activity_Date, User_ID) 
values
('Logged in', '2025-01-25', 1),
('Updated device settings', '2025-01-25', 2),
('Viewed energy report', '2025-01-25', 3),
('Changed user preferences', '2025-01-25', 4),
('Received alert', '2025-01-25', 5);



-- Insert records into energy prices table
insert into EnergyPrice (Price_Date, Price_PerUnit) 
values
('2025-01-01', 0.25),
('2025-02-01', 0.26),
('2025-03-01', 0.27),
('2025-04-01', 0.28),
('2025-05-01', 0.29);



-- Insert records into consumption forecasts table
insert into ConsumptionForecast (ForecastDate, Forecasted_Energy, Device_ID) 
values
('2025-02-01', 2.8, 1),
('2025-02-02', 2.7, 2),
('2025-02-03', 3.0, 3),
('2025-02-04', 2.5, 4),
('2025-02-05', 1.9, 5);



-- Insert records into weather data table
insert into WeatherData (Weathe_rDate, Temperature, Humidity) 
values
('2025-01-25', 20.5, 60),
('2025-01-26', 22.3, 55),
('2025-01-27', 19.8, 65),
('2025-01-28', 21.0, 58),
('2025-01-29', 23.4, 52);



-- Insert records into monthly summaries table
insert into MonthlySummaries (Month_Year, Total_EnergyUsed, User_ID) 
values
('2025-01-01', 150, 1),
('2025-01-01', 170, 2),
('2025-01-01', 160, 3),
('2025-01-01', 140, 4),
('2025-01-01', 180, 5);



-- Insert records into appliance profiles table
insert into ApplianceProfiles (Appliance_Model, Average_EnergyUsage) 
values
('LG Model X', 1.5),
('Samsung Model Y', 2.2),
('Daikin Model Z', 3.0),
('Philips Model A', 1.8),
('GE Model B', 0.9);



-- NAME: NHIAL NHIAL LUKA DENG
-- REG NO: 2309000417


-- Update a user's email
update Users
set User_Email = 'new.email@example.com'
where User_ID = 1;

SELECT * FROM Users;



-- Join Users and Devices to get device names and user details
select Users.User_Name, Devices.Device_Name
from Users
join Devices on Users.User_ID = Devices.User_ID;



-- Create a view for user energy consumption summaries
create view UserEnergySummaries as
select Users.User_Name, SUM(EnergyConsumption.EnergyUsed) as TotalEnergyUsed
from Users
join Devices on Users.User_ID = Devices.User_ID
join EnergyConsumption on Devices.Device_ID = EnergyConsumption.Device_ID
 group by Users.User_Name;
 
 
 
 -- Total energy used by each user
select User_ID, SUM(EnergyUsed) as TotalEnergyUsed
from Devices
join EnergyConsumption on Devices.Device_ID = EnergyConsumption.Device_ID
 group by User_ID;
 
 
 
 -- Users with total energy consumption greater than 10 kWh
select User_ID, SUM(EnergyUsed) as TotalEnergyUsed
from Devices
join EnergyConsumption on Devices.Device_ID = EnergyConsumption.Device_ID
group by User_ID
having TotalEnergyUsed > 10;



-- List all devices ordered by their energy usage in descending order
select Devices.Device_Name, SUM(EnergyUsed) as TotalEnergyUsed
from Devices
join EnergyConsumption on Devices.Device_ID = EnergyConsumption.Device_ID
group by Devices.Device_Name
order by TotalEnergyUsed desc;



-- Average energy consumption per device type
select DeviceTypes.DeviceType_Name, avg(EnergyUsed) as AverageEnergyUsed
from DeviceTypes
join Devices on DeviceTypes.DeviceType_ID = Devices.DeviceType_ID
join EnergyConsumption on Devices.Device_ID = EnergyConsumption.Device_ID
group by DeviceTypes.DeviceType_Name;



-- Total energy consumption for a user
select u.User_Name, SUM(ec.EnergyUsed) as TotalEnergyUsed
from Users u
join Devices d ON u.User_ID = d.User_ID
join EnergyConsumption ec ON d.Device_ID = ec.Device_ID
where u.User_ID = 1
group by u.User_Name;



-- Number of devices for each user
select User_ID, COUNT(Device_ID) as NumberOfDevices
from Devices
group by User_ID;



-- Maximum energy consumption recorded by any device
select MAX(EnergyUsed) as MaxEnergyUsed
from EnergyConsumption;



-- Minimum energy consumption recorded by any device
select MIN(EnergyUsed) as MinEnergyUsed
from EnergyConsumption;



-- Total energy consumption for a specific user
select SUM(EnergyUsed) as TotalEnergyUsed
from Devices
join EnergyConsumption on Devices.Device_ID = EnergyConsumption.Device_ID
where User_ID = 1;



 -- Select all energy consumption records for a specific device
select * from EnergyConsumption
where Device_ID = 1;



-- NAME: NHIAL NHIAL LUKA DENG
-- REG NO: 2309000417


DELIMITER //
create procedure RecordEnergyConsumption (
    in p_DeviceID int,
    in p_ConsumptionDate datetime,
    in p_EnergyUsed float
)
BEGIN
    insert into EnergyConsumption (Device_ID, ConsumptionDate, EnergyUsed)
    values (p_DeviceID, p_ConsumptionDate, p_EnergyUsed);
END //

DELIMITER ;
-- call
call RecordEnergyConsumption(1, '2025-01-26 15:00:00', 2.4);



-- generating a User Energy Report
DELIMITER //

create procedure GenerateUserEnergyReport (
    in p_UserID int
)
BEGIN
    select Users.User_Name, SUM(EnergyConsumption.EnergyUsed) as TotalEnergyUsed
    from Users
    join Devices on Users.User_ID = Devices.User_ID
    join EnergyConsumption on Devices.Device_ID = EnergyConsumption.Device_ID
    where Users.User_ID = p_UserID
    group by Users.User_Name;
END //

DELIMITER ;
-- call
call GenerateUserEnergyReport(1);



-- Updating User Preferences
DELIMITER //

create procedure UpdateUserPreference (
    in p_UserID int,
    in p_PreferenceName varchar(50),
    in p_PreferenceValue varchar(50)
)
BEGIN
    update UserPreferences
    set Preference_Value = p_PreferenceValue
    where User_ID = p_UserID and Preference_Name = p_PreferenceName;
END //

DELIMITER ;
-- call
call UpdateUserPreference(1, 'Notification', 'Disabled');



-- Triggers and Its Statements
-- After insert
DELIMITER //

create trigger AfterDeviceInsert
after insert on Devices
for each row 
BEGIN
    insert into ActivityLogs (Activity_Description, Activity_Date, User_ID)
    values ('New device added', NOW(), NEW.User_ID);
END //

DELIMITER ;



-- After update
DELIMITER //

create trigger AfterDeviceUpdate
after update on Devices
for each row 
BEGIN
    insert into ActivityLogs (Activity_Description, Activity_Date, User_ID)
    values ('Device updated', NOW(), NEW.User_ID);
END //

DELIMITER ;


-- After delete
DELIMITER //

create trigger AfterDeviceDelete
after delete on Devices
for each row 
BEGIN
    insert into ActivityLogs (Activity_Description, Activity_Date, User_ID)
    values ('Device deleted', NOW(), OLD.User_ID);
END //

DELIMITER ;




-- NAME: NHIAL NHIAL LUKA DENG
-- REG NO: 2309000417
























