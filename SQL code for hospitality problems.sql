

-- use database
use mentorness;

-- verify the tables inside the database
show tables;

-- for table schema
desc hotel;

-- retriev total table 
select * from hotel;

--     Commands For Respective Questions

-- 1Q.  What is the total number of reservations in the dataset?
select distinct count(booking_id) as "total bookings" from hotel;



-- 2Q. Which meal plan is the most popular among guests?  
select type_of_meal_plan, count(booking_id) as total_count from hotel
group by type_of_meal_plan
order by total_count desc
limit 1;



-- 3Q.  What is the average price per room for reservations involving children?  
select avg(avg_price_per_room) as avg_room_tariff from hotel
where no_of_children >0;



-- 4Q.  How many reservations were made for the year 20XX (replace XX with the desired year)?
select count(Booking_ID) as total_bookings from hotel
where year=2018;



-- 5Q.	What is the most commonly booked room type? 
select room_type_reserved, count(booking_id) as booking_count 
from hotel
group by room_type_reserved 
order by count(booking_id) desc
limit 1;



-- 6Q.  How many reservations fall on a weekend (no_of_weekend_nights > 0)? 
select count(no_of_weekend_nights) as weekend_nights
from hotel
where no_of_weekend_nights >0 ;



-- 7Q.	What is the highest and lowest lead time for reservations?
select max(lead_time) as highest_lead_time, min(lead_time) as lowest_lead_time
from hotel;



-- 8Q.	What is the most common market segment type for reservations? 
select market_segment_type, count(booking_id) as total_bookings 
from hotel
group by market_segment_type
order by count(booking_id) desc
limit 1;



-- 9Q.	How many reservations have a booking status of "Confirmed"?  
select count(booking_status) as booking_status
from hotel
where booking_status = 'Not_Canceled';



-- 10Q.	What is the total number of adults and children across all reservations?  
select sum(no_of_adults) as adults,
sum(no_of_children) as children
from hotel;



-- 11Q.	What is the average number of weekend nights for reservations involving children?  
select sum(no_of_weekend_nights) / count(no_of_weekend_nights) as total_weekend_nights
from hotel
where no_of_children >0 and no_of_weekend_nights >0;



-- 12Q.  How many reservations were made in each month of the year?
select distinct count(Booking_ID) as total_bookings,  year, month
from hotel
group by year, month
order by year;



-- 13Q.  What is the average number of nights (both weekend and weekday) spent by guests for each room type?
select room_type_reserved as room_type, 
round(avg(no_of_week_nights),2) as avg_week_nights, 
round(avg(no_of_weekend_nights),2) as avg_weekend_nights
from hotel
where no_of_weekend_nights >0 and no_of_week_nights>0
group by room_type_reserved
order by room_type_reserved;



-- 14Q.  For reservations involving children, what is the most common room type, 
-- and what is the average price for that room type?
select  room_type_reserved, count(room_type_reserved), round(avg(avg_price_per_room),2) as avg_tariff from hotel
where no_of_children >0
group by room_type_reserved
order by count(room_type_reserved) desc
limit 1;



-- 15Q.  Find the market segment type that generates the highest average price per room
select market_segment_type, avg(avg_price_per_room) from hotel
group by market_segment_type
order by avg(avg_price_per_room) desc
limit 1;



-- THANK YOU 