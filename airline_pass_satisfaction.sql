USE airlinepassenger;

SELECT *
FROM airline_passenger_satisfaction;

SELECT
	COUNT(id) AS total_passengers
FROM airline_passenger_satisfaction

SELECT
	COUNT(satisfaction) AS count_of_responders,
    COUNT(id) AS total_passengers
FROM airline_passenger_satisfaction

-- Passengers by gender
SELECT
	gender,
    COUNT(id) AS num_by_gender
FROM airline_passenger_satisfaction
GROUP BY 1

-- Passengers by age
SELECT
	COUNT(CASE WHEN age < 18 THEN 1 END) AS 'children',
    COUNT(CASE WHEN age BETWEEN 18 and 30 THEN 1 END) AS 'young_adult',
    COUNT(CASE WHEN age BETWEEN 31 and 65 THEN 1 END) AS 'adult',
    COUNT(CASE WHEN age > 65 THEN 1 END) AS 'senior'
FROM airline_passenger_satisfaction

-- Passengers by customer type
SELECT
	customer_type,
    COUNT(*) AS num_by_customer_type
FROM airline_passenger_satisfaction
GROUP BY 1

-- Passengers by type of travel
SELECT
	type_of_travel,
    COUNT(*)
FROM airline_passenger_satisfaction
GROUP BY 1

-- Passengers by class of travel
SELECT
	class,
    COUNT(*)
FROM airline_passenger_satisfaction
GROUP BY 1

-- Flight distances
SELECT
	MIN(flight_distance) AS min_distance,
    MAX(flight_distance) AS max_distance,
    AVG(flight_distance) AS avg_distance
FROM airline_passenger_satisfaction

-- Count of satisfaction responses and percentage
SELECT
	satisfaction,
    COUNT(*) num_of_people,
    ROUND(COUNT(id)/MAX(id) * 100, 2) AS percent
FROM airline_passenger_satisfaction
GROUP BY 1
    
-- Which percentage of airline passengers are satisfied? Does it vary by customer type? What about type of travel?

SELECT
	satisfaction,
    COUNT(id) AS num_satisfied,
    COUNT(id)/MAX(id) AS percentage
FROM airline_passenger_satisfaction
GROUP BY satisfaction;

SELECT
	customer_type,
    satisfaction,
    COUNT(satisfaction) AS num_of_responses
FROM airline_passenger_satisfaction
GROUP BY customer_type, satisfaction
ORDER BY num_of_responses DESC

SELECT
	type_of_travel,
    satisfaction,
    COUNT(satisfaction) AS num_of_responses
FROM airline_passenger_satisfaction
GROUP BY type_of_travel, satisfaction
ORDER BY num_of_responses DESC


-- What is the customer profile for a repeating airline passenger? */

SELECT
	customer_type,
    gender,
    CASE
		WHEN age < 18 THEN 'less than 18'
        WHEN age BETWEEN 18 AND 30 THEN '18-30'
        WHEN age BETWEEN 31 AND 65 THEN '31-65'
        WHEN age > 65 THEN 'over 65'
        ELSE 'other'
	END AS ages,
    COUNT(id) AS num_of_passengers
FROM airline_passenger_satisfaction
WHERE customer_type = 'returning'
GROUP BY 1, 2, 3
ORDER BY num_of_passengers DESC

-- Does flight distance affect customer preferences or flight patterns?

SELECT
	CASE
		WHEN flight_distance < 1000 THEN '< 1000'
        WHEN flight_distance BETWEEN 1001 and 2000 THEN '1001-2000'
        WHEN flight_distance BETWEEN 2001 and 3000 THEN '2001-3000'
        ELSE '> 3000'
	END AS distance_by_miles,
    class,
    COUNT(id) AS num_of_passengers,
    AVG(departure_delay) AS avg_depart_delay_in_mins,
    AVG(arrival_delay) AS avg_arrive_delay_in_mins
FROM airline_passenger_satisfaction
GROUP BY 1,2
ORDER BY 1,2,3

-- Which factors contribute to customer satisfaction the most? What about dissatisfaction?

SELECT
	customer_type,
    satisfaction,
    COUNT(satisfaction) AS num_of_passengers
FROM airline_passenger_satisfaction
GROUP BY 1,2
ORDER BY 1,2
-- First-time customers more neutral/dissatisfied than satisfied, almost equal for returning customers

SELECT
	class,
    satisfaction,
    COUNT(satisfaction) AS num_of_passengers
FROM airline_passenger_satisfaction
GROUP BY 1,2
ORDER BY 1,2
-- Those in business class are more satisfied than those in economy or economy plus

SELECT
	satisfaction,
    AVG(online_booking),
    AVG(check_in),
    AVG(online_boarding),
    AVG(gate_location),
    AVG(on_board_service),
    AVG(seat_comfort),
    AVG(leg_room),
    AVG(cleanliness),
    AVG(food_and_drink),
    AVG(in_flight_service),
    AVG(in_flight_wifi),
    AVG(in_flight_entertainment),
    AVG(baggage_handling)
FROM airline_passenger_satisfaction
GROUP BY 1
-- Those who were neutral or dissatisfied gave lowest rating to in-flight wifi, online booking and online boarding
-- Those who were satisfied gave highest rating to seat comfort, online boarding, baggage handling and in-flight service and entertainment
