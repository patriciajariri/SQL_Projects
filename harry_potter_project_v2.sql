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
    
    
-- Which spells are used the most across the franchise? Do characters have a favorite spell?

SELECT
	'Accio' AS spell,
	COUNT(dialogue = '%Accio%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Accio%'

UNION

SELECT
	'Aguamenti' AS spell,
	COUNT(dialogue = '%Aguamenti%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Aguamenti%'

UNION    

SELECT
	'Alarte Ascendare' AS spell,
	COUNT(dialogue = '%Alarte Ascendare%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Alarte Ascendare%'

UNION

SELECT
	'Alohomora' AS spell,
	COUNT(dialogue = '%Alohomora%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Alohomora%'
    
UNION
    
SELECT
	'Arania Exumai' AS spell,
	COUNT(dialogue = '%Arania Exumai%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Arania Exumai%'
    
UNION
    
SELECT
	'Arresto Momentum' AS spell,
	COUNT(dialogue = '%Arresto Momentum%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Arresto Momentum%'
    
UNION
    
SELECT
	'Avada Kedavra' AS spell,
	COUNT(dialogue = '%Avada Kedavra%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Avada Kedavra%'

UNION

SELECT
	'Bombarda' AS spell,
	COUNT(dialogue = '%Bombarda%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Bombarda%'

UNION
    
SELECT
	'Brackium Emendo' AS spell,
	COUNT(dialogue = '%Brackium Emendo%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Brackium Emendo%'

UNION
    
SELECT
	'Cistem Aperio' AS spell,
	COUNT(dialogue = '%Cistem Aperio%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Cistem Aperio%'

UNION
    
SELECT
	'Colloportus' AS spell,
	COUNT(dialogue = '%Colloportus%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Colloportus%'

UNION

SELECT
	'Confringo' AS spell,
	COUNT(dialogue = '%Confringo%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Confringo%'
    
UNION

SELECT
	'Crucio' AS spell,
	COUNT(dialogue = '%Crucio%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Crucio%'
    
UNION

SELECT
	'Diffindo' AS spell,
	COUNT(dialogue = '%Diffindo%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Diffindo%'

UNION

SELECT
	'Dissendium' AS spell,
	COUNT(dialogue = '%Dissendium%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Dissendium%'

UNION

SELECT
	'Engorgio' AS spell,
	COUNT(dialogue = '%Engorgio%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Engorgio%'

UNION

SELECT
	'Episkey' AS spell,
	COUNT(dialogue = '%Episkey%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Episkey%'
    
UNION

SELECT
	'Expecto Patronum' AS spell,
	COUNT(dialogue = '%Expecto Patronum%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Expecto Patronum%'

UNION

SELECT
	'Expelliarmus' AS spell,
	COUNT(dialogue = '%Expelliarmus%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Expelliarmus%'

UNION

SELECT
	'Expulso' AS spell,
	COUNT(dialogue = '%Expulso%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Expulso%'
    
UNION

SELECT
	'Finite' AS spell,
	COUNT(dialogue = '%Finite%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Finite%'

UNION

SELECT
	'Homenum Revelio' AS spell,
	COUNT(dialogue = '%Homenum Revelio%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Homenum Revelio%'
    
UNION

SELECT
	'Immobulus' AS spell,
	COUNT(dialogue = '%Immobulus%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Immobulus%'
    
UNION

SELECT
	'Impedimenta' AS spell,
	COUNT(dialogue = '%Impedimenta%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Impedimenta%'
    
UNION

SELECT
	'Imperio' AS spell,
	COUNT(dialogue = '%Imperio%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Imperio%'
    
UNION

SELECT
	'Incarcerous' AS spell,
	COUNT(dialogue = '%Incarcerous%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Incarcerous%'
    
UNION

SELECT
	'Incendio' AS spell,
	COUNT(dialogue = '%Incendio%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Incendio%'

UNION

SELECT
	'Levicorpus' AS spell,
	COUNT(dialogue = '%Levicorpus%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Levicorpus%'

UNION

SELECT
	'Locomotor' AS spell,
	COUNT(dialogue = '%Locomotor%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Locomotor%'

UNION

SELECT
	'Locomotor Mortis' AS spell,
	COUNT(dialogue = '%Locomotor Mortis%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Locomotor Mortis%'

UNION

SELECT
	'Lumos' AS spell,
	COUNT(dialogue = '%Lumos%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Lumos%'

UNION

SELECT
	'Lumos Maxima' AS spell,
	COUNT(dialogue = '%Lumos Maxima%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Lumos Maxima%'

UNION

SELECT
	'Lumos Solem' AS spell,
	COUNT(dialogue = '%Lumos Solem%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Lumos Solem%'
    
UNION

SELECT
	'Muffliato' AS spell,
	COUNT(dialogue = '%Muffliato%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Muffliato%'
    
UNION

SELECT
	'Nox' AS spell,
	COUNT(dialogue = '%Nox%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Nox%'

UNION

SELECT
	'Obliviate' AS spell,
	COUNT(dialogue = '%Obliviate%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Obliviate%'
    
UNION

SELECT
	'Oculus Reparo' AS spell,
	COUNT(dialogue = '%Oculus Reparo%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Oculus Reparo%'
    
UNION

SELECT
	'Oppugno' AS spell,
	COUNT(dialogue = '%Oppugno%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Oppugno%'

UNION

SELECT
	'Peskipiksi Pesternomi' AS spell,
	COUNT(dialogue = '%Peskipiksi Pesternomi%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Peskipiksi Pesternomi%'

UNION

SELECT
	'Petrificus Totalus' AS spell,
	COUNT(dialogue = '%Petrificus Totalus%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Petrificus Totalus%'
    
UNION

SELECT
	'Piertotum Locomotor' AS spell,
	COUNT(dialogue = '%Piertotum Locomotor%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Piertotum Locomotor%'

UNION

SELECT
	'Portus' AS spell,
	COUNT(dialogue = '%Portus%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Portus%'

UNION

SELECT
	'Priori Incantatem' AS spell,
	COUNT(dialogue = '%Priori Incantatem%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Priori Incantatem%'

UNION

SELECT
	'Protego' AS spell,
	COUNT(dialogue = '%Protego%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Protego%'

UNION

SELECT
	'Protego Maxima' AS spell,
	COUNT(dialogue = '%Protego Maxima%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Protego Maxima%'

UNION

SELECT
	'Protego totalum' AS spell,
	COUNT(dialogue = '%Protego totalum%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Protego totalum%'

UNION

SELECT
	'Reducio' AS spell,
	COUNT(dialogue = '%Reducio%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Reducio%'

UNION

SELECT
	'Relashio' AS spell,
	COUNT(dialogue = '%Relashio%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Relashio%'
    
UNION

SELECT
	'Reparo' AS spell,
	COUNT(dialogue = '%Reparo%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Reparo%'
    
UNION
    
SELECT
	'Repello Inimicum' AS spell,
	COUNT(dialogue = '%Repello Inimicum%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Repello Inimicum%'

UNION

SELECT
	'Repello Muggletum' AS spell,
	COUNT(dialogue = '%Repello Muggletum%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Repello Muggletum%'

UNION

SELECT
	'Revelio' AS spell,
	COUNT(dialogue = '%Revelio%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Revelio%'

UNION

SELECT
	'Rictusempra' AS spell,
	COUNT(dialogue = '%Rictusempra%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Rictusempra%'
    
UNION

SELECT
	'Riddikulus' AS spell,
	COUNT(dialogue = '%Riddikulus%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Riddikulus%'

UNION

SELECT
	'Salvio hexia' AS spell,
	COUNT(dialogue = '%Salvio hexia%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Salvio hexia%'
    
UNION

SELECT
	'Sectumsempra' AS spell,
	COUNT(dialogue = '%Sectumsempra%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Sectumsempra%'

UNION

SELECT
	'Serpensortia' AS spell,
	COUNT(dialogue = '%Serpensortia%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Serpensortia%'

UNION

SELECT
	'Stupefy' AS spell,
	COUNT(dialogue = '%Stupefy%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Stupefy%'

UNION

SELECT
	'Vera Verto' AS spell,
	COUNT(dialogue = '%Vera Verto%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Vera Verto%'

UNION

SELECT
	'Vipera Evanesca' AS spell,
	COUNT(dialogue = '%Vipera Evanesca%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Vipera Evanesca%'
    
UNION

SELECT
	'Wingardium Leviosa' AS spell,
	COUNT(dialogue = '%Wingardium Leviosa%') AS num_of_times_used
FROM
	dialogue
WHERE
	dialogue LIKE '%Wingardium Leviosa%'
ORDER BY num_of_times_used DESC
    
