-- creat base de datos
CREATE DATABASE peliculas;

-- Cambiar base de datos creada
\c peliculas

-- crear tabla pelicula
CREATE TABLE pelicula (
    id INT,
    nombre VARCHAR,
    año_estreno SMALLINT,
    director VARCHAR,
    PRIMARY KEY (id)
);

-- crear tabla reparto
CREATE TABLE reparto (
    id_movies INT,
    cast_of_movie VARCHAR,
    FOREIGN KEY (id_movies) REFERENCES pelicula(id)
);

-- Cargar ambos archivos a su tabla correspondiente.
\copy pelicula FROM 'peliculas.csv' csv header;
\copy reparto FROM 'reparto.csv' csv;

-- Listar a todos los actores que aparecen en la película "Titanic".
SELECT pelicula.nombre, pelicula.año_estreno, pelicula.director, reparto.cast_of_movie FROM pelicula  
INNER JOIN reparto
ON pelicula.id = reparto.id_movies
WHERE nombre = 'Titanic';

-- Consultar en cuántas películas del top 100 participa Harrison Ford.

SELECT pelicula.nombre AS nombre_de_pelicula, reparto.cast_of_movie FROM pelicula
INNER JOIN reparto
ON pelicula.id = reparto.id_movies
WHERE cast_of_movie = 'Harrison Ford';

-- Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente.
SELECT año_estreno, nombre FROM pelicula 
WHERE año_estreno >= 1991 AND año_estreno <= 1998 ORDER BY año_estreno ASC;

-- Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”.
SELECT nombre, LENGTH(nombre) AS longitud FROM pelicula;

-- Consultar cual es la longitud más grande entre todos los títulos de las películas

SELECT MAX(LENGTH(nombre)) FROM


-- SELECT * FROM pelicula;

-- https://www.postgresqltutorial.com/postgresql-inner-join/