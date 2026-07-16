select distinct city from station where city  like REGEXP '[^aeiouAEIOU]$';
