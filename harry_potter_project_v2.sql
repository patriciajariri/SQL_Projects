USE harrypotter;

-- Which movie has the most lines of dialog? Is it also the longest movie?

SELECT
	chapters.movie_id,
    movie_title,
	COUNT(dialogue.dialogue) AS lines_of_dialogue,
    runtime
FROM
	chapters
    LEFT JOIN dialogue
    ON chapters.chapter_id = dialogue.chapter_id
    LEFT JOIN movies
	ON chapters.movie_id = movies.movie_id
GROUP BY
	chapters.movie_id,
    movie_title,
    runtime

-- How have the characters with the most lines of dialogue varied across movies?

SELECT
	movies.movie_id,
    characters.character_name,
    COUNT(dialogue) AS lines_of_dialogue
FROM movies
	LEFT JOIN chapters
		ON movies.movie_id = chapters.movie_id
	LEFT JOIN dialogue
		ON chapters.chapter_id = dialogue.chapter_id
	LEFT JOIN characters
		ON dialogue.character_id = characters.character_id
GROUP BY
	movies.movie_id,
    characters.character_id,
    characters.character_name
ORDER BY
	movies.movie_id,
    lines_of_dialogue DESC

-- What is the most popular location in each film?

SELECT 
	movies.movie_id AS movie_number,
    dialogue.place_id AS place_id,
    places.place_name AS place_name,
    COUNT(dialogue.place_id) AS num_location_used
FROM movies
	JOIN chapters
		ON movies.movie_id = chapters.movie_id
	JOIN dialogue
		ON chapters.chapter_id = dialogue.chapter_id
	JOIN places
		ON dialogue.place_id = places.place_id
GROUP BY
	movies.movie_id,
    dialogue.place_id,
    places.place_name
ORDER BY
	movies.movie_id,
    num_location_used DESC
    

    
