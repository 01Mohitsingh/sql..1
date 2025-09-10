use world;
select * from country; 

-- any --> esme ek ek value se data pr operation perform krta h
-- all --> esme sari value ko ek sath leke operation perform krta h
-- yha sari value me se chhoti value se chhoti wali population ka data show krega
select Name, Population from country where Population < all(select Population from country where Continent = 'North America');

-- get the name of the contoury whose population is greater than the population among the continent nourth america
-- yha sari value me se bdi value se bde wali population ka data show krega
select Name, Population from country where Population > all(select Population from country where Continent = 'North America');

-- get the country code, the name of the country whose lifeexpectancy is same as for the countries from Europe
-- yha sari value ke same wali LifeExpectancy ka data show krega
select Code,Name from country where LifeExpectancy = any(select LifeExpectancy from country where Continent = 'Europe');

-- get the name and the continent for the countries who have got there independance near by the independance year of the countries from asia
select count(Name), Continent from country 
where Continent <> 'Asia' and IndepYear > any (select IndepYear from country where Continent = 'Asia')
group by Continent;

select name, population, (select population from country where name = 'Anguilla') as Ang_Popul, (select population from country where name = 'Anguilla')/population*100 as perce from country;

