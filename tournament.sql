-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

-- Creates the database.
CREATE DATABASE tournament;
DROP DATABASE IF EXISTS tournament;
CREATE DATABASE tournament;
\c tournament.sql

-- Creates a table to include a unique player ID and the player's full name.
CREATE TABLE players(
	player_id serial PRIMARY KEY,
	name text);

-- Creates a table to include a unique match ID, and columns for the player winners and player losers of matches.
CREATE TABLE matches(
	match_id serial PRIMARY KEY,
	winner integer REFERENCES players(player_id) NOT NULL,
    loser integer REFERENCES players(player_id) NOT NULL
    );

-- Creates a view to create a table that counts each players' total wins and total matches.
CREATE VIEW standings AS
	SELECT players.player_id, players.name,
	(SELECT count(matches.winner)
		FROM matches
		WHERE players.player_id = matches.winner)
	AS total_wins,
	(SELECT count(matches.match_id)
		FROM matches
		WHERE players.player_id = matches.winner
		OR players.player_id = matches.loser)
	AS total_matches
	FROM players
	ORDER BY total_wins DESC, total_matches DESC;