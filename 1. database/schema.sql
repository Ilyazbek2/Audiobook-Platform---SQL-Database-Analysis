CREATE DATABASE audiobook_platform;
USE audiobook_platform;

CREATE TABLE audiobooks (
    uuid VARCHAR(8) PRIMARY KEY,
    duration INT NOT NULL,
    title VARCHAR(65) NOT NULL
);

CREATE TABLE audio_cards (
    id INT PRIMARY KEY,
    user_id INT NOT NULL,
    state VARCHAR(9) NOT NULL,
    progress INT NOT NULL,
    audiobook_uuid VARCHAR(8),
    FOREIGN KEY (audiobook_uuid) REFERENCES audiobooks(uuid)
);

CREATE TABLE listenings (
    id INT PRIMARY KEY,
    user_id INT NOT NULL,
    position_from INT NOT NULL,
    position_to INT NOT NULL,
    speed_multiplier FLOAT DEFAULT 1.0,
    audiobook_uuid VARCHAR(8),
    os_name VARCHAR(8),
    is_test INT DEFAULT 0,
    started_at TIMESTAMP,
    finished_at TIMESTAMP,
    FOREIGN KEY (audiobook_uuid) REFERENCES audiobooks(uuid)
);
