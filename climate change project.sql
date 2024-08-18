SELECT * FROM climate.indianweatherrepository;
SELECT 
    region,
    uv_index,
    temperature_celsius,
    last_updated
FROM 
    climate.indianweatherrepository;
    
    SELECT 
    last_updated,
    location_name,
    ROUND(temperature_celsius,2) AS R_temperature,
    ROUND(air_quality_Carbon_Monoxide,2) AS R_CO,
    ROUND(air_quality_Ozone,2) AS R_O3,
    ROUND(air_quality_Nitrogen_dioxide,2) AS R_NO2,
    ROUND(air_quality_Sulphur_dioxide,2) AS R_SO2
FROM 
    climate.indianweatherrepository
WHERE 
    location_name IN ('Mumbai', 'New Delhi', 'Bangalore', 'Pune', 'Chennai');
    
        SELECT 
	last_updated,
    location_name,
    ROUND(temperature_celsius,2) AS R_temperature,
    ROUND(air_quality_Carbon_Monoxide,2) AS R_CO,
    ROUND(air_quality_Ozone,2) AS R_O3,
    ROUND(air_quality_Nitrogen_dioxide,2) AS R_NO2,
    ROUND(air_quality_Sulphur_dioxide,2) AS R_SO2
FROM 
    climate.indianweatherrepository
WHERE 
    location_name IN ('Goa', 'Puducherry', 'Surat', 'Kollam', 'Thiruvananthapuram');
    
SELECT 
    last_updated,
    location_name,
    ROUND(air_quality_PM10,2) AS PM10,
    ROUND(air_quality_PM25,2) AS PM25
FROM 
    climate.indianweatherrepository
ORDER BY 
    PM10 DESC, PM25 DESC
LIMIT 10;

SELECT 
    last_updated,
    location_name,
    ROUND(air_quality_PM10,2) AS PM10,
    ROUND(air_quality_PM25,2) AS PM25
FROM 
    climate.indianweatherrepository
ORDER BY 
    PM10 ASC, PM25 ASC
LIMIT 10;


SELECT 
    t.last_updated,
    t.location_name,
    t.`air_quality_us-epa-index`,
    t.`air_quality_gb-defra-index`
FROM 
    (
        SELECT 
            location_name,
            MAX(`air_quality_us-epa-index`) AS `air_quality_us-epa-index`,
            MAX(`air_quality_gb-defra-index`) AS `air_quality_gb-defra-index`
        FROM 
            climate.indianweatherrepository
        GROUP BY 
            location_name
    ) AS max_values
    INNER JOIN climate.indianweatherrepository AS t
    ON max_values.location_name = t.location_name
    AND max_values.`air_quality_us-epa-index` = t.`air_quality_us-epa-index`
    AND max_values.`air_quality_gb-defra-index` = t.`air_quality_gb-defra-index`
ORDER BY 
    max_values.`air_quality_us-epa-index` DESC, max_values.`air_quality_gb-defra-index` DESC
LIMIT 10;

SELECT 
    t.last_updated,
    t.location_name,
    t.`air_quality_us-epa-index`,
    t.`air_quality_gb-defra-index`
FROM 
    (
        SELECT 
            location_name,
            MIN(`air_quality_us-epa-index`) AS `air_quality_us-epa-index`,
            MIN(`air_quality_gb-defra-index`) AS `air_quality_gb-defra-index`
        FROM 
            climate.indianweatherrepository
        GROUP BY 
            location_name
    ) AS min_values
    INNER JOIN climate.indianweatherrepository AS t
    ON min_values.location_name = t.location_name
    AND min_values.`air_quality_us-epa-index` = t.`air_quality_us-epa-index`
    AND min_values.`air_quality_gb-defra-index` = t.`air_quality_gb-defra-index`
ORDER BY 
    min_values.`air_quality_us-epa-index` ASC, min_values.`air_quality_gb-defra-index` ASC
LIMIT 10;

