show databases;

create database bankingdb;
use bankingdb;

create table Customers (
	Customer_ID INT,
    FirstName Varchar(20),
    LastName Varchar(20),
    Email varchar(20),
    PhoneNo bigint(20)
    );
    alter table Customers
add column AccountCreationDate date;

-- added date of birth column to customers.
alter table Customers 
add column DOB Date;

alter table Customers
Modify PhoneNo varchar(20);

alter table Customers
add primary key (Customer_ID);

-- ensured that first name should be mandatory.
ALTER TABLE Customers
modify FirstName varchar(50) not null;

--
alter table Customers
add constraint uq_Email unique (Email);




select * from Customers;

-- ---------------------------------------------------------------------------------------------
-- LAB 2

-- Lab 2:
CREATE TABLE Accounts (
    AccountID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2)
);
describe Accounts;

CREATE TABLE Transactions (
    TransactionID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20)
);

describe Transactions;

CREATE TABLE Branches (
    BranchID INT,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);
CREATE TABLE AccountBranches ( 
		AssignmentDate DATE
);

CREATE TABLE Loans (
    LoanID INT,
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE
);

-- added dateof birth column to customer table
ALTER TABLE Customers
ADD DateOfBirth DATE;

describe Customers;

-- Replaced phone varchar (15) to varchar (20)
alter table  Customers modify PhoneNo varchar(20);

--  checked minimum balance from accounts table
alter table Accounts
add constraint chk_MinBalance
check (balance >= 1000);

show create table Accounts; 

drop table AccountBranches;

-- add PK constarints to Customer Id table


-- foreign key command connect customer and accounts from FK
alter table Accounts
add CustomerID int;

alter table Accounts 
rename column CustomerID to Customer_ID;

-- connect customers and acounts table using FK
alter table Accounts
ADD constraint FK_Accounts_Customers
foreign key (Customer_ID)
references Customers(Customer_ID);

-- not null and first name must have a name from custome table;
alter table Customers 
modify Firstname varchar(50) Not null;

-- each customers email is unique (constraint)
alter table Customers
add constraint uq_Email UNIQUE (Email);



alter table Branches
 modify BranchID INT primary key;

alter table Accounts 
add BranchID int;

alter table Accounts
add constraint fk_Accounts_Branches
foreign key (BranchID)
references Branches(BranchId);

alter table Accounts modify AccountId int primary key;

alter table Transactions 
add AccountId int;

alter table Transactions
add constraint fk_Transactions_Accounts
foreign key (AccountId)
references Accounts(AccountId);


alter table Loans 
add CustomerID int;

alter table Loans
rename column CustomerID to Customer_ID;

alter table Loans 
add constraint fk_Loans_Customers
foreign key (Customer_ID)
references Customers(Customer_Id);

INSERT INTO Customers
(Customer_ID, FirstName, LastName, Email, PhoneNo, DateOfBirth)
VALUES
(101,'Rahul','Sharma','rahul@gmail.com','9876543210','1998-04-15');

insert into Accounts
(AccountId, Customer_Id, AccountType, Balance)
values
(201,101,"Savings",25000);

INSERT INTO Customers
(Customer_ID, FirstName, LastName, Email, PhoneNo, DateOfBirth)
VALUES
(102, 'Priya', 'Patil', 'priya@gmail.com', '9988776655', '2000-09-20'),
(103, 'Amit', 'Patel', 'amit.patel@gmail.com', '9876500001', '1995-06-18'),
(104, 'Sneha', 'Joshi', 'sneha.joshi@gmail.com', '9876500002', '1997-09-12'),
(105, 'Rohan', 'Kulkarni', 'rohan.k@gmail.com', '9876500003', '1993-11-25');

INSERT INTO Accounts
(AccountID, Customer_ID, AccountType, Balance)
VALUES
(202, 102, 'Current', 40000),
(203, 103, 'Savings', 35000),
(204, 104, 'Current', 60000),
(205, 105, 'Savings', 45000);


INSERT INTO Transactions
(TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES
(301, 201, '2025-05-10', 5000, 'Deposit'),
(302, 202, '2025-05-11', 2500, 'Withdraw'),
(303, 203, '2025-05-12', 10000, 'Deposit'),
(304, 204, '2025-05-13', 3000, 'Withdraw'),
(305, 205, '2025-05-14', 7000, 'Deposit');

INSERT INTO Branches
(BranchID, BranchName, BranchAddress, BranchPhone)
VALUES
(1, 'Mumbai Branch', 'Andheri, Mumbai', '0221111111'),
(2, 'Pune Branch', 'Shivaji Nagar, Pune', '0202222222'),
(3, 'Nashik Branch', 'College Road, Nashik', '0253222222'),
(4, 'Nagpur Branch', 'Sitabuldi, Nagpur', '0712333333'),
(5, 'Navi Mumbai Branch', 'Vashi, Navi Mumbai', '0224444444');

INSERT INTO Loans
(LoanID, LoanAmount, InterestRate, StartDate, EndDate, Customer_ID)
VALUES
(301, 500000, 8.50, '2025-01-15', '2030-01-15', 101),
(302, 300000, 9.25, '2025-02-10', '2028-02-10', 102),
(303, 750000, 8.75, '2025-03-20', '2032-03-20', 103),
(304, 250000, 10.00, '2025-04-05', '2029-04-05', 104),
(305, 1000000, 7.95, '2025-05-12', '2035-05-12', 105);

select * from Loans;

select * from branches;



update Customers
set PhoneNo = 9999999999
where Customer_ID = 101;

select * from Customers where Customer_ID = 101;

UPDATE Customers
SET Email='rahul.sharma@gmail.com'
WHERE Customer_ID=101;

select * from Customers where Customer_ID = 101;

delete from  Accounts 
where AccountID = 201;

----------------------------------------------------------------------
/* task 3*/

delete from Transactions where TransactionId = 302;
select * from Transactions;

DELETE FROM Accounts WHERE AccountID = 202;
select * from Accounts;

-------------------------------------------------------------------------------------------------------------------

/*LAB 4*/
-- Task 1

select * from Customers;

select FirstName, LastName,Email, PhoneNo from Customers;

select AccountId, AccountType, Balance from Accounts;

-- Task 2
select * from Accounts where AccountType = "Savings";

SELECT * FROM Accounts where Balance > 25000;

select * from Transactions where Amount BETWEEN 5000 and 20000;

SELECT * FROM Customers WHERE Customer_ID IN (101,102,103);

select * from Customers Where FirstName Like "R%";


-- Activity
select * from Accounts where AccountType = "Current";

Select * from Accounts where Balance < 15000;

select * from Transactions where amount between 1000 and 10000;

select * from Customers where Customer_Id in (104,105);

select * from Customers where LastName like "S%";



-- Task 3

select * from Customers order by FirstName asc;

select * from Accounts order by Balance desc;

select distinct AccountType from Accounts;

select * from Accounts order by Balance desc limit 3;

select * from Transactions limit 5 offset 2;

-- Activity

select * from Customers order by LastName asc;

select * from Transactions order by amount desc;

select distinct TransactionType from Transactions;

select * from Transactions limit 4 offset 3;

-- Task 4

select * from Customers where phoneNo IS NULL;

select * from Customers where Email is not null;

-- Activity
select * from Customers where email is null;

select * from Accounts where balance is not null;

-- Task 5

select accountId, Balance,
case
when balance >= 50000 then "Premium Account"
when balance >= 25000 then "Standard Account"
else "basic account"
end as "Accountcategory"
from Accounts;

select Transactionid, amount,
case
when amount >= 8000 then "High Transaction"
when amount >= 5000 then "Medium Transaction"
else "Low Transaction"
end as "TRansaction Category"
from Transactions; 

-- Task 6
SELECT AccountID,
       Balance,
       RANK() OVER (ORDER BY Balance DESC) AS BalanceRank
FROM Accounts;

SELECT TransactionID,
       Amount,
       SUM(Amount) OVER (ORDER BY TransactionDate) AS RunningTotal
FROM Transactions;

SELECT TransactionID,
       Amount,
       AVG(Amount) OVER () AS AverageTransaction
FROM Transactions;

-- Activity

select transactionId, amount,
rank() over (order by amount) as AmountRank from Transactions;


----------------------------------------------------------------------------------------------------------------------------------

/* Lab 5*/

-- Task 1
select * from Customers where FirstName like "A%";

select * from Customers where Email like "%gmail%";

select * from Customers where LastName like "%kar";


-- Activity

select * from Customers where FirstName like "R%";

select * from Customers where Email like "%Yahoo%";

select * from Customers where LastName like "P%";

select * from Customers where PhoneNo like "%99";

-- Task 2

select * from Accounts where AccountType in ("Savings", "Current");

select * from Transactions where TransactionType in ("Deposit", "Withdraw");

select * from Customers where customer_Id in (101,102,105);

-- Activity

select * from Accounts where AccountType in ("Salary","Savings");

select * from Transactions where TransactionType in ("Payment", "Deposit");

select * from Customers where Customer_Id in (103,104);

select * from Transactions where TransactionId in (302,304);

-- Task 3
select * from Accounts order by Balance desc limit 5;

select * from Customers limit 3;

select * from Transactions limit 2 offset 3;

-- Activity

select * from Transactions order by Amount desc limit 3;

select * from Customers limit 4;

select * from Accounts order by AccountId asc limit 5 offset 2;

select * from Transactions limit 5;


SELECT *
FROM Accounts
WHERE AccountType = 'Savings'
ORDER BY Balance DESC;

SELECT *
FROM Customers
WHERE FirstName LIKE 'S%'
LIMIT 5;

SELECT *
FROM Transactions
WHERE TransactionType IN ('Deposit','Withdrawal')
ORDER BY TransactionDate DESC;
-------------------------------------------------------------------------------------------------------------------------

/* LAB - 6 */
--------------

select * from customers;

SELECT
FirstName,
UPPER(FirstName) AS UpperCaseName
FROM customers;

SELECT
FirstName,
LOWER(FirstName) AS LowerCaseName
FROM customers;

SELECT
FirstName,
LENGTH(FirstName) AS NameLength
FROM customers;

SELECT
FirstName,
LEFT(FirstName,3) AS Initials
FROM customers;

SELECT
CONCAT(FirstName,' - ',LastName) AS FullName
FROM customers;

SELECT ROUND(1256.75) AS Rounded_Value;

SELECT CEIL(1256.25) AS Ceiling_Value;

SELECT FLOOR(1256.75) AS Floor_Value;

SELECT ABS(-2500) AS Absolute_Value;

SELECT MOD(25,4) AS Remainder;

select * from customers;

SELECT CURDATE(); 

SELECT NOW();

SELECT
Customer_ID,
YEAR(DateOfBirth) AS BirthYear
FROM customers;

SELECT
Customer_ID,
MONTH(DateOfBirth) AS BirthMonth
FROM customers;

SELECT
Customer_ID,
DATEDIFF(CURDATE(),DateOfBirth) AS Days
FROM customers;

SELECT
    FirstName,
    DateOfBirth,
    IF(YEAR(DateOfBirth) <= 1995,
       'Adult',
       'Young') AS Category
FROM Customers;

SELECT
    FirstName,
    IFNULL(PhoneNo, 'Not Available') AS PhoneNumber
FROM Customers;

SELECT GREATEST(
'2000-09-20',
'1995-06-18',
'1997-09-12',
'1993-11-25'
) AS LatestBirthDate;

SELECT LEAST(
'2000-09-20',
'1995-06-18',
'1997-09-12',
'1993-11-25'
) AS EarliestBirthDate;

SELECT
    FirstName,
    NULLIF(FirstName,'Priya') AS Result
FROM Customers;

SELECT SUM(Balance) as total_balance
FROM Accounts;

SELECT AVG(Balance) AS average_balance
FROM Accounts;

SELECT MAX(Balance) AS highest_balance
FROM Accounts;

SELECT MIN(Balance) AS lowest_balance
FROM Accounts;

SELECT COUNT(*) AS total_accounts
FROM Accounts;

SELECT 
    AccountType,
    SUM(Balance) AS TotalBalance
FROM Accounts
GROUP BY AccountType;

SELECT 
    AccountType,
    SUM(Balance) AS TotalBalance
FROM Accounts
GROUP BY AccountType
HAVING SUM(Balance) > 25000;
 
------------------------------------------------------------------------------------------------------------------------
-- LAB 7 :

select * from loans;

select loanid, customer_id, loanamount,
rank() over(order by loanamount desc) as "loan_rank"
from loans;

select loanid, customer_id, loanamount,
dense_rank() over(order by loanamount desc) as "loan_denserank"
from loans;

select loanid, customer_id, loanamount,
row_number() over( order by loanamount desc) as "loan_rownumber"
from loans;

select loanid, customer_id, loanamount,
row_number() over( partition by customer_id order by loanamount desc ) as RowNum
from loans;

select loanid, customer_id, loanamount,
sum(Loanamount) over(order by LoanAmount desc) as RunningTotal
from Loans;

-- LAG FUNCTION retrieves the value from the previous row
-- LEAD FUNCTION retrieves the value from the further row

select loanid, customer_id, loanamount,
lag(LoanAmount) over (order by LoanAmount desc) as PreviousloanAmount
from Loans;


select loanid, customer_id, loanamount,
lead(LoanAmount) over (order by Loanamount Desc) as NextLoanAmount
from loans;

--------------------------------------------------------------------------------------------------------------------
/*
LAB 8 :
*/

-- Task 1 : Generate accounts transaction report.

SELECT
    a.AccountID, a.AccountType, a.Balance,
    t.TransactionID,
    t.TransactionDate,
    t.TransactionType,
    t.Amount
FROM Accounts a
INNER JOIN Transactions t
ON a.AccountID = t.AccountID;


-- Task 2 : Display All Accounts Including Those Without Transactions

SELECT
    a.AccountID, a.AccountType, a.Balance,
    t.TransactionID,
    t.TransactionDate,
    t.TransactionType,
    t.Amount
FROM Accounts a
LEFT JOIN Transactions t
ON a.AccountID = t.AccountID;


-- Task 3 : Generate Deposit Transaction Reports

SELECT
    a.AccountID, a.AccountType, a.Balance,
    t.TransactionID,
    t.TransactionDate,
    t.TransactionType,
    t.Amount
FROM Accounts a
INNER JOIN Transactions t
ON a.AccountID = t.AccountID
WHERE t.TransactionType = 'Deposit';


-- Task 4 : Generate High Balance Account Transaction Reports
SELECT
    a.AccountID, a.AccountType, a.Balance,
    t.TransactionID,
    t.TransactionDate,
    t.TransactionType,
    t.Amount
FROM Accounts a
INNER JOIN Transactions t
ON a.AccountID = t.AccountID
WHERE a.Balance > 30000
ORDER BY a.Balance DESC;
    
    
-- -------------------------------------------------------------------------------------------------------------------------
/*
LAB 9
*/

-- TASK 1 : Identify transactions above the average transaction amount.

select * from transactions;

select * from transactions
where amount >
	(
    select avg(Amount)
    from transactions
    );
    

-- TASK 2 : Identify accounts with Above-Average balance.

select * from accounts
where balance >
	(
    select avg(balance)
    from accounts
    );
    
    
-- TASK 3 : Identify deposit accounts using a multi-row subquery.

select accountid from transactions
	where TransactionType = "deposit";
    
select * from accounts;

select accountid, accounttype, balance
from accounts where
AccountId in (
	select AccountId from transactions
    where transactiontype = "deposit"
);


-- TASK 4 : Identify the account with the highest balance.

select accountid, accounttype, balance, customer_id
from accounts where balance = (select max(balance) from accounts);


-- -----------------------------------------------------------------------------------------------------------------------

/*
LAB 10 :
*/

-- TASK 1 : create a view for High-Balance Accounts.

create view High_Balance_Accounts as
select accountid, accounttype, balance, customer_id
from accounts where Balance > 30000;


-- TASK 2 : RETRIEVE DATA

select * from High_Balance_Accounts;


-- TASK 3 : Modify the View to include transaction details

create or replace view High_Balance_Accounts as
select 
	a.accountid, a.accounttype, a.balance, a.customer_id,
    t.transactionid, t.transactiondate, t.transactiontype, t.amount
    from accounts a inner join transactions t on a.AccountId = t.AccountId
    where a.Balance > 30000;
    
    select * from High_Balance_Accounts;
    
    
-- TASK 4 : Generate Banking reports using the view

SELECT
    AccountID,AccountType,Balance,Customer_ID,TransactionID,TransactionDate,TransactionType,Amount
	FROM High_Balance_Accounts
	ORDER BY Balance DESC;

