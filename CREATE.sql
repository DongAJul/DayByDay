CREATE TABLE subjectAll (
  subject_id int auto_increment primary key,
  subject_name varchar(255) not null
);

create table school (
   school_id int auto_increment primary key,
   school_name varchar(255) not null
);

CREATE TABLE human_type (
  user_id INT auto_increment PRIMARY KEY,  
  user_name VARCHAR(255) not null,
  google_email VARCHAR(255),
  school_id int,
  jokbo_point int default 0,
  FOREIGN KEY (school_id) REFERENCES school(school_id) ON DELETE SET NULL
);

create table question (
    question_id int auto_increment primary key, 
    question_content text,
    question_date timestamp,
    subject_id int,
    foreign key (subject_id) references subjectAll(subject_id) ON UPDATE CASCADE,
    user_id int,
    foreign key (user_id) references human_type(user_id) ON DELETE CASCADE
);


create table answer (
    answer_id int auto_increment primary key, 
    question_id int,
    foreign key (question_id) references question(question_id) ON DELETE CASCADE,
    answer_date timestamp,
    answer_content text
);

create table subject_jokbo (
    jokbo_id int auto_increment primary key,
    exam_type varchar(255) not null,
    school_id int,
    foreign key (school_id) references school(school_id) ON DELETE SET NULL
);

create table order_info (
   order_id int auto_increment primary key, 
    order_day timestamp,
    user_id int,
    foreign key (user_id) references human_type(user_id) ON DELETE CASCADE
);

create table orderitem_info (
   orderitem_id int auto_increment primary key,
    jokbo_id int,
    foreign key (jokbo_id) references subject_jokbo(jokbo_id) ON UPDATE CASCADE,
    order_id int,
    foreign key (order_id) references order_info(order_id) ON UPDATE CASCADE
);
