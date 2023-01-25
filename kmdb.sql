-- In this assignment, you'll be building the domain model, database 
-- structure, and data for "KMDB" (the Kellogg Movie Database).
-- The end product will be a report that prints the movies and the 
-- top-billed cast for each movie in the database.

-- Requirements/assumptions
--
-- - There will only be three movies in the database – the three films
--   that make up Christopher Nolan's Batman trilogy.
-- - Movie data includes the movie title, year released, MPAA rating,
--   and studio.
-- - There are many studios, and each studio produces many movies, but
--   a movie belongs to a single studio.
-- - An actor can be in multiple movies.
-- - Everything you need to do in this assignment is marked with TODO!

-- User stories
--
-- - As a guest, I want to see a list of movies with the title, year released,
--   MPAA rating, and studio information.
-- - As a guest, I want to see the movies which a single studio has produced.
-- - As a guest, I want to see each movie's cast including each actor's
--   name and the name of the character they portray.
-- - As a guest, I want to see the movies which a single actor has acted in.
-- * Note: The "guest" user role represents the experience prior to logging-in
--   to an app and typically does not have a corresponding database table.


-- Deliverables
-- 
-- There are three deliverables for this assignment, all delivered via
-- this file and submitted via GitHub and Canvas:
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database.
-- - Insertion of "Batman" sample data into tables.
-- - Selection of data, so that something similar to the sample "report"
--   below can be achieved.

-- Rubric
--
-- 1. Domain model - 6 points
-- - Think about how the domain model needs to reflect the
--   "real world" entities and the relationships with each other. 
--   Hint: It's not just a single table that contains everything in the 
--   expected output. There are multiple real world entities and
--   relationships including at least one many-to-many relationship.
-- 2. Execution of the domain model (CREATE TABLE) - 4 points
-- - Follow best practices for table and column names
-- - Use correct data column types (i.e. TEXT/INTEGER)
-- - Use of the `model_id` naming convention for foreign key columns
-- 3. Insertion of data (INSERT statements) - 4 points
-- - Insert data into all the tables you've created
-- - It actually works, i.e. proper INSERT syntax
-- 4. "The report" (SELECT statements) - 6 points
-- - Write 2 `SELECT` statements to produce something similar to the
--   sample output below - 1 for movies and 1 for cast. You will need
--   to read data from multiple tables in each `SELECT` statement.
--   Formatting does not matter.

-- Submission
-- 
-- - "Use this template" to create a brand-new "hw1" repository in your
--   personal GitHub account, e.g. https://github.com/<USERNAME>/hw1
-- - Do the assignment, committing and syncing often
-- - When done, commit and sync a final time, before submitting the GitHub
--   URL for the finished "hw1" repository as the "Website URL" for the 
--   Homework 1 assignment in Canvas

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Warner Bros.
-- The Dark Knight        2008           PG-13  Warner Bros.
-- The Dark Knight Rises  2012           PG-13  Warner Bros.

-- Top Cast
-- ========

-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle

-- Turns column mode on but headers off
.mode column
.headers off
.width (100,100,100)

-- Drop existing tables, so you'll start fresh each time this script is run.
-- TODO!

 DROP TABLE IF EXISTS movies;
 DROP TABLE IF EXISTS studios;
 DROP TABLE IF EXISTS characters;
 DROP TABLE IF EXISTS actors;

-- Create new tables, according to your domain model
-- TODO!

CREATE TABLE movies (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  movie_title TEXT,
   year_released INTEGER,
   MPAA_rating TEXT,
   studio_id INTEGER);

CREATE TABLE studios (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
   studio_name TEXT);

CREATE TABLE characters (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  character_name TEXT,
  movie_id INTEGER,
  actor_id INTEGER);

CREATE TABLE actors (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
   actor_name TEXT);

-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary
-- TODO!

-- **Start of actors table** (IP)
INSERT INTO actors (actor_name)
VALUES ("Christian_Bale");

INSERT INTO actors (actor_name)
VALUES ("Michael_Caine");

INSERT INTO actors (actor_name)
VALUES ("Liam_Neeson");

INSERT INTO actors (actor_name)
VALUES ("Katie_Holmes");

INSERT INTO actors (actor_name)
VALUES ("Gary_Oldman");

INSERT INTO actors (actor_name)
VALUES ("Heath_Ledger");

INSERT INTO actors (actor_name)
VALUES ("Aaron_Eckhart");

INSERT INTO actors (actor_name)
VALUES ("Maggie_Gyllenhaal");

INSERT INTO actors (actor_name)
VALUES ("Tom_Hardy");

INSERT INTO actors (actor_name)
VALUES ("Joseph_Gordon-Levitt");

INSERT INTO actors (actor_name)
VALUES ("Anne_Hathaway");

-- **End of actors table** (IP)

-- **Start of studios table** (IP)
INSERT INTO studios (studio_name)
VALUES ("Warner_Bros");

-- **End of studios table** (IP)

-- **Start of movies table** (IP)
INSERT INTO movies (movie_title, year_released, MPAA_rating, studio_id)
VALUES ("Batman_Begins", 2005, "PG-13", 1);

INSERT INTO movies (movie_title, year_released, MPAA_rating, studio_id)
VALUES ("The_Dark_Night", 2008, "PG-13", 1);

INSERT INTO movies (movie_title, year_released, MPAA_rating, studio_id)
VALUES ("The_Dark_Night_Rises", 2012, "PG-13", 1);

-- **End of movies table** (IP)

-- **Start of characters table** (IP)
INSERT INTO characters (character_name, movie_id, actor_id)
VALUES ("Bruce_Wayne", 1, 1);

INSERT INTO characters (character_name, movie_id, actor_id)
VALUES ("Alfred", 1, 2);

INSERT INTO characters (character_name, movie_id, actor_id)
VALUES ("Ra's_Al_Ghul", 1, 3);

INSERT INTO characters (character_name, movie_id, actor_id)
VALUES ("Rachel_Dawes", 1, 4);

INSERT INTO characters (character_name, movie_id, actor_id)
VALUES ("Comissioner_Gordon", 1, 5);

INSERT INTO characters (character_name, movie_id, actor_id)
VALUES ("Bruce_Wayne", 2, 1);

INSERT INTO characters (character_name, movie_id, actor_id)
VALUES ("Joker", 2, 6);

INSERT INTO characters (character_name, movie_id, actor_id)
VALUES ("Harvey_Dent", 2, 7);

INSERT INTO characters (character_name, movie_id, actor_id)
VALUES ("Alfred", 2, 2);

INSERT INTO characters (character_name, movie_id, actor_id)
VALUES ("Rachel_Dawes", 2, 8);

INSERT INTO characters (character_name, movie_id, actor_id)
VALUES ("Bruce_Wayne", 3, 1);

INSERT INTO characters (character_name, movie_id, actor_id)
VALUES ("Commissioner_Gordon", 3, 5);

INSERT INTO characters (character_name, movie_id, actor_id)
VALUES ("Bane", 3, 9);

INSERT INTO characters (character_name, movie_id, actor_id)
VALUES ("John_Blake", 3, 10);

INSERT INTO characters (character_name, movie_id, actor_id)
VALUES ("Selina_Kyle", 3, 11);

-- **End of characters table** (IP)


-- Prints a header for the movies output
.print "Movies"
.print "======"
.print ""

-- The SQL statement for the movies output
-- TODO!

SELECT movies.movie_title, movies.year_released, movies.MPAA_rating, studios.studio_name
FROM movies INNER JOIN studios ON studios.id = movies.studio_id; 

-- Prints a header for the cast output
.print ""
.print "Top Cast"
.print "========"
.print ""

-- The SQL statement for the cast output
-- TODO!

SELECT movies.movie_title, actors.actor_name,  characters.character_name
FROM characters INNER JOIN movies ON movies.id = characters.movie_id
INNER JOIN actors ON actors.id = characters.actor_id;
