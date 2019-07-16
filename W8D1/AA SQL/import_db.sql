PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname varchar(255) NOT NULL,
    lname varchar(255) NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    question_body TEXT NOT NULL,
    user_id INTEGER NOT NULL,
    
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);


CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    reply_id INTEGER,
    user_id INTEGER NOT NULL,
    reply_body TEXT NOT NULL,
    
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (reply_id) REFERENCES replies(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);


INSERT INTO users
    (fname, lname)
VALUES 
    ('Luat', 'Pham'),
    ('Abby', 'Xu'),
    ('Elon', 'Musk');

INSERT INTO questions
    (title, question_body, user_id)
VALUES
    ('Q1', 'content1', (SELECT id FROM users WHERE fname = 'Luat') ),
    ('Q2', 'content2', (SELECT id FROM users WHERE fname = 'Abby') ),
    ('Q3', 'content3', (SELECT id FROM users WHERE fname = 'Luat') );

INSERT INTO question_follows
    (user_id, question_id)
VALUES
    ((SELECT id FROM users WHERE fname = 'Abby'), (SELECT id FROM questions WHERE title = 'Q2')),
    ((SELECT id FROM users WHERE fname = 'Luat'), (SELECT id FROM questions WHERE title = 'Q3')),
    ((SELECT id FROM users WHERE fname = 'Elon'), (SELECT id FROM questions WHERE title = 'Q2'));


INSERT INTO replies
    (question_id, reply_id, user_id, reply_body)
VALUES 
    ( (SELECT id FROM questions WHERE title = 'Q1'),
    null,        
    (SELECT id FROM users WHERE fname = 'Abby'), 
    'Answer1' ),

    ( (SELECT id FROM questions WHERE title = 'Q1'),
    1,
    (SELECT id FROM users WHERE fname = 'Luat'), 
    'Answer2_sub answer to reply_1'
    );


INSERT INTO replies
    (question_id, reply_id, user_id, reply_body)
VALUES 
    ( (SELECT id FROM questions WHERE title = 'Q1'),
    1,
    (SELECT id FROM users WHERE fname = 'Abby'), 
    'Answer3_sub answer to reply_1' ),

    ( (SELECT id FROM questions WHERE title = 'Q1'),
    1,
    (SELECT id FROM users WHERE fname = 'Luat'), 
    'Answer4_sub answer to reply_'
    );

INSERT INTO question_likes
    (user_id, question_id)
VALUES
    ((SELECT id FROM users WHERE fname = 'Abby'), (SELECT id FROM questions WHERE title = 'Q3')),
    ((SELECT id FROM users WHERE fname = 'Luat'), (SELECT id FROM questions WHERE title = 'Q1'));

