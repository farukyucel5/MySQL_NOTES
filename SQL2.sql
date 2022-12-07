use mydb;

select*from student_list;

select user_name,avarage_grade from student_list;

##########################################################

create table ogrenci_derece
as
select user_name,avarage_grade
from student_list;

select *from ogrenci_derece;

##############################################################

create table tedarikci_son
as
select fullname,delivery_date
from tedarikci;
###############################################################

