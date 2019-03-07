CREATE TABLE [dbo].[Items] (
    [Id]          INT          IDENTITY (1, 1) NOT NULL,
    [ItemName]    VARCHAR (50) NOT NULL,
    [Description] TEXT         NULL,
    [created_at]  DATETIME     NULL,
    [updated_at]  DATETIME     NULL,
    [deleted_at]  DATETIME     NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[ItemsInventories] (
    [Id]         INT      NOT NULL,
    [LocationId] INT      NOT NULL,
    [ItemId]     INT      NOT NULL,
    [Qty]        INT      NOT NULL,
    [created_at] DATETIME NULL,
    [updated_at] DATETIME NULL,
    [deleted_at] DATETIME NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[Locations] (
    [Id]           INT          NOT NULL,
    [LocationName] VARCHAR (50) NOT NULL,
    [Description]  VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[StockJournal] (
    [Id]             INT      NOT NULL,
    [ItemId]         INT      NOT NULL,
    [FromLocationId] INT      NOT NULL,
    [ToLocationId]   INT      NOT NULL,
    [QtyMoved]       INT      NOT NULL,
    [UserId]         INT      NOT NULL,
    [created_at]     DATETIME NULL,
    [updated_at]     DATETIME NULL,
    [deleted_at]     DATETIME NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[UnitOfMeasure] (
    [Id]          INT          NOT NULL,
    [description] VARCHAR (50) NULL,
    [Unit]        VARCHAR (50) NOT NULL,
    [created_at]  DATETIME     NULL,
    [updated_at]  DATETIME     NULL,
    [deleted_at]  DATETIME     NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[Users] (
    [Id]         INT          NOT NULL,
    [username]   VARCHAR (50) NOT NULL,
    [password]   VARCHAR (50) NOT NULL,
    [role]       VARCHAR (50) DEFAULT (user_name()) NOT NULL,
    [is_active]  BIT          DEFAULT ((1)) NOT NULL,
    [created_at] DATETIME     NULL,
    [updated_at] DATETIME     NULL,
    [deleted_at] DATETIME     NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE PROCEDURE [dbo].[spAddNewItem]
	@ItemName text,
	@Description text,
	@CreatedAt datetime
AS
	INSERT INTO Items(ItemName, Description, created_at) VALUES (@ItemName, @Description, @CreatedAt)
RETURN @@ROWCOUNT

CREATE PROCEDURE [dbo].[spDeleteItem]
	@ItemId int = 0,
	@DeletedAt DATETIME,
	@SoftDelete bit
AS

	IF @ItemId > 0
	BEGIN
		IF @SoftDelete = 1
		BEGIN
		
			UPDATE Items 
			SET deleted_at = @DeletedAt
			Where Id = @ItemId
		END
		ELSE
		BEGIN
			DELETE FROM Items WHERE Id = @ItemId
		END

	End
	
RETURN 0

/**
Procedure: spGetItemById
Description:
			Get specific stock item by its Id
Params:
	@ItemId:			Id of the stock item
	@IncludeDeleted:	Include soft deleted items

Author:
	Syed Ali Raza
Contact:
	amr.shah@gmail.com
	https://amrshah.github.io/
	+92-334-5112969
*/
CREATE PROCEDURE [dbo].[spGetItemById]
	@ItemId int,
	@IncludeDeleted bit = 0
AS
	IF @IncludeDeleted=0
		BEGIN
			SELECT * FROM Items WHere Id = @ItemId
		END
	ELSE
		BEGIN 
			SELECT * FROM Items Where Id=@ItemId AND deleted_at = null
		END
RETURN 0

CREATE PROCEDURE [dbo].[spInsertIntoUsers]
	@username varchar(50),
	@password varchar (50),
	@role varchar(50)="User",
	@is_active bit = 1,
	@created_at DATETIME =NOW 
AS
	INSERT INTO Users Values (0, @username, @password, @role, @is_active, @created_at, NULL, NULL)
RETURN 0

CREATE PROCEDURE [dbo].[spUpdateItem]
	@ItemName text,
	@Description text,
	@ItemId int,
	@UpdatedAt datetime
AS
	UPDATE Items SET 
		ItemName = @ItemName,
		Description = @Description, 
		updated_at = @UpdatedAt
	WHERE Id = @ItemId
RETURN @@ROWCOUNT

CREATE PROCEDURE [dbo].[spUpdateUserPassword]
	@newpassword varchar (50),
	@userid int
AS
	update users
		set password = @newpassword
	where users.Id = @userid
RETURN 0