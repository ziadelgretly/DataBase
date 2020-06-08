CREATE TABLE Customers (
    [UserName]     NVARCHAR (30)  NOT NULL,
    [Password]     NVARCHAR (50)  NOT NULL,
    [FullName]     NVARCHAR (50)  NOT NULL,
    [Gender]       CHAR (1)       NOT NULL,
    [E-mail]       NVARCHAR (100) NOT NULL,
    [Phone]        NVARCHAR (50)  NOT NULL,
    [Adress]       NVARCHAR (100) NOT NULL,
   
    PRIMARY KEY CLUSTERED ([UserName] ASC)
)
go
CREATE TABLE Orders (
    [OrderID]   NVARCHAR (30) NOT NULL,
    [OrderDate] DATE          NULL,
    [UserName]  NVARCHAR (30) NOT NULL,
    PRIMARY KEY CLUSTERED ([OrderID] ASC),
    CONSTRAINT [FK_Orders_Member] FOREIGN KEY ([UserName]) REFERENCES Customers ([UserName])
)

go

CREATE TABLE Product (
    [ProID]         NVARCHAR (30)  NOT NULL,
    [ProName]       NVARCHAR (50)  NOT NULL,
    [ProDesc]       NVARCHAR (MAX) NULL,
    
    PRIMARY KEY CLUSTERED ([ProID] ASC)
)

go

CREATE TABLE OrderDetails (
    [OrderID]  NVARCHAR (30)  NOT NULL,
    [ProID]    NVARCHAR (30)  NOT NULL,
    [Price]    NUMERIC (8, 2) NOT NULL,
    [Quantity] INT            NOT NULL,
    CONSTRAINT [PK_Table] PRIMARY KEY CLUSTERED ([OrderID] ASC, [ProID] ASC),
    CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY ([OrderID]) REFERENCES [Orders] ([OrderID]),
    CONSTRAINT [FK_OrderDetails_Product] FOREIGN KEY ([ProID]) REFERENCES [Product] ([ProID])
)
go