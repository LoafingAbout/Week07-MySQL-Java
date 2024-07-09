use projects;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS project;

CREATE TABLE project(
project_id INT AUTO_INCREMENT NOT NULL,
project_name VARCHAR(128) NOT NULL,
estimated_hours DECIMAL(7,2),
actual_hours DECIMAL(7,2),
difficulty INT,
notes TEXT,
PRIMARY KEY (project_id)
);

CREATE TABLE category(
category_id INT AUTO_INCREMENT NOT NULL,
category_name VARCHAR(128) NOT NULL,
PRIMARY KEY (category_id)
);

CREATE TABLE project_category(
project_id INT NOT NULL,
category_id INT NOT NULL,
FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE,
UNIQUE KEY (project_id, category_id)
);

CREATE TABLE step(
step_id INT AUTO_INCREMENT NOT NULL,
project_id INT NOT NULL,
step_text TEXT NOT NULL,
step_order INT NOT NULL,
PRIMARY KEY (step_id),
FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE material(
material_id INT AUTO_INCREMENT NOT NULL,
project_id INT NOT NULL,
material_name VARCHAR(128) NOT NULL,
num_required INT,
cost DECIMAL(7,2),
PRIMARY KEY (material_id),
FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

SELECT * FROM project;
SELECT * FROM category;
SELECT * FROM project_category;
SELECT * FROM step;
SELECT * FROM material;

INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes) VALUES ('Paint room', 4, 5, 3, 'remove or cover all furniture first' );
INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes) VALUES ('Put on makeup', 1, 2, 3, 'foundation, concealer, powder, blush, eyeshadow, mascara, then lipstick' );
INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes) VALUES ('Walk the dog', 1, 1, 2, 'Put on collar then leash and grab doggydump bags' );
INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes) VALUES ('Find a Job', 100, 1000, 5, 'use job search websites, but also take resumes in person' );
INSERT INTO material (project_id, material_name, num_required, cost) values (1, 'Paint roller, brush, tape, paint', 4, 50);
INSERT INTO material (project_id, material_name, num_required, cost) values (2, 'eye, face, lip makeups', 3, 100);
INSERT INTO material (project_id, material_name, num_required, cost) values (3, 'leash, collar, doody bags', 3, 60);
INSERT INTO material (project_id, material_name, num_required, cost) values (4, 'computer, resume', 2, 0);

INSERT INTO step (project_id, step_text, step_order) values (1, 'apply paint to walls', 1);
INSERT INTO step (project_id, step_text, step_order) values (2, 'put makeup on face', 1);
INSERT INTO step (project_id, step_text, step_order) values (3, 'take the dog for a walk outside', 1);
INSERT INTO step (project_id, step_text, step_order) values (4, 'look for employment online', 1);

INSERT INTO category (category_id, category_name) values (1, '');
INSERT INTO category (category_id, category_name) values (2, '');
INSERT INTO category (category_id, category_name) values (3, '');
INSERT INTO category (category_id, category_name) values (4, '');

INSERT INTO project_category (project_id, category_id) VALUES(1, 1);
INSERT INTO project_category (project_id, category_id) VALUES(2, 2);
INSERT INTO project_category (project_id, category_id) VALUES(3, 3);
INSERT INTO project_category (project_id, category_id) VALUES(4, 4);

SELECT * FROM project;
SELECT * FROM category;
SELECT * FROM project_category;
SELECT * FROM step;
SELECT * FROM material;