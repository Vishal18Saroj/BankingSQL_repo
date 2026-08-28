show databases;

create database bankingdb;
use bankingdb;

create table Customers (
	Customer_ID INT,
    FirstName Varchar(20),
    LastName Varchar(20),
    Email varchar(20),
    PhoneNo bigint(20),
    );
    alter table Customers
add column AccountCreationDate date;


select * from Customers;