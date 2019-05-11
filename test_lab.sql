-- Exercitul 2 --
select e.ename, d.dname, s.grade
from emp e, dept d, salgrade s, emp b
where
	b.ename = 'BLAKE'
	and
	e.deptno != b.deptno
	and
	e.sal > s.losal
	and
	e.sal < s.hisal
	and
	s.grade != 2
	and
	d.deptno = e.deptno;

-- Exercitiul 1 --
	
select m.ename
from emp e, emp m
where
	e.mgr = m.empno
group by m.ename
having sum(e.sal + nvl(e.comm,0)) = (select max(sum(f.sal + nvl(f.comm,0)))
										from emp f, emp n
										where
											f.mgr = n.empno
										group by n.ename);