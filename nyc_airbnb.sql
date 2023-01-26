-- What is the average price, per night, of an Airbnb listing in NYC?

SELECT
    AVG(REPLACE(price, 'dollars','')) AS usd
FROM airbnb_price


-- How many adverts are for private rooms?

SELECT
	room_type,
    COUNT(room_type)
FROM airbnb_room_type
WHERE room_type = 'private room'
GROUP BY
	room_type


-- How do Airbnb listing prices compare across the five NYC boroughs?

SELECT DISTINCT
    CASE 
		WHEN nbhood_full LIKE '%Manhattan%' THEN 'manhattan'
        WHEN nbhood_full LIKE '%Brooklyn%' THEN 'brooklyn'
        WHEN nbhood_full LIKE '%Queens%' THEN 'queens'
        WHEN nbhood_full LIKE '%Staten% %island%' THEN 'st_island'
        WHEN nbhood_full LIKE '%Bronx%' THEN 'bronx'
        ELSE NULL
        END AS boroughs,
	AVG(REPLACE(price, 'dollars','')) AS avg_price
FROM airbnb_price
GROUP BY boroughs

