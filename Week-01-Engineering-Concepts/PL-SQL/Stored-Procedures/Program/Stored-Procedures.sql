-- CREATE DATABASE
CREATE DATABASE BankDB;
USE BankDB;

-- =====================================
-- TABLE 1: ACCOUNTS
-- =====================================

CREATE TABLE Accounts (
AccountID INT PRIMARY KEY,
CustomerID INT,
AccountType VARCHAR(20),
Balance DECIMAL(10,2)
);

desc Accounts;

INSERT INTO Accounts VALUES
(101,1,'Savings',10000),
(102,2,'Savings',20000),
(103,3,'Current',15000);

Select * from Accounts;
-- =====================================
-- TABLE 2: EMPLOYEES
-- =====================================

CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY,
EmployeeName VARCHAR(50),
Department VARCHAR(30),
Salary DECIMAL(10,2)
);

desc Employees;
INSERT INTO Employees VALUES
(1,'Ravi','IT',50000),
(2,'Priya','HR',40000),
(3,'Dinesh','IT',60000);

select * from Employees;

-- =====================================
-- SCENARIO 1
-- Process Monthly Interest
-- =====================================

DELIMITER $$

CREATE PROCEDURE ProcessMonthlyInterest()
BEGIN
UPDATE Accounts
SET Balance = Balance + (Balance * 0.01)
WHERE AccountType='Savings';
END$$

DELIMITER ;

CALL ProcessMonthlyInterest();

-- OUTPUT
select * from Accounts;

-- =====================================
-- SCENARIO 2
-- Employee Bonus
-- =====================================

DELIMITER $$

CREATE PROCEDURE UpdateEmployeeBonus(
IN dept_name VARCHAR(30),
IN bonus_percent DECIMAL(5,2)
)
BEGIN
UPDATE Employees
SET Salary = Salary + (Salary * bonus_percent / 100)
WHERE Department = dept_name;
END$$

DELIMITER ;

CALL UpdateEmployeeBonus('IT',10);

-- OUTPUT
SELECT * FROM Employees;

-- =====================================
-- SCENARIO 3
-- Transfer Funds
-- =====================================

DELIMITER $$

CREATE PROCEDURE TransferFunds(
IN FromAccount INT,
IN ToAccount INT,
IN Amount DECIMAL(10,2)
)
BEGIN
DECLARE SourceBalance DECIMAL(10,2);

SELECT Balance
INTO SourceBalance
FROM Accounts
WHERE AccountID = FromAccount;

IF SourceBalance >= Amount THEN

    UPDATE Accounts
    SET Balance = Balance - Amount
    WHERE AccountID = FromAccount;

    UPDATE Accounts
    SET Balance = Balance + Amount
    WHERE AccountID = ToAccount;

    SELECT 'Transfer Successful' AS Result;

ELSE

    SELECT 'Insufficient Balance' AS Result;

END IF;

END$$

DELIMITER ;

CALL TransferFunds(101,102,2000);

-- OUTPUT
SELECT * FROM Accounts;
