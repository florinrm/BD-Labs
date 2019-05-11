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
		
-- Exercitiul 1
accept grupa_neagra prompt "Introduceti grupa neagra: ";

select a.nume, a.medie_an, b.den_grupa
	from studenti a, grupe b
	where a.id_grupa = b.id_grupa
			and
			b.den_grupa != &grupa_neagra;
			
			
-- Exercitiul 2

select den_grupa, nume
	from grupe a left outer join studenti b
	on	a.id_grupa = b.id_grupa;
	
-- Exercitiul 3

select b.nume, b.medie_an, c.medie_an
	from grupe a, studenti b, studenti c
	where a.id_grupa = b.id_grupa
			and
		  c.id_student = a.id_sef_gr
			and
		  b.medie_an > c.medie_an;
		  
-- Exercitiul 4

accept seful prompt "Introduceti seful: ";
accept grupa_neagra2 prompt "Introduceti grupa: ";

select b.nume
	from grupe a, studenti b, studenti c
	where a.id_grupa = b.id_grupa
			and
		  c.id_student = a.id_sef_gr
			and
		  c.nume = '&seful'
			and
		  b.id_grupa = c.id_grupa
			and
		  a.den_grupa != &grupa_neagra2;

drop table plafoane;
drop table studenti;
drop table grupe;