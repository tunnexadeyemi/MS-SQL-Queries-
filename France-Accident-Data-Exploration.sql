	use PortfolioProject;

	SELECT top 10 *
	FROM PortfolioProject..[nypd-motor-vehicle-collisions] ;
	

	SELECT top 10 ([ZIP CODE]),(BOROUGH),([VEHICLE TYPE CODE 5]),([OFF STREET NAME]), ([ACCIDENT DATE])
	FROM PortfolioProject..[nypd-motor-vehicle-collisions] 
	where ([OFF STREET NAME]) is not null;


	select count ([NUMBER OF PERSONS KILLED]) 
	FROM PortfolioProject..[nypd-motor-vehicle-collisions] ;

	-- Total number of persons killed in accident 
	select sum ([NUMBER OF PERSONS KILLED]) as Total_killed_in_accident  
	FROM PortfolioProject..[nypd-motor-vehicle-collisions] ;


	-- max number of persons killed in accident 
	select max ([NUMBER OF PERSONS KILLED]) as max_killed_in_accident  
	FROM PortfolioProject..[nypd-motor-vehicle-collisions] ;


	-- max number of persons killed in accident based on date  
	select  datepart("DAY", [ACCIDENT DATE]) as date_occurred  ,max ([NUMBER OF PERSONS KILLED]) as max_killed_in_accident 
	FROM PortfolioProject..[nypd-motor-vehicle-collisions]
	Group by ([NUMBER OF PERSONS KILLED]),  ([ACCIDENT DATE])
	order by ([NUMBER OF PERSONS KILLED]) desc;


	-- max number of persons killed in accident based on date  
	select  datepart("MONTH", [ACCIDENT DATE]) as date_occurred  ,max ([NUMBER OF PERSONS KILLED]) as max_killed_in_accident 
	FROM PortfolioProject..[nypd-motor-vehicle-collisions]
	Group by ([NUMBER OF PERSONS KILLED]),  ([ACCIDENT DATE])
	order by ([NUMBER OF PERSONS KILLED]) desc;


	-- max number of persons killed in accident based on date  
	select  datepart("WEEKDAY", [ACCIDENT DATE]) as date_occurred  ,max ([NUMBER OF PERSONS KILLED]) as max_killed_in_accident 
	FROM PortfolioProject..[nypd-motor-vehicle-collisions]
	Group by ([NUMBER OF PERSONS KILLED]),  ([ACCIDENT DATE])
	order by ([NUMBER OF PERSONS KILLED]) desc;

	-- max number of persons killed in accident based on date  
	select  datepart("YEAR", [ACCIDENT DATE]) as date_occurred  ,max ([NUMBER OF PERSONS KILLED]) as max_killed_in_accident 
	FROM PortfolioProject..[nypd-motor-vehicle-collisions]
	Group by ([NUMBER OF PERSONS KILLED]),  ([ACCIDENT DATE])
	order by ([NUMBER OF PERSONS KILLED]) desc;

	-- max number of persons killed in accident based on date  
	select  ([ACCIDENT DATE]) as date_occurred  ,max ([NUMBER OF PERSONS KILLED]) as higest_killed_in_accident 
	FROM PortfolioProject..[nypd-motor-vehicle-collisions]
	Group by ([NUMBER OF PERSONS KILLED]),  ([ACCIDENT DATE])
	order by ([NUMBER OF PERSONS KILLED]) desc;

	---Number of people killed per year

	select ([ACCIDENT DATE]), sum ([NUMBER OF PERSONS KILLED]) as total_killed,([BOROUGH])
	FROM PortfolioProject..[nypd-motor-vehicle-collisions]
	where ([ACCIDENT DATE]) between '2012-01-01T00:00:00.000' and '2013-01-01T00:00:00.000'
	Group by ([NUMBER OF PERSONS KILLED]),  ([ACCIDENT DATE]),([BOROUGH])
	order by ([NUMBER OF PERSONS KILLED]) desc;

	---Number of people killed per year

	select ([ACCIDENT DATE]), sum ([NUMBER OF PERSONS KILLED]) as total_killed,([BOROUGH])
	FROM PortfolioProject..[nypd-motor-vehicle-collisions]
	where ([ACCIDENT DATE]) between '2013-01-01T00:00:00.000' and '2014-01-01T00:00:00.000'
	Group by ([NUMBER OF PERSONS KILLED]),  ([ACCIDENT DATE]),([BOROUGH])
	order by ([NUMBER OF PERSONS KILLED]) desc;

	select ([ACCIDENT DATE]), sum ([NUMBER OF PERSONS KILLED]) as total_killed,([BOROUGH])
	FROM PortfolioProject..[nypd-motor-vehicle-collisions]
	Group by ([NUMBER OF PERSONS KILLED]),  ([ACCIDENT DATE]),([BOROUGH])
	order by ([NUMBER OF PERSONS KILLED]) desc;

	--Higest Number of Accident per Borought
	select  ([BOROUGH]), sum ([NUMBER OF PERSONS KILLED]) as total_killed
	FROM PortfolioProject..[nypd-motor-vehicle-collisions]
	Group by   ([BOROUGH])
	having count  ([BOROUGH]) is not null
	order by 2 desc;


	--Major Contibuting Factor vechicle 1 per count for Accident
	select distinct([CONTRIBUTING FACTOR VEHICLE 1]), count([CONTRIBUTING FACTOR VEHICLE 1]) as count_of_factor
	FROM PortfolioProject..[nypd-motor-vehicle-collisions]
	group by ([CONTRIBUTING FACTOR VEHICLE 1])
	order by count_of_factor desc;


	--Major Contibuting Factor vechicle 2 per count for Accident
	select distinct([CONTRIBUTING FACTOR VEHICLE 2]), count([CONTRIBUTING FACTOR VEHICLE 2]) as count_of_factor
	FROM PortfolioProject..[nypd-motor-vehicle-collisions]
	group by ([CONTRIBUTING FACTOR VEHICLE 2])
	order by count_of_factor desc;

	--Major Contibuting Factor vechicle 3 per count for Accident
	select distinct([CONTRIBUTING FACTOR VEHICLE 3]), count([CONTRIBUTING FACTOR VEHICLE 2]) as count_of_factor
	FROM PortfolioProject..[nypd-motor-vehicle-collisions]
	group by ([CONTRIBUTING FACTOR VEHICLE 3])
	order by count_of_factor desc;


	--Major Contibuting Factor vechicle 4 per count for Accident
	select distinct([CONTRIBUTING FACTOR VEHICLE 4]), count([CONTRIBUTING FACTOR VEHICLE 2]) as count_of_factor
	FROM PortfolioProject..[nypd-motor-vehicle-collisions]
	group by ([CONTRIBUTING FACTOR VEHICLE 4])
	order by count_of_factor desc;

	--Major Contibuting Factor vechicle 5 per count for Accident
	select distinct([CONTRIBUTING FACTOR VEHICLE 5]), count([CONTRIBUTING FACTOR VEHICLE 5]) as count_of_factor
	FROM PortfolioProject..[nypd-motor-vehicle-collisions]
	group by ([CONTRIBUTING FACTOR VEHICLE 5])
	order by count_of_factor desc;


	--Major Contibuting Factor for vechicle 1-5 per count for Accident
	select distinct([CONTRIBUTING FACTOR VEHICLE 1])
	,count([CONTRIBUTING FACTOR VEHICLE 1]) as count_of_factor_1
	,count([CONTRIBUTING FACTOR VEHICLE 2]) as count_of_factor_2
	,count([CONTRIBUTING FACTOR VEHICLE 3]) as count_of_factor_3
	,count([CONTRIBUTING FACTOR VEHICLE 4]) as count_of_factor_4
	,count([CONTRIBUTING FACTOR VEHICLE 5]) as count_of_factor_5

	FROM PortfolioProject..[nypd-motor-vehicle-collisions]
	group by ([CONTRIBUTING FACTOR VEHICLE 1])
	order by count_of_factor_1 desc;

	-- Number of people killed per contributing factor
	select distinct([CONTRIBUTING FACTOR VEHICLE 1])
	,count([CONTRIBUTING FACTOR VEHICLE 1]) as count_of_factor_1
	,count([CONTRIBUTING FACTOR VEHICLE 2]) as count_of_factor_2
	,count([CONTRIBUTING FACTOR VEHICLE 3]) as count_of_factor_3
	,count([CONTRIBUTING FACTOR VEHICLE 4]) as count_of_factor_4
	,count([CONTRIBUTING FACTOR VEHICLE 5]) as count_of_factor_5
	,sum([NUMBER OF PERSONS KILLED]) as Total_killed
	,sum([NUMBER OF PERSONS INJURED]) as Total_Injured
	FROM PortfolioProject..[nypd-motor-vehicle-collisions]
	group by ([CONTRIBUTING FACTOR VEHICLE 1])
	order by count_of_factor_1 desc;


	--Accident to Death ratio (DeathPercentage) by BOROUGH

	Select ([BOROUGH])
		,sum([NUMBER OF PERSONS KILLED]) as Total_death
		,count([NUMBER OF PERSONS KILLED]) as Total_accident
		,(sum([NUMBER OF PERSONS KILLED]))/(count([NUMBER OF PERSONS KILLED]))*100 as DeathPercentage
		FROM PortfolioProject..[nypd-motor-vehicle-collisions]
		group by ([BOROUGH])
		order by DeathPercentage desc;


		--Accident to Death ratio (DeathPercentage)
        select 
		sum([NUMBER OF PERSONS KILLED]) as Total_death
		,count([NUMBER OF PERSONS KILLED]) as Total_accident
		,(sum([NUMBER OF PERSONS KILLED]))/(count([NUMBER OF PERSONS KILLED]))*100 as DeathPercentage
		FROM PortfolioProject..[nypd-motor-vehicle-collisions]
		



	--Major Category of road users killed or injured 
	select	([BOROUGH])
	,sum([NUMBER OF PEDESTRIANS KILLED])  PEDESTRIANS_KILLED
	,sum([NUMBER OF MOTORIST KILLED]) as MOTORIST_KILLED
	,sum([NUMBER OF CYCLIST KILLED]) as CYCLIST_KILLED
	,sum([NUMBER OF CYCLIST INJURED]) as CYCLIST_INJURED
	,sum([NUMBER OF PEDESTRIANS INJURED]) as PEDESTRIANS_INJURED
	,sum([NUMBER OF MOTORIST INJURED]) as MOTORIST_INJURED
	FROM PortfolioProject..[nypd-motor-vehicle-collisions]
	group by [BOROUGH]
	order by  [PEDESTRIANS_KILLED] desc;
	


	--Major Category of road users killed 
	select	([BOROUGH])
	,sum([NUMBER OF PEDESTRIANS KILLED])  PEDESTRIANS_KILLED
	,sum([NUMBER OF MOTORIST KILLED]) as MOTORIST_KILLED
	,sum([NUMBER OF CYCLIST KILLED]) as CYCLIST_KILLED

	FROM PortfolioProject..[nypd-motor-vehicle-collisions]
	group by [BOROUGH]
	order by  [PEDESTRIANS_KILLED] desc;

	--Major Category of road users  injured 
	select	([BOROUGH])
	,sum([NUMBER OF MOTORIST INJURED]) as MOTORIST_INJURED
	,sum([NUMBER OF CYCLIST INJURED]) as CYCLIST_INJURED
	,sum([NUMBER OF PEDESTRIANS INJURED]) as PEDESTRIANS_INJURED
	
	FROM PortfolioProject..[nypd-motor-vehicle-collisions]
	group by [BOROUGH]
	order by 2 desc;


	---Percenatge Injured 

	  
	  SELECT	([BOROUGH])
	,sum([NUMBER OF MOTORIST INJURED]) as MOTORIST_INJURED
	,sum([NUMBER OF CYCLIST INJURED]) as CYCLIST_INJURED
	,sum([NUMBER OF PEDESTRIANS INJURED]) as PEDESTRIANS_INJURED
	,(sum([NUMBER OF MOTORIST INJURED]))/(count([NUMBER OF MOTORIST INJURED]))*100 as PERCENTAGE_MOTORIST_INJURED
	,(sum([NUMBER OF CYCLIST INJURED]))/(count([NUMBER OF CYCLIST INJURED]))*100 as PERCENTAGE_CYCLIST_INJURED
	,(sum([NUMBER OF PEDESTRIANS INJURED]))/(count([NUMBER OF PEDESTRIANS INJURED]))*100 as PERCENTAGE_PEDESTRIANS_INJURED
    FROM PortfolioProject..[nypd-motor-vehicle-collisions]
	GROUP by [BOROUGH]
	ORDER by 2 desc;


--- Number of injured per day

	Select 
	([BOROUGH]),
	([ACCIDENT DATE])
	,sum([NUMBER OF PERSONS INJURED]) sum_of_persons_injured_per_week
	FROM PortfolioProject..[nypd-motor-vehicle-collisions]
	where ([ACCIDENT DATE]) between '2012-07-01' and '2012-07-08' 
	group by([ACCIDENT DATE]),([BOROUGH])
	Order by  2 ;
	

	--- Number of injured per month(july)

	Select 
	([BOROUGH]),
	([ACCIDENT DATE])
	,sum([NUMBER OF PERSONS INJURED]) sum_of_persons_injured_per_week
	FROM PortfolioProject..[nypd-motor-vehicle-collisions]
	where ([ACCIDENT DATE]) between '2012-07-01' and '2012-07-30' 
	group by([ACCIDENT DATE]),([BOROUGH])
	Order by  2 ;

	--- Number of injured per Year

	Select 
	([BOROUGH]),
	([ACCIDENT DATE])
	,sum([NUMBER OF PERSONS INJURED]) sum_of_persons_injured_per_week
	FROM PortfolioProject..[nypd-motor-vehicle-collisions]
	where ([ACCIDENT DATE]) between '2012-07-01' and '2013-07-01' 
	group by([ACCIDENT DATE]),([BOROUGH])
	Order by  3 desc ;



	--- Number of injured based on year

	Select 
	datepart("year",([ACCIDENT DATE])) yearly ,

	sum([NUMBER OF PERSONS INJURED]) sum_of_persons_injured_per_week
	FROM PortfolioProject..[nypd-motor-vehicle-collisions]
	group by([ACCIDENT DATE]),([BOROUGH])
	Order by  2 desc ;



	--- Using   COALESCE to returns the first non-NULL value passed for each row.

	Select [COLLISION_ID]
	,coalesce ([CONTRIBUTING FACTOR VEHICLE 1],[CONTRIBUTING FACTOR VEHICLE 2],[CONTRIBUTING FACTOR VEHICLE 3],[CONTRIBUTING FACTOR VEHICLE 4],
[CONTRIBUTING FACTOR VEHICLE 5]) as Factors
	FROM PortfolioProject..[nypd-motor-vehicle-collisions]

--- Subqueries and common table expressions CTE 
