use Education;
----------1
-- 1
select * from subject;
-- 2
select * from spec;
--3
select distinct stipendia from student;
--4
select distinct course from student;
--5
select family, name, last_name from student order by birthday;
--6
select family, course, birthday from student order by birthday desc;
--7
select lect_id, family, name, last_name from lecturer;
--8
select student_id, family, name, last_name from student where stipendia > 0 order by family asc;
--9
select student_id, family, name, last_name from student where course = 1 order by family asc;
--10
select student_id, family, name, last_name from student
where course = 2 or course = 3;
--11
select student_id, family, name, last_name, course from student 
where course != 1 and course != 3;
--12
--select distinct subject.subj_id, subject.subj_name, mark from subject, exam
--where mark =5;
select distinct subject.subj_id, subj_name, mark from subject, knowledge, exam, nagruzka
where knowledge.subj_id = subject.subj_id
and knowledge.kvant_id = nagruzka.kvant_id
and nagruzka.nagr_id = exam.nagr_id
and mark = 5;
--13
select distinct subj_name, hour, mark from subject, exam, knowledge, nagruzka
where subject.subj_id = knowledge.subj_id and knowledge.kvant_id = nagruzka.kvant_id and nagruzka.nagr_id = exam.nagr_id and mark = 2;
--14
select distinct subject.subj_name, family, town_name, mark from subject, student, town, exam, knowledge, parents, nagruzka
where (student.student_id = parents.student_id 
and town.town_id = parents.town_id)
and town.town_name = 'Березовский'
and student.student_id = exam.student_id
and mark > 2
and exam.nagr_id = nagruzka.nagr_id
and nagruzka.kvant_id = knowledge.kvant_id
and subject.subj_id = knowledge.subj_id
and subject.subj_id = 1;
--15
select family, subj_name, mark from student, subject, exam, knowledge, nagruzka
where student.student_id = exam.student_id
and subject.subj_id = knowledge.subj_id
and nagruzka.nagr_id = exam.nagr_id
and nagruzka.kvant_id = knowledge.kvant_id
and mark > 2
order by family asc;
--16
select family, subj_name, mark from student, subject, exam, knowledge, nagruzka
where student.student_id = exam.student_id
and subject.subj_id = knowledge.subj_id
and nagruzka.nagr_id = exam.nagr_id
and nagruzka.kvant_id = knowledge.kvant_id
and mark = 2
and subject.subj_name = 'Высшая математика'
order by family asc;
--17
select distinct family, name_medal, town_name  from student, medali, medalist, town, parents
where student.student_id = medalist.student_id
and parents.student_id = student.student_id
and medalist.medal_id = medali.medal_id
and parents.town_id = town.town_id
and medali.medal_id = 2;
--18
select family, subj_name, exam_date, mark from student, subject, exam, knowledge, nagruzka
where exam.student_id = student.student_id
and exam.nagr_id = nagruzka.nagr_id
and knowledge.kvant_id = nagruzka.kvant_id
and knowledge.subj_id = subject.subj_id
and mark = 2
order by subj_name, family asc;
--19
select distinct family, subj_name, exam_date, mark from student, subject, exam, knowledge, nagruzka
where exam.student_id = student.student_id
and (exam_date = '2019.05.24' or exam_date = '2019.06.13')
and exam.nagr_id = nagruzka.nagr_id
and knowledge.kvant_id = nagruzka.kvant_id
and knowledge.subj_id = subject.subj_id
and mark = 2
order by subj_name, family asc;
--20
select distinct student.family, lecturer.family, subj_name, exam_date, mark from student, subject, exam, knowledge, nagruzka, lecturer
where exam.student_id = student.student_id
and exam.nagr_id = nagruzka.nagr_id
and knowledge.kvant_id = nagruzka.kvant_id
and lecturer.lect_id = nagruzka.lect_id
and knowledge.subj_id = subject.subj_id
and mark = 5;
--21
select distinct inst_name, lecturer.family from institute, lecturer, subject, nagruzka, knowledge, exam
where subject.subj_id = knowledge.subj_id
and knowledge.kvant_id = nagruzka.kvant_id
and subject.subj_id = knowledge.subj_id
and institute.inst_id = lecturer.inst_id
and exam.nagr_id = nagruzka.nagr_id
and hour > 80
and mark = 2;

--------2
--1
select sin(10);
select floor(43);
select ceiling(85);
select exp(212);
select sqrt(121);
select round(10,483944);
select log(36.403);
select log10(100.102);
--2.1
select family, LEFT(name, 1), LEFT(last_name, 1) from student
where SUBSTRING(family, 1, 1) = 'П'; 
--2.2
select family + LEFT(name, 1) + LEFT(last_name, 1) from student
where SUBSTRING(family, 1, 1) = 'П'; 
--2.3
select family + ' ' + LEFT(name, 1) + '.' + LEFT(last_name, 1) from student
where SUBSTRING(family, 1, 1) = 'П'; 
--2.4
select subj_name from subject
where CHARINDEX('о', subj_name) > 0;
--2.5
select LEFT('##################', 18 - LEN(family) /2) + family + LEFT('##################', 18 - LEN(family)/2) as result from lecturer;
--2.6
select REPLACE(subj_name, 'эк', 'Павина') from subject;
--2.7
select subj_name from subject
where CHARINDEX('ин', subj_name) > 0;
--2.8
select SYSDATETIME();
select GETDATE();
select TOP(3) DATEADD(year, 27, birthday) from student;
select TOP(3) DATENAME(day, birthday) from student;
--2.9
select DATEDIFF(month, '1996-05-03', '1996-07-15');
--2.10
select POWER(2, 4) as result, POWER(2.5, 4) as result2;
select POWER(0.8, 3) as result;
select POWER(16, 6) as res;