DROP TABLE IF EXISTS Drinks CASCADE;
CREATE TABLE Drinks
(
    drink_id   SERIAL PRIMARY KEY,
    drink_name VARCHAR(50) NOT NULL,
    date       DATE        NOT NULL,
    quantity   INTEGER     NOT NULL
);

INSERT INTO Drinks (drink_name, date, quantity)
VALUES ('Eggnog', '2024-12-24', 50),
       ('Eggnog', '2024-12-25', 60),
       ('Hot Cocoa', '2024-12-24', 75),
       ('Hot Cocoa', '2024-12-25', 80),
       ('Peppermint Schnapps', '2024-12-24', 30),
       ('Peppermint Schnapps', '2024-12-25', 40);