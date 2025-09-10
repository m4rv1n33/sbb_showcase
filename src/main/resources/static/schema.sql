DROP DATABASE IF EXISTS sbb_showcase;
CREATE DATABASE sbb_showcase;
USE sbb_showcase;

CREATE TABLE vehicles(
id INT AUTO_INCREMENT PRIMARY KEY,
vehicle_type VARCHAR(2000) NOT NULL,
vehicle_number VARCHAR(25),
passenger_seats INT,
max_allowed_speed INT,
length_over_buffer DECIMAL(10,2),
approved_countries VARCHAR(255) DEFAULT 'CH',
manufacturer VARCHAR(255),
year_built INT,
tractive_force_kn INT,
type VARCHAR(100),
image_url VARCHAR(255)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/rollmaterial_sbb.csv'
INTO TABLE vehicles
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
ESCAPED BY '"'
LINES TERMINATED BY '\r\n'
(@vehicle_type,@vehicle_number,@seats,@max_allowed_speed)
SET vehicle_type = @vehicle_type,
    vehicle_number = @vehicle_number,
    passenger_seats = @seats,
    max_allowed_speed = @max_allowed_speed;


UPDATE vehicles	
SET vehicle_type = 'RABe 511 6' WHERE vehicle_type LIKE '%RABe 511 6%';
UPDATE vehicles
SET type = 'Lokomotive' WHERE passenger_seats = 0;
UPDATE vehicles
SET type = 'Wagen' WHERE vehicle_type NOT LIKE 'R%';
UPDATE vehicles 
SET type = 'Triebzug' WHERE vehicle_type LIKE 'RA%';
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
    WHEN vehicle_type LIKE 'RABe 523%' THEN '/images/RABe523-1.jpg'
    WHEN vehicle_type LIKE 'RABe 524 TILO 4' THEN '/images/RABe524-4.jpg'
    WHEN vehicle_type LIKE 'RABe 524 TILO 6' THEN '/images/RABe524-6.jpg'
    WHEN vehicle_type LIKE 'Re 420' THEN '/images/Re420.jpg'
    WHEN vehicle_type LIKE 'Re 450' THEN '/images/Re450.jpg'
    WHEN vehicle_type LIKE 'Re 460' THEN '/images/Re460.jpg'
    WHEN vehicle_type LIKE 'bpm ec ric' THEN '/images/ec_bpm_ric.jpg'
	WHEN vehicle_type LIKE 'Apm Pano RIC' THEN '/images/sbb_apm_pano.jpg'
    WHEN vehicle_type LIKE 'Apm EC RIC' THEN '/images/sbb_apm_ec.jpg'
    WHEN vehicle_type LIKE 'A IC2000' THEN '/images/a_ic2000.jpg'
    WHEN vehicle_type LIKE 'AD IC2000' THEN '/images/ad_ic2000.jpg'
    WHEN vehicle_type LIKE 'AS EWIV 200' THEN '/images/as_ewiv.jpg'
    WHEN vehicle_type LIKE 'Bt EWIV' THEN '/images/bt_ewiv.jpg'
    WHEN vehicle_type LIKE 'Bt IC2000' THEN '/images/bt_ic2000.jpg'
    WHEN vehicle_type LIKE 'B IC2000' THEN '/images/b_ic2000.jpg'
    WHEN vehicle_type LIKE 'B EWIV' THEN '/images/b_ewiv.jpg'
    WHEN vehicle_type LIKE 'A EWIV' THEN '/images/a_ewiv.jpg'
    WHEN vehicle_type LIKE 'RABe 531 - "Flirt EVO"  Thurbo (CH/AT/DE)' THEN '/images/RABe531_D.jpg'
	WHEN vehicle_type LIKE 'RABe 532 - "Flirt EVO" (CH/FR)' THEN '/images/RABe532_F.jpg'
    WHEN vehicle_type LIKE 'RABe 533 - "Flirt EVO"' THEN '/images/RABe533.jpg'
    ELSE image_url
END;

UPDATE vehicles
SET vehicle_type = CASE 
	-- FLIRT and Regional Trains
    WHEN vehicle_type LIKE 'RABe 524 TILO 6' THEN 'RABe 524 - "Flirt" TILO 6-Teilig'
    WHEN vehicle_type LIKE 'RABe 524 TILO 4' THEN 'RABe 524 - "Flirt" TILO 4-Teilig'
	WHEN vehicle_type LIKE 'RABe 523%' THEN 'RABe 523 - "Flirt 3"'
    WHEN vehicle_type LIKE 'RABe 522%' THEN 'RABe 522 - "Flirt France"'
    WHEN vehicle_type LIKE 'RABe 521%' THEN 'RABe 521 - "Flirt"'
    WHEN vehicle_type LIKE 'RABe 520' THEN 'RABe 520 - "GTW"'
    
	-- Double Decker EMUs
    WHEN vehicle_type LIKE 'RABe 514' THEN 'RABe 514 - "DTZ"'
    WHEN vehicle_type LIKE 'RABe 511 4' THEN 'RABe 511 - "KISS" 4-Teilig'
    WHEN vehicle_type LIKE 'RABe 511 6' THEN 'RABe 511 - "KISS" 6-Teilig'
    WHEN vehicle_type LIKE 'RABe 502 IR100' THEN 'RABe 502 - "FV-Dosto" 4-Teilig'
    WHEN vehicle_type LIKE 'RABe 502 IR200' THEN 'RABe 502 - "FV-Dosto" 8-Teilig'
    WHEN vehicle_type LIKE 'RABDe 502 IC200' THEN 'RABDe 502 - "FV-Dosto" 8-Teilig mit Gepäckabteil'
    
    -- InterCity and EuroCity high-speed trains
    WHEN vehicle_type LIKE 'RABDe 500 ICN' THEN 'RABDe 500 - "ICN"'
    WHEN vehicle_type LIKE 'RABe 503' THEN 'RABe 503 - "Astoro"'
     WHEN vehicle_type LIKE 'RABe 501' THEN 'RABe 501 - "Giruno"'
    
    -- Locomotives
    WHEN LOWER(vehicle_type) LIKE 're 460' THEN 'Re 460 - "Lok 2000"'
    WHEN LOWER(vehicle_type) LIKE 're 450' THEN 'Re 450 - "DPZ"'
    WHEN LOWER(vehicle_type) LIKE 're 420' THEN 'Re 420 - "Re 4/4 II" - HVZ-D'
    
    -- Passenger Carriages
    WHEN vehicle_type LIKE 'Bpm EC RIC' THEN 'EC BPM - "Reisezugwagen 2. Klasse"'
    WHEN vehicle_type LIKE 'Apm Pano RIC' THEN 'APM Pano - "Panoramawagen"'
    WHEN vehicle_type LIKE 'Apm EC RIC' THEN 'EC APM - "Reisezugwagen 1. Klasse"'
    WHEN vehicle_type LIKE 'AD IC2000' THEN 'AD IC2000 - "IC2000 1. Klasse mit Gepäckabteil"'
    WHEN vehicle_type LIKE 'AS EWIV 200' THEN 'AS EW IV - "Speisewagen"'
    WHEN vehicle_type LIKE 'AB DPZplus' THEN 'AB DPZplus - "DPZ gemischt 1/2. Klasse"'
    WHEN vehicle_type LIKE 'Bt EWIV' THEN 'Bt EW IV - "EW IV Steuerwagen"'
    WHEN vehicle_type LIKE 'Bt IC2000' THEN 'Bt IC2000 - "IC2000 Steuerwagen"'
    WHEN vehicle_type LIKE 'B IC2000' THEN 'B IC2000 - "IC2000 2. Klasse"'
    WHEN vehicle_type LIKE 'B DPZ NDW' THEN 'B DPZ NDW - "DPZ 2. Klasse"'
    WHEN vehicle_type LIKE 'B HVZ' THEN 'B HVZ - "HVZ-D 2. Klasse"'
    WHEN vehicle_type LIKE 'B EWIV' THEN 'B EW IV - "EW IV 2. Klasse"'
    WHEN vehicle_type LIKE 'A IC2000' THEN 'A IC2000 - "IC2000 1. Klasse"'
    WHEN vehicle_type LIKE 'A EWIV' THEN 'A EW IV - "EW IV 1. Klasse"'
    ELSE vehicle_type
END;

UPDATE vehicles
SET passenger_seats = 
    CASE 
        WHEN vehicle_type = 'Re 450 - "DPZ"' THEN 387
        WHEN vehicle_type = 'Re 420 - "Re 4/4 II" - HVZ-D' THEN 556
        ELSE passenger_seats
    END;
UPDATE vehicles
SET length_over_buffer = 
    CASE
        -- Double Decker EMUs
        WHEN vehicle_type = 'RABe 514 - "DTZ"' THEN 100.00
        WHEN vehicle_type = 'RABe 511 - "KISS" 4-Teilig' THEN 100.36
        WHEN vehicle_type = 'RABe 511 - "KISS" 6-Teilig' THEN 150.00
        WHEN vehicle_type = 'RABe 502 - "FV-Dosto" 4-Teilig' THEN 100.00
        WHEN vehicle_type = 'RABe 502 - "FV-Dosto" 8-Teilig' THEN 200.00
        WHEN vehicle_type = 'RABDe 502 - "FV-Dosto" 8-Teilig mit Gepäckabteil' THEN 200.00
        WHEN vehicle_type = 'RABe 531 - "Flirt EVO"  Thurbo (CH/AT/DE)' THEN 73.50
        WHEN vehicle_type = 'RABe 532 - "Flirt EVO" (CH/FR)' THEN 73.50
        WHEN vehicle_type = 'RABe 533 - "Flirt EVO"' THEN 73.50
	        
        -- InterCity and EuroCity high-speed trains
        WHEN vehicle_type = 'RABe 501 - "Giruno"' THEN 202.00
        WHEN vehicle_type = 'RABDe 500 - "ICN"' THEN 188.70
        WHEN vehicle_type = 'RABe 503 - "Astoro"' THEN 187.40
        
        -- FLIRT and Regional Trains
        WHEN vehicle_type = 'RABe 524 - "Flirt" TILO 4-Teilig' THEN 74.00
        WHEN vehicle_type = 'RABe 524 - "Flirt" TILO 6-Teilig' THEN 107.00
        WHEN vehicle_type = 'RABe 523 - "Flirt 3"' THEN 74.00
        WHEN vehicle_type = 'RABe 521 - "Flirt"' THEN 74.00
        WHEN vehicle_type = 'RABe 522 - "Flirt France"' THEN 74.00
        WHEN vehicle_type = 'RABe 520 - "GTW"' THEN 52.50
        
        -- Locomotives
        WHEN vehicle_type = 'Re 450 - "DPZ"' THEN 18.40
        WHEN vehicle_type = 'Re 460 - "Lok 2000"' THEN 18.50
        WHEN vehicle_type = 'Re 420 - "Re 4/4 II" - HVZ-D' THEN 15.40
        
        -- Passenger Carriages
        WHEN vehicle_type = 'Bt IC2000 - "IC2000 Steuerwagen"' THEN 27.50
        WHEN vehicle_type = 'B IC2000 - "IC2000 2. Klasse"' THEN 26.80
        WHEN vehicle_type = 'A IC2000 - "IC2000 1. Klasse"' THEN 26.80
        WHEN vehicle_type = 'EC BPM - "Reisezugwagen 2. Klasse"' THEN 26.40
        WHEN vehicle_type = 'EC APM - "Reisezugwagen 1. Klasse"' THEN 26.40
        WHEN vehicle_type = 'APM Pano - "Panoramawagen"' THEN 26.40
        WHEN vehicle_type = 'AD IC2000 - "IC2000 1. Klasse mit Gepäckabteil"' THEN 27.50
        WHEN vehicle_type = 'AS EW IV - "Speisewagen"' THEN 26.40
        WHEN vehicle_type = 'AB DPZplus - "DPZ gemischt 1/2. Klasse"' THEN 26.80
        WHEN vehicle_type = 'Bt EW IV - "EW IV Steuerwagen"' THEN 26.40
        WHEN vehicle_type = 'B DPZ NDW - "DPZ 2. Klasse"' THEN 26.80
        WHEN vehicle_type = 'B HVZ - "HVZ-D 2. Klasse"' THEN 26.40
        WHEN vehicle_type = 'B EW IV - "EW IV 2. Klasse"' THEN 26.40
        WHEN vehicle_type = 'A EW IV - "EW IV 1. Klasse"' THEN 26.40
        ELSE length_over_buffer
    END;
INSERT INTO vehicles (vehicle_type, vehicle_number, passenger_seats, max_allowed_speed, length_over_buffer, approved_countries, manufacturer, year_built, tractive_force_kn, type, image_url) 
VALUES 
('RABe 512 - "KISS"', "94 85 0 512 001", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 002", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 003", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 004", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 005", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 006", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 007", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 008", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 009", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 010", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 011", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 012", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 013", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 014", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 015", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 016", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 017", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 018", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 019", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 020", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 021", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 022", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 023", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 024", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 025", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 026", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 027", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 028", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 029", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 030", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 031", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 032", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 033", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 034", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 035", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 036", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 037", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 038", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 039", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 040", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 041", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 042", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 043", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 044", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 045", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 046", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 047", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 048", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 049", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 050", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 051", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 052", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 053", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 054", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 055", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 056", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 057", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 058", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 059", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg"),
('RABe 512 - "KISS"', "94 85 0 512 060", 466, 160, 151.9, "CH", "Stadler", 2022, 150, "Triebzug", "/images/RABe512.jpg");

	
DELETE FROM vehicles WHERE vehicle_type = 'B EWI NPZ';
DELETE FROM vehicles WHERE vehicle_type = 'B DPZ NDW - "DPZ 2. Klasse"';
DELETE FROM vehicles WHERE vehicle_type = 'AB DPZplus - "DPZ gemischt 1/2. Klasse"';
DELETE FROM vehicles WHERE vehicle_type = 'B HVZ - "HVZ-D 2. Klasse"';

SELECT * FROM vehicles
ORDER BY 
    CASE 
        WHEN vehicle_type LIKE 'R%' THEN 1 
        ELSE 2 
    END, 
    vehicle_type;