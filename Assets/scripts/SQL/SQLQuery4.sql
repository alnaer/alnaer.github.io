/*

# Data quality tests 

1. The data needs to be 100 records of YouTube channels (row count test)	--- (passed!!!)
2. The data needs 4 fields (column count test)								--- (passed!!!)
3. The channel name column must be string format, and the other columns must be numerical data types (data type check)    --- (passed!!!)
4. Each record must be unique in the dataset (duplicate count check)  --- (passed!!!)

-- # I chose the NVARCHAR because the channels some of them are writtien by Arabic 

Row count - 100 
Column count - 4


Data types

channel_name = NVARCHAR
total_subscribers = INTEGER
total_views = INTEGER
total_videos = INTEGER

Duplicate count = 0


*/


-- 1. Row count check 
SELECT 
	COUNT(*) as no_of_rows
FROM view_uae_youtubers_2024




-- 2. Column count check 

SELECT 
	COUNT(*) as column_count 
FROM 
	INFORMATION_SCHEMA.COLUMNS
WHERE 
	TABLE_NAME = 'view_uae_youtubers_2024'





-- 3. Data type check 


SELECT 
	COLUMN_NAME,
	DATA_TYPE
FROM 
	INFORMATION_SCHEMA.COLUMNS
WHERE 
	TABLE_NAME = 'view_uae_youtubers_2024'




-- 4. Duplicate records check

SELECT 
	channel_names,
	COUNT(*) as duplicate_count
FROM 
	view_uae_youtubers_2024

GROUP BY 
	Channel_Names 
HAVING 
	COUNT(*) > 1 