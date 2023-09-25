--DROP TABLE IF EXISTS items;

CREATE TABLE IF NOT EXISTS items (
    id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255),
    level Int,
    position VARCHAR(255),
    Content1 VARCHAR(255),
    Content2 VARCHAR(255),
    Content3 VARCHAR(255),
    PRIMARY KEY (id)
);