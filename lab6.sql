
create table grupe
(
	id_grupa number(2),
	den_grupa varchar2(20),
	id_sef_gr number(2),
	constraint pk_grupe primary key (id_grupa)
);

create table studenti
(
	id_student number(2),
	nume varchar2(20),
	id_grupa number(2),
	medie_an number(4,2),
	constraint pk_stud primary key (id_student),
	constraint fk_grupe foreign key (id_grupa) references grupe(id_grupa)
);

create table plafoane
(
	denumire varchar2(20),
	medie_min number(4,2),
	medie_max number(4,2)
);

desc grupe;
desc studenti;
desc plafoane;

-- grupe
insert into grupe (id_grupa, den_grupa, id_sef_gr)
	values(01, '336', 01);

insert into grupe (id_grupa, den_grupa, id_sef_gr)
	values(02, '335', 01);
	
insert into grupe (id_grupa, den_grupa, id_sef_gr)
	values(03, '334', 01);
	
-- plafoane
insert into plafoane (denumire, medie_min, medie_max)
	values('Bursa studiu', 8.5, 9.49);
	
insert into plafoane (denumire, medie_min, medie_max)
	values('Bursa merit', 9.5, 10);
	
-- studenti
insert into studenti (id_student, nume, id_grupa, medie_an)
	values(01, 'Gigel', 01, 9.5);
	
insert into studenti (id_student, nume, id_grupa, medie_an)
	values(02, 'Marius', 01, 9.7);

insert into studenti (id_student, nume, id_grupa, medie_an)
	values(03, 'Andreea', 01, 8.9);
	
insert into studenti (id_student, nume, id_grupa, medie_an)
	values(04, 'Ionel', 02, 9.9);
	
insert into studenti (id_student, nume, id_grupa, medie_an)
	values(05, 'Mihai', 02, 9.1);

insert into studenti (id_student, nume, id_grupa, medie_an)
	values(06, 'Estera', 02, 7.3);
	
select a.den_grupa, b.nume
	from grupe a, studenti b
	where
		a.id_grupa = b.id_grupa(+);
		
alter table studenti
	add
	(
		data_nasterii date,
		bursa number (5)
	);
		
update studenti
	set data_nasterii = to_date('14-05-1997','DD-MM-YYYY')
	where 
	medie_an > 9.6;
	
update studenti
	set data_nasterii = to_date('10-08-1997','DD-MM-YYYY')
	where 
	medie_an < 9.6;
	
update studenti
	set bursa = 9000
	where
	medie_an > 9.7;
	
update studenti
	set bursa = 5000
	where
		medie_an > 9.5
	and
		medie_an <= 9.7;
	
select * from studenti;

-- Exercitiul 1
--DECLARE @startdate datetime2 = '2019-03-25 12:10:09.3312722';
--DECLARE @enddate datetime2 = '2019-12-25 12:10:09.3312722'; 
--SELECT DATEDIFF(day, @enddate, @startdate);

select round(to_date('25.12.2019', 'DD.MM.YYYY') - sysdate) from dual;

-- Exercitiul 2

accept student_cautat prompt "Introduceti studentul: ";

select s.nume, g.den_grupa, p.denumire, s.bursa
	from grupe g, studenti s, plafoane p, studenti r
	where
		s.id_grupa = g.id_grupa
		and
		r.nume = '&student_cautat'
		and 
		r.medie_an > p.medie_min
		and
		r.medie_an < p.medie_max
		and
		s.medie_an > p.medie_min
		and
		s.medie_an < p.medie_max
		and
		s.bursa is not null;
		
-- Exercitiul 3		

accept medie_citita prompt "Introduceti media de la tastatura: ";

select e.nume, p.denumire, s.nume, a.denumire
	from studenti e, plafoane p, studenti s, plafoane a, grupe g
	where
		e.medie_an > &medie_citita
		and
		g.id_grupa = e.id_grupa
		and
		s.id_student = g.id_sef_gr
		and
		s.medie_an > a.medie_min
		and
		s.medie_an < a.medie_max
		and 
		e.medie_an > p.medie_min
		and
		e.medie_an < p.medie_max
		and
		p.denumire != a.denumire;
		
-- Exercitiul 4
		
select instr(nume, 'Gigel') from studenti;

select substr('Salutare', 2, 3) from dual;

select next_day(to_date('25-03-2019','DD-MM-YYYY'), 'LUNI') next_mon from dual;

select translate ('Salutare haha', 'Sa', 'ha') from dual;


drop table plafoane;
drop table studenti;
drop table grupe;