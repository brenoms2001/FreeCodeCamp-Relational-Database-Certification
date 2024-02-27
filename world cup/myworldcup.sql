CREATE DATABASE worldcup;

CREATE TABLE teams(
    team_id SERIAL,
    name VARCHAR(30) UNIQUE
    PRIMARY KEY(team_id));

CREATE TABLE games(
    game_id SERIAL,
    year INT,
    round VARCHAR(20),
    PRIMARY KEY(game_id)
    winner_id INT,
    opponent_id INT,
    FOREIGN KEY(winner_id) REFERENCES teams(team_id),
    FOREIGN KEY(opponent_id_id) REFERENCES teams(team_id)
    winner_goals INT,
    opponent_goals INT);
