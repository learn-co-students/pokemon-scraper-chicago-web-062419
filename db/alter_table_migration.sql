-- Add a new column to the tabled called "hp" that is not null and has a DEFAULT value of 60
-- DEFAULT - sets default value for a column

ALTER TABLE pokemon ADD hp INTEGER NOT NULL DEFAULT 60;