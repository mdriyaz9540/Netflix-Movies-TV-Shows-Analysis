-- Netflix Project
drop table if exists netflix;
Create Table netflix(
show_id Varchar(10),
type varchar(10),
title varchar(150),
director varchar(250),
casts varchar(1000),
country varchar (150),
date_added varchar(50),
release_year INT,
rating varchar(10),
duration varchar(15),
listed_in varchar (100),
description varchar(250)
);

select * from netflix;

select count(*) from netflix;

select distinct type from netflix;

select type ,count(*) as total_content from 
netflix 
group by type
-- Most Rating Content
select * from (
select
type,rating,
count(*),
rank()over(Partition by type order by count(*)desc)as ranking from netflix
group by 1,2
)as t1
where
ranking = 1

-- Movies Release on 2020
select * from netflix
where type = 'Movie'
and release_year = 2020

-- Top 5 Contries with most Content
select unnest(string_to_array(country,',')) as new_country,
count(show_id) as total_content
from netflix
group by 1
order by 2 desc
limit 5
-- Longest Duration Movies
select * from netflix
where type = 'Movie'
and
duration = (select max(duration) from netflix)

-- Added Last 5 Years 
select *
from netflix 
where 
to_date(date_added,'Month DD,YYYY')>= Current_Date - INTERVAL '5 years'
-- Director Rajix Chilaka movies/TV shows
Select * from netflix
where director ILIKE '%Rajiv Chilaka%'

-- shows with more than 5 seasons 
select * from netflix
where
type = 'TV Show'
and
Split_part(duration,' ',1)::numeric >=5

--the number of content items in each genre
select 
unnest(string_to_array(listed_in,',')) as genre,
count(show_id) as total_content
from netflix
group by 1
order by 2 desc

-- Top years with highest content in India
Select extract(year from to_date(date_added,'Month DD , YYYY'))as year,
count(*)
from netflix
where country = 'India'
group by 1

-- all movies that are documentaries 
select* from netflix
where listed_in ILIKE '%documentaries%'

-- all content without a director
select * from netflix
where director IS NULL

-- Salman Khan appears in last 10 years
select * from netflix
where casts ILIKE '%salman khan%'
and 
release_year > extract(year from current_date) - 10

-- top 10 actor who have appeared in the highest number of movies produced in india

select
unnest(string_to_array(casts,','))as actors,
count(*) as total_content 
from netflix
where country = 'India'
group by 1
order by 2 desc
limit 10














