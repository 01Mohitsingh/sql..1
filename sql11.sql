use sakila;
select * from customer;
select * from rental;
select * from customer left join rental on customer.customer_id = rental.customer_id;
select * from film;
select * from inventory;

-- JOIN OPERATION ON MORE THAN 2 TABLE --> LEFT JOIN / RIGHT JOIN
select film.film_id, film.title, inventory.inventory_id, rental.rental_id from film 
left join inventory on film.film_id = inventory.film_id
left join rental on inventory.inventory_id = rental.inventory_id;

select concat(actor.first_name," ",actor.last_name) as actor_name, language.name as language from actor cross join language;