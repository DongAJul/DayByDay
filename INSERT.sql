#subjectAll TABLE
INSERT INTO subjectAll(subject_name)  VALUES ('운영체제');

#school TABLE
INSERT INTO school(school_name)  VALUES ('이화여자대학교');
INSERT INTO school(school_name)  VALUES ('서강대학교');
INSERT INTO school(school_name)  VALUES ('연세대학교');

#human_type TABLE
INSERT INTO human_type (user_name , google_email , school_id , jokbo_point ) VALUES ('날로','google@gmail.com',1,DEFAULT);

#subject_jokbo TABLE
INSERT INTO subject_jokbo(exam_type ,school_id) VALUES ('중간',1);

#question TABLE
INSERT INTO question(question_content , question_date, subject_id ,user_id )  VALUES ('안녕','2023-07-31',1,1);

#answer TABLE
INSERT INTO answer(question_id, answer_date, answer_content )  VALUES (1,'2023-07-31','안녕하세요, 무엇을 도와드릴까요');

#order_info TABLE
INSERT INTO order_info(order_day, user_id) VALUES ('2023-07-31',1);

#orderitem_info TABLE
INSERT INTO orderitem_info(jokbo_id  ,order_id ) VALUES (1,1);
