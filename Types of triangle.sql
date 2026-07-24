select case when A+B<=c or B+C<=A or A+C<=B then 'Not A Triangle' when A=B and B=C then 'Equilateral' when A=B or A=C or B=C then 'Isosceles' else 'Scalene' end from Triangles
