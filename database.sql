create table students (
    sno number (10) NOT NULL Primary Key,
    sname varchar2(10),
    partno number(5)
);


create table part (
    partno number(5) NOT NULL Primary Key,
    pname varchar2(20),
    status number(1)
);

insert into students values('202201001','지효','101');
insert into students values('202201002','나연','102');
insert into students values('202301001','정연','103');

insert into part values('101','컴퓨터공학','1');
insert into part values('102','인공지능','1');
insert into part values('103','산업공학','1');
insert into part values('104','산업디자인','1');
insert into part values('105','전자공학','0');