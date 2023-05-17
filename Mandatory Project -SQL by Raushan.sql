-- MANDATORY PROJECT OF SQL BY RAUSHAN KUMAR CHAURASIYA DS22 BATCH --

#1.Write a SQL query to count the number of characters except the spaces for each actor. Return first 10 actors name length along with their name.

select length(concat(first_name,last_name)) as Length, first_name,last_name from actor limit 10;

#2.List all Oscar awardees(Actors who received Oscar award) with their full names and length of their names.

select concat(first_name,' ',last_name) as FULLNAME,
length(concat(first_name,last_name)) as Length,
 awards as Award
from actor_award
where 
awards like '%Oscar%';

#3. Find the actors who have acted in the film ‘Frost Head’.

select count(*) from film_actor fa
left outer join film f
on
fa.film_id = f.film_id
left outer join actor a
on
fa.actor_id=a.actor_id
where f.title = 'Frost Head';

#4.Pull all the films acted by the actor ‘Will Wilson’.

select count(*) from film f
left outer join film_actor fa
on
fa.film_id = f.film_id
left outer join actor a
on
fa.actor_id=a.actor_id
where first_name like 'Will'
AND last_name like 'Wilson';

#5.Pull all the films which were rented and return in the month of May.

select f.title as FilmName,r.rental_date as RentalDate,r.return_date as ReturnDate from film f
left outer join inventory i
on
f.film_id=i.film_id
left outer join rental r
on
r.inventory_id=i.inventory_id
where
month(rental_date) ='05'
and
month(return_date) ='05';

#6. Pull all the films with ‘Comedy’ category.

select f.title as FilmName from film f 
left outer join film_category fc
on
f.film_id=fc.film_id
left outer join category c
on
fc.category_id=c.category_id
where c.name= 'Comedy';