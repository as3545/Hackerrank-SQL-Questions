SELECT Students.Name FROM Students INNER JOIN Friends on Friends.ID=Students.ID INNER JOIN Packages ON Friends.ID=Packages.ID
ORDER BY SALARY;
