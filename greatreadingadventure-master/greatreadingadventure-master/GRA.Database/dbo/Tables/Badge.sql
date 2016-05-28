﻿CREATE TABLE [dbo].[Badge] (
    [BID]                       INT           IDENTITY (1000, 1) NOT NULL,
    [AdminName]                 NVARCHAR(255)  NULL,
    [UserName]                  NVARCHAR(255)  NULL,
    [GenNotificationFlag]       BIT           NULL,
    [NotificationSubject]       VARCHAR (150) NULL,
    [NotificationBody]          TEXT          NULL,
    [CustomEarnedMessage]       TEXT          NULL,
    [IncludesPhysicalPrizeFlag] BIT           NULL,
    [PhysicalPrizeName]         VARCHAR (50)  NULL,
    [AssignProgramPrizeCode]    BIT           CONSTRAINT [DF_Badge_AssignProgramPrizeCode] DEFAULT ((0)) NULL,
    [PCNotificationSubject]     VARCHAR (150) NULL,
    [PCNotificationBody]        TEXT          NULL,
    [LastModDate]               DATETIME      CONSTRAINT [DF_Badge_LastModDate] DEFAULT (getdate()) NULL,
    [LastModUser]               VARCHAR (50)  CONSTRAINT [DF_Badge_LastModUser] DEFAULT ('N/A') NULL,
    [AddedDate]                 DATETIME      CONSTRAINT [DF_Badge_AddedDate] DEFAULT (getdate()) NULL,
    [AddedUser]                 VARCHAR (50)  CONSTRAINT [DF_Badge_AddedUser] DEFAULT ('N/A') NULL,
    [TenID]                     INT           NULL,
    [FldInt1]                   INT           NULL,
    [FldInt2]                   INT           NULL,
    [FldInt3]                   INT           NULL,
    [FldBit1]                   BIT           NULL,
    [FldBit2]                   BIT           NULL,
    [FldBit3]                   BIT           NULL,
    [FldText1]                  TEXT          NULL,
    [FldText2]                  TEXT          NULL,
    [FldText3]                  TEXT          NULL,
    [HiddenFromPublic] BIT NULL, 
    CONSTRAINT [PK_Badge] PRIMARY KEY CLUSTERED ([BID] ASC)
);
