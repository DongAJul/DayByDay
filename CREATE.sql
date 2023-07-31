CREATE TABLE human_type (
  user_id INT PRIMARY KEY,  /*UUID 사용해보자*/
  user_name VARCHAR(255) not null,
  google_email VARCHAR(255),
  school VARCHAR(255) null,
  major VARCHAR(255) null,
  jokbo_point int default 0
);

CREATE TABLE subjectAll (
  subject_id int auto_increment primary key,
  subject_name varchar(255) not null,
  school_id int,
  FOREIGN KEY (school_id) REFERENCES school(school_id)
);

create table school (
   school_id int auto_increment primary key,
    school_name varchar(255) not null
);

create table Output (
    output_id int primary key, /*얘도 uuid?*/
    question_id int,
    foreign key (question_id) references Question(question_id),
    output_date timestamp,
    output_content text
);

create table Question (
   question_id int primary key, /*얘도 uuid?*/
    question_content text,
    question_date timestamp,
    subject_id int,
    foreign key (subject_id) references subjectAll(subject_id)
);

create table subject_jokbo (
   jokbo_id int primary key, /*얘도 uuid?*/
    exam_type varchar(255) not null,
    school_id int,
    foreign key (school_id) references school(school_id)
);

create table order_info (
   order_id int primary key, /*얘도 uuid?*/
    order_day timestamp,
    user_id int,
    foreign key (user_id) references human_type(user_id)
);

create table orderitem_info (
   orderitem_id int auto_increment primary key,
    jokbo_id int,
    foreign key (jokbo_id) references subject_jokbo(jokbo_id),
    order_id int,
    foreign key (order_id) references order_info(order_id)
);