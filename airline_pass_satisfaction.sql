USE airlinepassenger;

SELECT *
FROM airline_passenger_satisfaction;

    
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
