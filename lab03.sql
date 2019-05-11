create table cluburi
(
	id_club number(2),
	denumire varchar2(50),
	an_infiintare number(4),
	constraint pk_club primary key (id_club)
);

create table sportivi
(
	id_club number(2),
	id_sportiv number(5),
	nume varchar2(20),
	prenume varchar2(30),
	data_insc date,
	disciplina varchar2(30),
	constraint pk_cluburi foreign key(id_club) references cluburi(id_club),
	constraint pk_sportivi primary key(id_club, id_sportiv)
);

desc cluburi;
desc sportivi;

insert into cluburi(id_club, denumire, an_infiintare)
	values (1, 'CSM', 1980);
insert into cluburi(id_club, denumire, an_infiintare)
	values (2, 'Steaua', 1990);

insert into sportivi(id_club, id_sportiv, nume, prenume, data_insc, disciplina)
	values(1, 1, 'Basescu', 'Traian', TO_DATE('01-02-2002','DD-MM-YYYY'), 'fotbal');
insert into sportivi(id_club, id_sportiv, nume, prenume, data_insc, disciplina)
	values(1, 2, 'Popovici', 'Andrei', TO_DATE('04-04-2003','DD-MM-YYYY'), 'tenis');
insert into sportivi(id_club, id_sportiv, nume, prenume, data_insc, disciplina)
	values(1, 3, 'Popescu', 'Marius', TO_DATE('23-06-2001','DD-MM-YYYY'), 'fotbal');

insert into sportivi(id_club, id_sportiv, nume, prenume, data_insc, disciplina)
	values(2, 1, 'Ionescu', 'Astrid', TO_DATE('01-04-2006','DD-MM-YYYY'), 'tenis');
insert into sportivi(id_club, id_sportiv, nume, prenume, data_insc, disciplina)
	values(2, 2, 'Vuia', 'Traian', TO_DATE('10-04-2002','DD-MM-YYYY'), 'hokey');
insert into sportivi(id_club, id_sportiv, nume, prenume, data_insc, disciplina)
	values(2, 3, 'Curie', 'Marie', TO_DATE('17-08-2010','DD-MM-YYYY'), 'tenis');
	

-- Exercitiul 1
create table sportivi_tenis as
	select nume || ' ' || prenume sportivi_tenis from sportivi
	where disciplina = 'tenis';
	
select * from sportivi_tenis;

-- Exercitiul 2
select nume, prenume, disciplina, denumire
	from cluburi, sportivi
	where
		sportivi.id_club = cluburi.id_club
		and
		an_infiintare = 1990;
		
-- Exercitiul 3	
select nume, prenume, disciplina, denumire
	from cluburi, sportivi
	where
		sportivi.id_club = cluburi.id_club
		and
		an_infiintare > &&year;

-- Exercitiul 4
accept new_discipline prompt 'Introduceti disciplina ceruta: ';

select nume, prenume, disciplina, denumire
	from cluburi, sportivi
	where
		sportivi.id_club = cluburi.id_club
		and
		an_infiintare = &year
		and
		disciplina = '&new_discipline';

undefine year;
undefine new_discipline;
		
drop table sportivi_tenis;		
drop table sportivi;
drop table cluburi;