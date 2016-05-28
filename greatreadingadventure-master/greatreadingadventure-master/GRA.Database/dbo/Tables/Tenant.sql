﻿CREATE TABLE [dbo].[Tenant] (
    [TenID]                 INT           IDENTITY (1, 1) NOT NULL,
    [Name]                  NVARCHAR(255) NULL,
    [LandingName]           NVARCHAR(255)  NULL,
    [AdminName]             NVARCHAR(255)  NULL,
    [isActiveFlag]          BIT           CONSTRAINT [DF_Tenant_isActiveFlag] DEFAULT ((0)) NULL,
    [isMasterFlag]          BIT           CONSTRAINT [DF_Tenant_isMasterFlag] DEFAULT ((0)) NULL,
    [Description]           TEXT          NULL,
    [DomainName]            NVARCHAR(255)  NULL,
    [showNotifications]     BIT           CONSTRAINT [DF_Tenant_showNotifications] DEFAULT ((1)) NULL,
    [showOffers]            BIT           CONSTRAINT [DF_Tenant_showOffers] DEFAULT ((1)) NULL,
    [showBadges]            BIT           CONSTRAINT [DF_Tenant_showBadges] DEFAULT ((1)) NULL,
    [showEvents]            BIT           CONSTRAINT [DF_Tenant_showEvents] DEFAULT ((1)) NULL,
    [NotificationsMenuText] NVARCHAR(255)  CONSTRAINT [DF_Tenant_NotificationsMenuText] DEFAULT ('Mail') NULL,
    [OffersMenuText]        NVARCHAR(255)  CONSTRAINT [DF_Tenant_OffersMenuText] DEFAULT ('Offers') NULL,
    [BadgesMenuText]        NVARCHAR(255)  CONSTRAINT [DF_Tenant_BadgesMenuText] DEFAULT ('Badges') NULL,
    [EventsMenuText]        NVARCHAR(255)  CONSTRAINT [DF_Tenant_EventsMenuText] DEFAULT ('Events') NULL,
    [LastModDate]           DATETIME      CONSTRAINT [DF_Tenant_LastModDate] DEFAULT (getdate()) NULL,
    [LastModUser]           VARCHAR (50)  CONSTRAINT [DF_Tenant_LastModUser] DEFAULT ('N/A') NULL,
    [AddedDate]             DATETIME      CONSTRAINT [DF_Tenant_AddedDate] DEFAULT (getdate()) NULL,
    [AddedUser]             VARCHAR (50)  CONSTRAINT [DF_Tenant_AddedUser] DEFAULT ('N/A') NULL,
    [FldInt1]               INT           NULL,
    [FldInt2]               INT           NULL,
    [FldInt3]               INT           NULL,
    [FldBit1]               BIT           NULL,
    [FldBit2]               BIT           NULL,
    [FldBit3]               BIT           NULL,
    [FldText1]              TEXT          NULL,
    [FldText2]              TEXT          NULL,
    [FldText3]              TEXT          NULL,
    CONSTRAINT [PK_Tenant] PRIMARY KEY CLUSTERED ([TenID] ASC)
);

