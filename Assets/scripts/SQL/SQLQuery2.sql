-- 1. Rename the columns 
/*
EXEC sp_rename 'dbo.YT_UAE_2024.Subscribers', 'Total_Subscribers', 'COLUMN';
EXEC sp_rename 'dbo.YT_UAE_2024.Views', 'Total_Views', 'COLUMN';
EXEC sp_rename 'dbo.YT_UAE_2024.Total_Videos', 'Total_Videos', 'COLUMN';
*/

--create a view 
-- we can change the data type if needed by using the cast function CAST(your_column AS INT) AS your_column,

CREATE VIEW view_uae_youtubers_2024 as
SELECT TOP (100) [Channel_Names] 
      ,[Total_Subscribers]
      ,[Total_Views]
      ,[Total_Videos]
  FROM [YouTube_db].[dbo].[YT_UAE_2024]
  ORDER BY Total_Views DESC






  -- check the duplicated data on the main table 

  SELECT 
	channel_names,
	COUNT(*) as duplicate_count
FROM 
	[dbo].[YT_UAE_2024]

GROUP BY 
	Channel_Names 
HAVING 
	COUNT(*) > 1 




	-----------------------------------------------------




 WITH CTE AS (
    SELECT 
        channel_names,
        ROW_NUMBER() OVER (PARTITION BY channel_names ORDER BY (SELECT NULL)) AS RowNum
    FROM 
        [dbo].[YT_UAE_2024]
)
DELETE FROM CTE WHERE RowNum > 1;





-- Drop the old view and make new one 
-- # Drop 

drop view [dbo].[view_uae_youtubers_2024]

-- # create new one 
CREATE VIEW view_uae_youtubers_2024 as
SELECT TOP (100) CAST ([Channel_Names] AS nvarchar(100)) AS Channel_Names 
      ,[Total_Subscribers]
      ,[Total_Views]
      ,[Total_Videos]
  FROM [YouTube_db].[dbo].[YT_UAE_2024]
  ORDER BY Total_Views DESC
