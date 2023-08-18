--Pulled csvs

-- this is probably the most simple cast dashboard to pull. 
-- used in my first viz
select c.timestamp
, c.created_at 
, c.fid
, c.text
, encode(c.hash, 'hex')
, encode(c.parent_hash, 'hex')
, c.mentions
, c.embeds
from casts c
order by 1 desc

--total posts  

select count(*)
from casts c

--percentage reply
select (select COUNT(*) from casts  where parent_hash is not null)/count(*) as per
from public.casts 

--avg posts per day  

select avg(*)
from casts c

-- avg per hour


--Casts by type

with reply as (select date_trunc('month', c.timestamp) as "month"
, count(c.timestamp) as reply_c
from public.casts c
where c.parent_hash is not null
group by 1
)

, cast_count as (
select date_trunc('month', c.timestamp) as "month"
, count(c.timestamp) as casts_c
from public.casts c
where c.parent_hash is null
group by 1
)
, total_rolling as (
select date_trunc('month', c.timestamp) as "month"
, count(c.timestamp)
, SUM(COUNT(*)) OVER (ORDER BY date_trunc('month', c.timestamp) ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS rolling_sum
from public.casts c
group by 1 
)

select tr."month"
, cc.casts_c
, r.reply_c
, tr.rolling_sum
from total_rolling tr
left join reply r on r."month" = tr."month"
left join cast_count cc on cc."month" = tr."month"
order by 1

--casts by day

with reply as (
select  EXTRACT(DOW FROM c.timestamp) AS day_of_week 
, count(c.timestamp) as reply_c
from public.casts c
where c.parent_hash is not null
group by 1
)

, cast_count as (
select  EXTRACT(DOW FROM c.timestamp) AS day_of_week 
, count(c.timestamp) as casts_c
from public.casts c
where c.parent_hash is null
group by 1
)

select cc.day_of_week
, cc.casts_c
, r.reply_c
from cast_count cc
left join reply r on r.day_of_week = cc.day_of_week
order by 1

--casts by hour

with reply as (
select  EXTRACT(hour FROM c.timestamp) AS day_of_week 
, count(c.timestamp) as reply_c
from public.casts c
where c.parent_hash is not null
group by 1
)

, cast_count as (
select  EXTRACT(hour FROM c.timestamp) AS day_of_week 
, count(c.timestamp) as casts_c
from public.casts c
where c.parent_hash is null
group by 1
)

select cc.day_of_week
, cc.casts_c
, r.reply_c
from cast_count cc
left join reply r on r.day_of_week = cc.day_of_week
order by 1
