DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS activity_log;
DROP TABLE IF EXISTS goals;
DROP TABLE IF EXISTS distraction_log;
DROP TABLE IF EXISTS task_prioritization;

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    work_hours_start TIME,
    work_hours_end TIME
);


CREATE TABLE activity_log (
    log_id INT PRIMARY KEY,
    user_id INT,
    activity_description VARCHAR(255),
    start_time DATETIME,
    end_time DATETIME,
    category VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE goals (
    goal_id INT PRIMARY KEY,
    user_id INT,
    goal_description VARCHAR(255),
    target_hours INT,
    deadline DATE,
    achieved BOOLEAN DEFAULT false,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE distraction_log (
    distraction_id INT PRIMARY KEY,
    user_id INT,
    distraction_description VARCHAR(255),
    start_time DATETIME,
    end_time DATETIME,
    category VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
CREATE TABLE task_prioritization (
    prioritization_id INT PRIMARY KEY,
    user_id INT,
    task_description VARCHAR(255),
    priority INT,
    deadline DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
