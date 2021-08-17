# loading the  athelete events dataset
select * from world.athlete_events

# loading the  noc regions dataset
select * from world.noc_regions

# merging the two datasets
select *
from world.athlete_events left join world.noc_regions
on world.athlete_events.NOC = world.noc_regions.NOC

# Indian athletes details
select * from world.athlete_events where world.athlete_events.Team = 'India'

# winter olympics sports
select distinct world.athlete_events.Sport from world.athlete_events where world.athlete_events.Season = 'Winter'

# summer olympics sports
select distinct world.athlete_events.Sport from world.athlete_events where world.athlete_events.Season = 'Summer'

# Total medals won
select world.athlete_events.Medal, count(*) from world.athlete_events group by world.athlete_events.Medal

# Finding out the cities that have hosted Games
select world.athlete_events.City, world.athlete_events.Year, count(world.athlete_events.Occurance) as Occurance from world.athlete_events
group by world.athlete_events.City order by Occurance

# Finding out participation of Men and Women at the Olympic games
select count(world.athlete_events.ID) from world.athlete_events
select count(world.athlete_events.ID) from world.athlete_events where  world.athlete_events.Sex = 'F'
select count(world.athlete_events.ID) from world.athlete_events where  world.athlete_events.Sex = 'M'

# medals by India
select world.athlete_events.Medal, count(*) from world.athlete_events where world.athlete_events.Team = 'India' 
group by world.athlete_events.Medal

# Top  10 countries with highest participants since starting of olympics
select world.athlete_events.Team, count(*) from world.athlete_events group by world.athlete_events.Team 
order by count(*) DESC limit 10

# male and female athletes
select world.athlete_events.Sex, count(*) from world.athlete_events group by world.athlete_events.Sex

# total number of female atheletes in each year
select world.athlete_events.Year, count(world.athlete_events.ID) from world.athlete_events where  world.athlete_events.Sex = 'F' 
group by world.athlete_events.Year order by world.athlete_events.Year 

# Gold medal athletes
select * from world.athlete_events where world.athlete_events.Medal = 'Gold'

# gold medals beyond age 60
select count(*) from world.athlete_events where world.athlete_events.Medal = 'Gold' and world.athlete_events.Age > 60

# Gold medals from each country
select world.athlete_events.Team, count(*) from world.athlete_events where world.athlete_events.Medal = 'Gold'
group by world.athlete_events.Team order by count(*) DESC

# Rio olympics
select world.athlete_events.Team, count(*) from world.athlete_events 
where world.athlete_events.Medal = 'Gold' and world.athlete_events.Year = 2016
group by world.athlete_events.Team order by count(*) DESC
