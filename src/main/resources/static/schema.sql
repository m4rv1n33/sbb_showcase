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
SET image_url = CASE
    WHEN vehicle_type LIKE 'RABDe 500 ICN' THEN '/images/RABDe500.jpg'
    WHEN vehicle_type LIKE 'RABDe 502 IC200' THEN '/images/RABDe502.jpg'
    WHEN vehicle_type LIKE 'RABe 501' THEN '/images/RABe501.jpg'
    WHEN vehicle_type LIKE 'RABe 502 IR100' THEN '/images/RABe502-4.jpg'
    WHEN vehicle_type LIKE 'RABe 502 IR200' THEN '/images/RABe502-8.jpg'
    WHEN vehicle_type LIKE 'RABe 503' THEN '/images/RABe503.jpg'
    WHEN vehicle_type LIKE 'RABe 511 4' THEN '/images/RABe511-4.jpg'
    WHEN vehicle_type LIKE 'RABe 511 6' THEN '/images/RABe511-6.jpg'
    WHEN vehicle_type LIKE 'RABe 514' THEN '/images/RABe514.jpg'
    WHEN vehicle_type LIKE 'RABe 520' THEN '/images/RABe520.jpg'
    WHEN vehicle_type LIKE 'RABe 521%' THEN '/images/RABe521.jpg'
    WHEN vehicle_type LIKE 'RABe 522%' THEN '/images/RABe522.jpg'
    WHEN vehicle_type LIKE 'RABe 523%' THEN '/images/RABe523.jpg'
    WHEN vehicle_type LIKE 'RABe 524 TILO 4' THEN '/images/RABe524-4.jpg'
    WHEN vehicle_type LIKE 'RABe 524 TILO 6' THEN '/images/RABe524-6.jpg'
    WHEN vehicle_type LIKE 'Re 420' THEN '/images/Re420.jpg'
    WHEN vehicle_type LIKE 'Re 450' THEN '/images/Re450.jpg'
    WHEN vehicle_type LIKE 'Re 460' THEN '/images/Re460.jpg'
    ELSE image_url
END;

UPDATE vehicles
SET vehicle_type = 'RABe 524 - "Flirt" TILO 6-Teilig' WHERE vehicle_type LIKE 'RABe 524 TILO 6';
UPDATE vehicles
SET vehicle_type = 'RABe 524 - "Flirt" TILO 4-Teilig' WHERE vehicle_type LIKE 'RABe 524 TILO 4';
UPDATE vehicles
SET vehicle_type = 'RABe 523' WHERE vehicle_type LIKE 'RABe 523%';
UPDATE vehicles
SET vehicle_type = 'RABe 521' WHERE vehicle_type LIKE 'RABe 521%';
UPDATE vehicles
SET vehicle_type = 'RABe 522' WHERE vehicle_type LIKE 'RABe 522%';
UPDATE vehicles
SET vehicle_type = 'RABe 501 - "Giruno"' WHERE vehicle_type LIKE 'RABe 501';
UPDATE vehicles
SET vehicle_type = 'RABe 514 - "DTZ"' WHERE vehicle_type LIKE 'RABe 514';
UPDATE vehicles
SET vehicle_type = 'RABe 503 - "Astoro"' WHERE vehicle_type LIKE 'RABe 503';
UPDATE vehicles
SET vehicle_type = 'RABe 523 - "Flirt 3"' WHERE vehicle_type LIKE 'RABe 523';
UPDATE vehicles
SET vehicle_type = 'RABe 522 - "Flirt France"' WHERE vehicle_type LIKE 'RABe 522';
UPDATE vehicles
SET vehicle_type = 'RABe 514 - "DTZ"' WHERE vehicle_type LIKE 'RABe 514';
UPDATE vehicles
SET vehicle_type = 'RABe 521 - "Flirt"' WHERE vehicle_type LIKE 'RABe 521';
UPDATE vehicles
SET vehicle_type = 'RABe 520 - "GTW"' WHERE vehicle_type LIKE 'RABe 520';
UPDATE vehicles
SET vehicle_type = 'RABe 511 - "KISS" 4-Teilig' WHERE vehicle_type LIKE 'RABe 511 4';
UPDATE vehicles
SET vehicle_type = 'RABe 511 - "KISS" 6-Teilig' WHERE vehicle_type LIKE 'RABe 511 6';
UPDATE vehicles
SET vehicle_type = 'RABe 502 - "FV-Dosto" 4-Teilig' WHERE vehicle_type LIKE 'RABe 502 IR100';
UPDATE vehicles
SET vehicle_type = 'RABe 502 - "FV-Dosto" 8-Teilig' WHERE vehicle_type LIKE 'RABe 502 IR200';
UPDATE vehicles
SET vehicle_type = 'RABDe 502 - "FV-Dosto" 8-Teilig mit Gepäckabteil' WHERE vehicle_type LIKE 'RABDe 502 IC200';
UPDATE vehicles
SET vehicle_type = 'RABDe 500 - "ICN"' WHERE vehicle_type LIKE 'RABDe 500 ICN';
UPDATE vehicles
SET vehicle_type = 'Re 450 - "DPZ"' WHERE vehicle_type LIKE 'RE 450';
UPDATE vehicles
SET vehicle_type = 'Re 420 - "Re 4/4 II"' WHERE vehicle_type LIKE 'Re 420';
UPDATE vehicles
SET vehicle_type = 'SBB EC BPM - "Reisezugwagen 2. Klasse"' WHERE vehicle_type LIKE 'Bpm EC RIC';
UPDATE vehicles
SET vehicle_type = 'SBB APM Pano - "Panoramawagen"' WHERE vehicle_type LIKE 'Apm Pano RIC';
UPDATE vehicles
SET vehicle_type = 'SBB EC APM - "Reisezugwagen 1. Klasse"' WHERE vehicle_type LIKE 'Apm EC RIC';
UPDATE vehicles
SET vehicle_type = 'SBB AD IC2000 - "IC2000 Business Class"' WHERE vehicle_type LIKE 'AD IC2000';
UPDATE vehicles
SET vehicle_type = 'SBB AS EW IV - "Speisewagen"' WHERE vehicle_type LIKE 'AS EWIV 200';
UPDATE vehicles
SET vehicle_type = 'AB DPZplus - "DPZ gemischt 1/2. Klasse"' WHERE vehicle_type LIKE 'AB DPZplus';
UPDATE vehicles
SET vehicle_type = 'Bt EW IV - "EW IV Steuerwagen"' WHERE vehicle_type LIKE 'Bt EWIV';
UPDATE vehicles
SET vehicle_type = 'Bt IC2000 - "IC2000 Steuerwagen"' WHERE vehicle_type LIKE 'Bt IC2000';
UPDATE vehicles
SET vehicle_type = 'B IC2000 - "IC2000 2. Klasse"' WHERE vehicle_type LIKE 'B IC2000';
UPDATE vehicles
SET vehicle_type = 'B DPZ NDW - "DPZ 2. Klasse"' WHERE vehicle_type LIKE 'B DPZ NDW';
UPDATE vehicles
SET vehicle_type = 'B HVZ - "HVZ-D 2. Klasse"' WHERE vehicle_type LIKE 'B HVZ';
UPDATE vehicles
SET vehicle_type = 'B EW IV - "EW IV 2. Klasse"' WHERE vehicle_type LIKE 'B EWIV';
UPDATE vehicles
SET vehicle_type = 'A IC2000 - "IC2000 1. Klasse"' WHERE vehicle_type LIKE 'A IC2000';
UPDATE vehicles
SET vehicle_type = 'A EW IV - "EW IV 1. Klasse"' WHERE vehicle_type LIKE 'A EWIV';
UPDATE vehicles
SET vehicle_type = 'Re 460 - "Lok 2000"' WHERE vehicle_type LIKE 'Re 460';
DELETE FROM vehicles WHERE vehicle_type = 'B EWI NPZ';
SELECT * FROM vehicles