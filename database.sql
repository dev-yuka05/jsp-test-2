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

insert into students values('202201001','��ȿ','101');
insert into students values('202201002','����','102');
insert into students values('202301001','����','103');

insert into part values('101','��ǻ�Ͱ���','1');
insert into part values('102','�ΰ�����','1');
insert into part values('103','�������','1');
insert into part values('104','���������','1');
insert into part values('105','���ڰ���','0');