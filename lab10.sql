select a.ename, a.sal,
		(select count(*)
		from emp x, emp y
		where
		y.ename = 'SCOTT'
		and
		x.hiredate > y.hiredate) num
from emp a, emp b
where 
	b.ename = 'SCOTT'
	and
	a.deptno = b.deptno;
	

select a.ename, a.sal, c.nr
from emp a, emp b, 
	(select count(*) nr
	from emp x, emp y
	where
		y.ename = 'SCOTT'
		and
		x.hiredate > y.hiredate) c
where
	b.ename = 'SCOTT'
	and
	a.deptno = b.deptno;
	
-- Exercitiul 1 --

select a.ename, s.ename, (a.sal + nvl(a.comm,0)) - (s.sal + nvl(s.comm,0)),
		(select count(distinct b.mgr)
		from emp b, dept d
		where
		b.deptno = d.deptno
		and
		a.deptno = d.deptno)
from emp a, emp s
where
	a.hiredate < s.hiredate
	and
	a.mgr = s.empno;
	
-- Exercitiul 2 --

select a.ename, a.sal
from emp a, salgrade s
where 
	a.sal > s.losal
	and
	a.sal < s.hisal
	and
	s.grade in (select c.grade
				from salgrade c, emp de
				where
				de.sal > c.losal
									and
									de.sal < c.hisal
				group by c.grade
				having count(*) = (select max(count(*))
									from emp b, salgrade p
									where
									b.sal > p.losal
									and
									b.sal < p.hisal
									group by p.grade));
	
	
-- Exercitiul 3 --

accept departament prompt "Introduceti un departament de la tastatura: "

select d.dname, count(a.empno), MAX(a.hiredate)
from dept d, emp a
where
	a.deptno = d.deptno
	and
	d.dname != '&departament'
group by d.dname;