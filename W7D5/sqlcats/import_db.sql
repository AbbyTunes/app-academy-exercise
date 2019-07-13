
DROP TABLE cats;
CREATE TABLE cats
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    color VARCHAR(255) NOT NULL,
    breed VARCHAR(255) NOT NULL
);

DROP TABLE toys;
CREATE TABLE toys
(
    id SERIAL PRIMARY KEY,
    price INT NOT NULL,
    color VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL
);

DROP TABLE cattoys;
CREATE TABLE cattoys
(
    id SERIAL PRIMARY KEY,
    cat_id INT NOT NULL,
    toy_id INT NOT NULL,
    FOREIGN KEY(cat_id) REFERENCES cats(id),
    FOREIGN KEY(toy_id) REFERENCES toys(id)
);

INSERT INTO cats 
    (name, color, breed)
VALUES 
    ('Bagel', 'grey', 'Purina'),
    ('Santa Claus', 'brown', 'Sphinx'),
    ('Bob', 'white', 'Bambino'),
    ('Fur Ball', 'white', 'Bengal'),
    ('Elon Musk', 'black', 'Manx');


INSERT INTO toys
    (price, color, name)
VALUES
    (2, 'blue', 'mouse'),
    (9, 'brown', 'stick'),
    (19, 'red', 'post'),
    (1, 'white', 'ball'),
    (1, 'green', 'feather');

INSERT INTO cattoys
    (cat_id, toy_id)
VALUES
    ((SELECT id FROM cats WHERE name = 'Bagel'), (SELECT id FROM toys WHERE name = 'mouse')),
    ((SELECT id FROM cats WHERE name = 'Bagel'), (SELECT id FROM toys WHERE name = 'stick')),
    ((SELECT id FROM cats WHERE name = 'Bagel'), (SELECT id FROM toys WHERE name = 'post')),
    ((SELECT id FROM cats WHERE name = 'Bagel'), (SELECT id FROM toys WHERE name = 'ball')),
    ((SELECT id FROM cats WHERE name = 'Bagel'), (SELECT id FROM toys WHERE name = 'feather')),
    ((SELECT id FROM cats WHERE name = 'Santa Claus'), (SELECT id FROM toys WHERE name = 'mouse')),
    ((SELECT id FROM cats WHERE name = 'Santa Claus'), (SELECT id FROM toys WHERE name = 'post')),
    ((SELECT id FROM cats WHERE name = 'Bob'), (SELECT id FROM toys WHERE name = 'mouse')),
    ((SELECT id FROM cats WHERE name = 'Bob'), (SELECT id FROM toys WHERE name = 'stick')),
    ((SELECT id FROM cats WHERE name = 'Bob'), (SELECT id FROM toys WHERE name = 'feather')),
    ((SELECT id FROM cats WHERE name = 'Fur Ball'), (SELECT id FROM toys WHERE name = 'mouse')),
    ((SELECT id FROM cats WHERE name = 'Fur Ball'), (SELECT id FROM toys WHERE name = 'post')),
    ((SELECT id FROM cats WHERE name = 'Elon Musk'), (SELECT id FROM toys WHERE name = 'ball')),
    ((SELECT id FROM cats WHERE name = 'Elon Musk'), (SELECT id FROM toys WHERE name = 'feather'));


