USE [SRP1]
GO
/****** Object:  StoredProcedure [dbo].[app_PatronReadingLog_Insert]    Script Date: 5/27/2016 1:56:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[app_PatronReadingLog_Insert]    Script Date: 01/05/2015 14:43:24 ******/
--Create the Insert Proc
ALTER PROCEDURE [dbo].[app_PatronReadingLog_Insert] (
	@PID INT,
	@ReadingType INT,
	@ReadingTypeLabel VARCHAR(50),
	@ReadingAmount INT,
	@ReadingPoints INT,
	@LoggingDate VARCHAR(50),
	@Author VARCHAR(50),
	@Title VARCHAR(150),
	@HasReview BIT,
	@ReviewID INT,
	@PRLID INT OUTPUT,
	@HealthChoice Varchar(200)
	)
AS
BEGIN
	INSERT INTO PatronReadingLog (
		PID,
		ReadingType,
		ReadingTypeLabel,
		ReadingAmount,
		ReadingPoints,
		LoggingDate,
		Author,
		Title,
		HasReview,
		ReviewID,
		healthChoice
		)
	VALUES (
		@PID,
		@ReadingType,
		@ReadingTypeLabel,
		@ReadingAmount,
		@ReadingPoints,
		@LoggingDate,
		@Author,
		@Title,
		@HasReview,
		@ReviewID,
		@healthChoice
		)

	SELECT @PRLID = SCOPE_IDENTITY()
END
