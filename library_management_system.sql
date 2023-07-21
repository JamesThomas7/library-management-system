create  database library;
use library;
create table branch(Branch_no int  PRIMARY KEY ,Manager_Id int, Branch_address varchar(100) ,Contact_no varchar(20));
INSERT INTO branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
 (1, 11, 'district1', '123'),
 (2, 12, 'district2', '987'),
 (3, 13, 'district3', '345'),
 (4, 14, 'district4', '456'),
 (5, 15, 'district5', '567');
select * from branch;
create table Employee(Emp_Id int PRIMARY KEY, Emp_name  varchar(20),Position varchar(200), Salary float);
alter table employee
modify Salary float;
alter table employee
modify position varchar(200);
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary) VALUES
 (101, 'An', 'Manager', 80000.00),
 (102, 'gok', 'Librarian', 90000.00),
 (103, 'Gokul', 'Assistant Manager', 25000.00),
 (104, 'Sak', 'Assistant Manager', 28000.00),
 (105, 'hay', 'Branch Manager', 40000.00);
create table Customer (Customer_Id  int PRIMARY KEY, Customer_name varchar(20), Customer_address varchar(200),Reg_date date);
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
(1001, 'An', '123 Street', '2021-01-01'),
(1002, 'abc', '456 Street', '2023-02-15'),
(1003, 'ghi', '789 Street', '2023-03-30'),
(1004, 'jkl', '987 Street', '2023-04-10'),
(1005, 'mno', '654 Street', '2023-05-20');

  create table book(ISBN varchar(200) PRIMARY KEY,book_title varchar(200),category varchar(200),rental_price decimal,status ENUM('yes','no'),
  author varchar(200),publisher varchar(200));
INSERT INTO book (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES('ISBN-123', 'Book1', 'Fiction', 14.00, 'Yes', 'Author1', 'Publisher1'),
('ISBN-456', 'Book2', 'Non-Fiction', 12.50, 'Yes', 'Author2', 'Publisher2'),
('ISBN-789', 'Book3', 'Mystery', 2.00, 'No', 'Author3', 'Publisher3'),
('ISBN-753', 'Book4', 'History', 9.99, 'Yes', 'Author4', 'Publisher4'),
('ISBN-852', 'Book5', 'Thriller', 18.25, 'No', 'Author5', 'Publisher5');
select * from book;
create table issuestatus(Issue_Id int primary key,issued_cust int ,Issued_book_name varchar(200), Issue_date date, Isbn_book varchar(200),
FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
  FOREIGN KEY (Isbn_book) REFERENCES book(ISBN));
INSERT INTO issueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
(1, 1001, 'Book1', '2020-4-14', 'ISBN-123'),
(2, 1002, 'Book2', '2020-4-15', 'ISBN-456'),
(3, 1003, 'Book3', '2020-4-17', 'ISBN-789'),
(4, 1004, 'Book4', '2020-6-13', 'ISBN-753'),
(5, 1005, 'Book5', '2020-7-25', 'ISBN-852');
CREATE TABLE ReturnStatus (
  Return_Id INT PRIMARY KEY,
  Return_cust INT,
  Return_book_name VARCHAR(20),
  Return_date DATE,
  Isbn_book2 VARCHAR(20),
  FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
  FOREIGN KEY (Isbn_book2) REFERENCES Book(ISBN)
);
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
(1, 1001, 'Book 1', '2021-04-10', 'ISBN-123'),
(2, 1002, 'Book 2', '2022-04-12', 'ISBN-456'),
(3, 1003, 'Book 3', '2023-04-15', 'ISBN-789'),
(4, 1004, 'Book 4', '2023-06-20', 'ISBN-753'),
(5, 1005, 'Book 5', '2023-07-25', 'ISBN-852');

SELECT Book_title, Category, Rental_Price
FROM book
WHERE Status = 'Yes';
select Salary,Emp_name from Employee order by salary desc;
select Issuestatus.Issued_book_name,Customer.Customer_name from Issuestatus inner join Customer on  Issuestatus.Issued_cust=Customer.Customer_id;
select Category ,count(Book_title) from book group by Category;
select Emp_name from Employee where Salary>50000;
select customer_name from Customer where reg_date<'2022-01-01' and customer_id not in (select Issued_cust from issuestatus) ;
select * from employee;
select branch_no ,count(Emp_id) from employee group by branch_no;
select Customer.Customer_name from Customer  join issuestatus on Customer.Customer_Id = issuestatus.issued_cust 
where issuestatus.Issue_date > '2023-6-01' and issuestatus.Issue_date <= '2023-6-30';
select book_title from book where category = 'history'



