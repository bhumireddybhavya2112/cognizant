drop database sqlpractice;
create Database sqlpractice;
drop table customers ;
drop table loans;
create table Customers(CustomerID int primary key, Name varchar(50), Age int , Balance float(12,2), IsVIP varchar(1));
create table Loans(LoanID int primary key, CustomerID int , InterestRate float(5,2), DueDate date,CONSTRAINT fk_customer
        FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID));
show tables;
desc customers;
desc Loans;
Insert into Customers values(1, 'Dinesh', 65, 15000, 'N');
INSERT INTO Customers VALUES (2, 'Rahul', 45, 8000, 'N');
INSERT INTO Customers VALUES (3, 'Priya', 70, 20000, 'N');

INSERT INTO Loans VALUES
(101, 1, 10.5, DATE_ADD(SYSDATE(), INTERVAL 15 DAY));
INSERT INTO Loans VALUES
(102, 2, 12.0, DATE_ADD(SYSDATE(), INTERVAL 45 DAY));
INSERT INTO Loans VALUES
(103, 3, 11.0, DATE_ADD(SYSDATE(), INTERVAL 20 DAY));

select * from customers;
select * from loans;
DELIMITER $$

CREATE PROCEDURE ApplyDiscount()
BEGIN
    DECLARE i INT DEFAULT 101;
    DECLARE max_id INT;

    SELECT MAX(LoanID) INTO max_id
    FROM Loans;

    WHILE i <= max_id DO
        UPDATE Loans l
        JOIN Customers c
            ON l.CustomerID = c.CustomerID
        SET l.InterestRate = l.InterestRate - 1
        WHERE l.LoanID = i
          AND c.Age > 60;

        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;
call ApplyDiscount();
DELIMITER $$

CREATE PROCEDURE SetVIP()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE max_id INT;

    SELECT MAX(CustomerID) INTO max_id
    FROM Customers;

    WHILE i <= max_id DO

        UPDATE Customers
        SET IsVIP = TRUE
        WHERE CustomerID = i
          AND Balance > 10000;

        SET i = i + 1;

    END WHILE;
END$$

DELIMITER ;
call SetVIP();
select * from customers;
DELIMITER $$

CREATE PROCEDURE LoanReminder()
BEGIN
    DECLARE i INT DEFAULT 101;
    DECLARE max_id INT;

    SELECT MAX(LoanID) INTO max_id
    FROM Loans;

    WHILE i <= max_id DO

        SELECT CONCAT(
            'Reminder: Loan ',
            LoanID,
            ' is due on ',
            DueDate
        ) AS Reminder_Message
        FROM Loans
        WHERE LoanID = i
          AND DueDate BETWEEN CURDATE()
                          AND DATE_ADD(CURDATE(), INTERVAL 30 DAY);

        SET i = i + 1;

    END WHILE;
END$$

DELIMITER ;
call LoanReminder();
