use world;
select * from country;

select Name, if(Name="Aruba","Desh", "Videsh") from country;
select Name, if(Name="Aruba","Turism1", if(Name="Angola","Turism2","Turism3")) from country;

-- case 
-- 	when condition then expression1
--     when condition then expression2
--     else expression
-- end

select Name, 
case 
	when Name="Aruba" then "Turism1"
    when Name="Angola" then "Turism2"
    else "Turism3"
end as contr from country;

select Name, 
case 
	when Population>200000 then "Devloped"
    when Population>100000 then "Devloping"
    else "Under Devloping"
end as CountryStatus from country;

select Name, ifnull(IndepYear,0) from country;