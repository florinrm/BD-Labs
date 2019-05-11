-- Exercitiul 1

select ename, job, DECODE( MOD(empno,2), 0, 'par',
										   1, 'impar') from emp;
										
select ename, job, CASE 
						MOD(empno, 2)
							when 0 then 'par'
							when 1 then 'impar'
					end 
					from emp;
					
-- Exercitiul 2

accept departament prompt "Introduceti departamentul: ";

select d.dname, count(e.ename), count(distinct e.mgr)
from dept d, emp e
where
	d.dname != (select b.dname
				from dept b
				where b.dname = '&departament')
		and
	e.deptno = d.deptno
group by d.dname;

-- Exercitiul 3

accept angajat prompt "Introduceti angajatul de la tastatura: ";

select e.ename, e.empno, e.sal + nvl(e.comm,0) v, extract (MONTH from e.hiredate) luna
from emp e, dept d, emp a, emp b
where
	e.deptno = d.deptno
	and
	b.ename = '&angajat'
	and
	b.mgr = a.empno
	and
	e.deptno = a.deptno;
	
-- Exercitiul 4

select e.dname, min(a.hiredate), sum(a.sal)
from dept e, emp a
where e.deptno = a.deptno
group by(e.dname);
