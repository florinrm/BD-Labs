select a.ename, a.sal
from emp a join dept b
	on a.deptno = b.deptno
where 
	b.dname = 'SALES'
	or
	b.dname = 'ACCOUNTING'
order by (select count(*)
			from emp c
			where
				c.deptno = a.deptno) desc;
				

select max(count(*))
from emp
group by deptno;

select a.ename, a.sal
from emp a
where
	 4 > (select count(b.sal)
			from emp b
			where 
				b.sal > a.sal);
				
-- Exercitiul 1 --
accept departament prompt "Introduceti un departament: ";

select distinct(extract(MONTH from a.hiredate)), count (*)
from emp a, dept b, emp c
where
	b.deptno = a.deptno
	and
	b.dname = '&departament'
group by extract(MONTH from a.hiredate);

-- Exercitiul 2 --
accept angajat prompt "Introduceti un angajat: ";

select a.dname, (select count (*)
				 from emp c
				 where 
				 c.deptno = a.deptno),
				(select count(distinct d.mgr)
				 from emp d
				 where
				 d.deptno = a.deptno)
from dept a, emp b
where
	a.deptno != b.deptno
	and
	b.ename = '&angajat';
	
-- Exercitiul 3 --

select (select count(*)
		from salgrade g, emp c, salgrade d
		where
		g.losal > a.sal
		and
		g.hisal < a.sal
		and
		c.deptno = a.deptno
		and
		c.sal < d.losal
		and
		c.sal > d.hisal
		and
		g.losal != d.losal
		and
		g.hisal != d.hisal),
		(select count (*)
		from emp e, emp s
		where
		e.deptno = b.deptno
		and
		e.mgr = s.empno
		and
		e.sal > s.sal)
from emp a, dept b
where 
	a.deptno = b.deptno
	and
	a.ename = 'SMITH';
	
-- Exercitiul 4 --
accept angajatul prompt "Introduceti un angajat: ";

select b.ename, b.sal + nvl(b.comm, 0),  g.grade
from emp a, emp s, dept d, emp b, salgrade g
where
	a.ename = '&angajatul'
	and
	a.mgr = s.empno
	and
	d.deptno = s.deptno
	and
	b.deptno = d.deptno
	and
	b.sal > g.losal
	and
	b.sal < g.hisal;
	
