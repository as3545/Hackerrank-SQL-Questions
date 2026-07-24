select Ceil(avg(salary)-avg(replace(salary,0,''))) from employees;
