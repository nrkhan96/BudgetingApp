--drop database each time i run this, no alters until  i have data
IF (DB_ID('BudgetingApp') is not null)
begin
	drop database BudgetingApp
end
ELSE
begin 
	create database BudgetingApp
end

go

use BudgetingApp;

create table Income 
(
	ID int identity(1,1) primary key,
	Name nvarchar(255),
	IsRecurring bit,
	RecurringDate Date,
	Amount money
)

create table Expense 
(
	ID int identity(1,1) primary key,
	Name nvarchar(255),
	IsRecurring bit,
	RecurringDate Date,
	Amount money
)

create table Frequency
(
	ID int identity(1,1) primary key,
	Value nchar(7)
)

insert into Frequency (Value)
Values ('Daily'), ('Weekly'), ('Monhtly'), ('Yearly')

create table Debt
(
	ID int identity(1,1) primary key,
	Name nvarchar(255),
	FinalDueDate date,
	FinalAmount money,
	FrequencyID int foreign key references Frequency(ID),
	NextPaymentDate Date,
	NextPaymentAmount money
)

create table Category
(
	ID int identity(1,1) primary key,
	Name nvarchar(255),
	BudgetLimit money ,
	BudgetLimitPercentage smallint
)

insert into Category (Name)
values ('Transportation'), ('Housing'), ('Groceries'), ('Entertainment'), ('Subscriptions')

create table Goal
(
	ID int identity(1,1) primary key,
	Name nvarchar(255),
	GoalAmount money,
	GoalDate date,
	FrequencyID int foreign key references Frequency(ID),
	NextSavingDate date,
	NextSavingAmount money
)



