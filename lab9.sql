select a.ename, a.sal,
		(select count(*)
		 from emp b
		 where
		 b.deptno != a.deptno) altii 
from emp a;

select a.dname, count(*)
from dept a join emp b
	on a.deptno = b.deptno
group by a.dname
having count(*) = (select max(count(*))
					from emp c
					group by c.deptno);
					
-- Exercitiul 1
					
select a.ename, count(*)
from emp a, emp b
where
	a.empno = b.mgr
group by a.ename
having count(*) = (select max(count(*))
					from emp c, emp d
					where
						c.mgr = d.empno
					group by c.mgr);
					
-- Exercitiul 2

select *
from (select *
		from emp e
		where
			e.sal > 3000) angajati;
			

-- Exercitiul 3

select d.dname,
		(select count(*)
		from emp e
		where
			e.deptno = d.deptno
			and
			8 = extract(MONTH from e.hiredate)) interni,
		(select sum(a.sal + nvl(a.comm,0))
		 from emp a
		 where
			a.deptno = d.deptno) venit_total,
		(select count(*)
		 from emp b
		 where
			b.deptno = d.deptno) numar
from dept d;