CREATE TABLE skill (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

INSERT INTO skill (name) VALUES ('Figma');
INSERT INTO skill (name) VALUES ('CSS');
INSERT INTO skill (name) VALUES ('PHP');
INSERT INTO skill (name) VALUES ('Java');

CREATE TABLE department (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

INSERT INTO department (name) VALUES ('Design');
INSERT INTO department (name) VALUES ('Engineering');

CREATE TABLE employee (
    id SERIAL PRIMARY KEY,
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    department_id INT DEFAULT NULL,
    CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES department(id)
);

CREATE TABLE employee_skill (
    employee_id INT,
    skill_id INT,
    PRIMARY KEY (employee_id, skill_id),
    CONSTRAINT fk_employee FOREIGN KEY (employee_id) REFERENCES employee(id),
    CONSTRAINT fk_skill FOREIGN KEY (skill_id) REFERENCES skill(id)
);
