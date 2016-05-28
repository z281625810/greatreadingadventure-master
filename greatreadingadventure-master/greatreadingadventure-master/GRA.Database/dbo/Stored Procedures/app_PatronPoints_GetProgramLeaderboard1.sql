USE [SRP1]
GO
/****** Object:  StoredProcedure [dbo].[app_PatronPoints_GetProgramLeaderboard1]    Script Date: 5/27/2016 6:15:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[app_PatronPoints_GetProgramLeaderboard1]
	
AS
	select Grade.SchoolGrade, sum(temp.NumPoints) as TotalPoint from		
(select SchoolGrade, NumPoints from SRP1.dbo.PatronPoints,SRP1.dbo.Patron where PatronPoints.PID = Patron.PID)temp,Grade 
where temp.SchoolGrade = Grade.SchoolGrade group by Grade.SchoolGrade order by Grade.SchoolGrade*1 asc;



