
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/18/2022 03:29:47
-- Generated from EDMX file: C:\Users\MinhTri\Desktop\lib-master\lib-master\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [lib];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_book_author]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[book] DROP CONSTRAINT [FK_book_author];
GO
IF OBJECT_ID(N'[dbo].[FK_book_category]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[book] DROP CONSTRAINT [FK_book_category];
GO
IF OBJECT_ID(N'[dbo].[FK_book_publisher]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[book] DROP CONSTRAINT [FK_book_publisher];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[author]', 'U') IS NOT NULL
    DROP TABLE [dbo].[author];
GO
IF OBJECT_ID(N'[dbo].[book]', 'U') IS NOT NULL
    DROP TABLE [dbo].[book];
GO
IF OBJECT_ID(N'[dbo].[category]', 'U') IS NOT NULL
    DROP TABLE [dbo].[category];
GO
IF OBJECT_ID(N'[dbo].[issuebook]', 'U') IS NOT NULL
    DROP TABLE [dbo].[issuebook];
GO
IF OBJECT_ID(N'[dbo].[member]', 'U') IS NOT NULL
    DROP TABLE [dbo].[member];
GO
IF OBJECT_ID(N'[dbo].[publisher]', 'U') IS NOT NULL
    DROP TABLE [dbo].[publisher];
GO
IF OBJECT_ID(N'[dbo].[returnbook]', 'U') IS NOT NULL
    DROP TABLE [dbo].[returnbook];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'authors'
CREATE TABLE [dbo].[authors] (
    [id] int IDENTITY(1,1) NOT NULL,
    [name] varchar(50)  NULL,
    [address] varchar(50)  NULL,
    [phone] varchar(50)  NULL
);
GO

-- Creating table 'categories'
CREATE TABLE [dbo].[categories] (
    [id] int IDENTITY(1,1) NOT NULL,
    [catname] varchar(50)  NULL,
    [status] varchar(50)  NULL
);
GO

-- Creating table 'publishers'
CREATE TABLE [dbo].[publishers] (
    [id] int IDENTITY(1,1) NOT NULL,
    [name] varchar(50)  NULL,
    [address] varchar(50)  NULL,
    [phone] varchar(50)  NULL
);
GO

-- Creating table 'members'
CREATE TABLE [dbo].[members] (
    [id] int IDENTITY(1,1) NOT NULL,
    [name] varchar(50)  NULL,
    [address] varchar(50)  NULL,
    [phone] int  NULL
);
GO

-- Creating table 'books'
CREATE TABLE [dbo].[books] (
    [id] int IDENTITY(1,1) NOT NULL,
    [bname] varchar(50)  NULL,
    [cat_id] int  NULL,
    [a_id] int  NULL,
    [p_id] int  NULL,
    [contents] varchar(50)  NULL,
    [pages] int  NULL,
    [edition] varchar(50)  NULL
);
GO

-- Creating table 'issuebooks'
CREATE TABLE [dbo].[issuebooks] (
    [id] int IDENTITY(1,1) NOT NULL,
    [m_id] int  NULL,
    [book_id] varchar(50)  NOT NULL,
    [issuedate] datetime  NULL,
    [returndate] datetime  NULL
);
GO

-- Creating table 'returnbooks'
CREATE TABLE [dbo].[returnbooks] (
    [id] int IDENTITY(1,1) NOT NULL,
    [mid] int  NULL,
    [book] varchar(50)  NULL,
    [returndate] datetime  NULL,
    [elap] int  NULL,
    [fine] int  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [id] in table 'authors'
ALTER TABLE [dbo].[authors]
ADD CONSTRAINT [PK_authors]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'categories'
ALTER TABLE [dbo].[categories]
ADD CONSTRAINT [PK_categories]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'publishers'
ALTER TABLE [dbo].[publishers]
ADD CONSTRAINT [PK_publishers]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'members'
ALTER TABLE [dbo].[members]
ADD CONSTRAINT [PK_members]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'books'
ALTER TABLE [dbo].[books]
ADD CONSTRAINT [PK_books]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'issuebooks'
ALTER TABLE [dbo].[issuebooks]
ADD CONSTRAINT [PK_issuebooks]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'returnbooks'
ALTER TABLE [dbo].[returnbooks]
ADD CONSTRAINT [PK_returnbooks]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [a_id] in table 'books'
ALTER TABLE [dbo].[books]
ADD CONSTRAINT [FK_book_author]
    FOREIGN KEY ([a_id])
    REFERENCES [dbo].[authors]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_book_author'
CREATE INDEX [IX_FK_book_author]
ON [dbo].[books]
    ([a_id]);
GO

-- Creating foreign key on [cat_id] in table 'books'
ALTER TABLE [dbo].[books]
ADD CONSTRAINT [FK_book_category]
    FOREIGN KEY ([cat_id])
    REFERENCES [dbo].[categories]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_book_category'
CREATE INDEX [IX_FK_book_category]
ON [dbo].[books]
    ([cat_id]);
GO

-- Creating foreign key on [p_id] in table 'books'
ALTER TABLE [dbo].[books]
ADD CONSTRAINT [FK_book_publisher]
    FOREIGN KEY ([p_id])
    REFERENCES [dbo].[publishers]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_book_publisher'
CREATE INDEX [IX_FK_book_publisher]
ON [dbo].[books]
    ([p_id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------