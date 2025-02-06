DROP DATABASE IF EXISTS sbb_showcase;
CREATE DATABASE sbb_showcase;
USE sbb_showcase;

CREATE TABLE vehicles(
id INT AUTO_INCREMENT PRIMARY KEY,
vehicle_type VARCHAR(100) NOT NULL,
vehicle_number VARCHAR(25),
passenger_seats INT,
max_allowed_speed INT,
type VARCHAR(100),
image_url VARCHAR(255)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/rollmaterial_sbb.csv'
INTO TABLE vehicles
FIELDS TERMINATED BY ','
LINES TERMINATED BY 0x0d0a
(@vehicle_type,@vehicle_number,@seats,@max_allowed_speed)
SET vehicle_type = @vehicle_type,vehicle_number = @vehicle_number,passenger_seats = @seats,max_allowed_speed = @max_allowed_speed;
UPDATE vehicles
SET vehicle_type = 'RABe 511 6' WHERE vehicle_type LIKE '%RABe 511 6%';
UPDATE vehicles
SET type = 'Lokomotive' WHERE passenger_seats = 0;
UPDATE vehicles
SET type = 'Wagen' WHERE vehicle_type NOT LIKE 'R%';
UPDATE vehicles 
SET type = 'Triebfahrzeug' WHERE vehicle_type LIKE 'RA%';
UPDATE vehicles
SET vehicle_type = 'B EWIV' WHERE vehicle_type LIKE 'B EWIV%';
UPDATE vehicles
SET vehicle_type = 'RABe 524 TILO 6-Teilig' WHERE vehicle_type LIKE 'RABe 524 TILO 6';
UPDATE vehicles
SET vehicle_type = 'RABe 524 TILO 4-Teilig' WHERE vehicle_type LIKE 'RABe 524 TILO 4';
UPDATE vehicles
SET vehicle_type = 'RABe 523' WHERE vehicle_type LIKE 'RABe 523%';
UPDATE vehicles
SET vehicle_type = 'RABe 521' WHERE vehicle_type LIKE 'RABe 521%';
UPDATE vehicles
SET vehicle_type = 'RABe 522' WHERE vehicle_type LIKE 'RABe 522%';
UPDATE vehicles
SET vehicle_type = 'RABe 501 "Giruno"' WHERE vehicle_type LIKE 'RABe 501';