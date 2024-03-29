/* Catarina Monteiro, Matheus Bissacot, Lara Sousa*/

CREATE DATABASE IF NOT EXISTS guest;

USE guest;

DROP TABLE IF EXISTS OPEN, LOANS, SENT, RECEIVED, ACCOUNT, MANAGER, CLIENT;

CREATE TABLE CLIENT
(
  Client_Id         INT PRIMARY KEY,
  Job               VARCHAR(20) NOT NULL,
  Marital_Status    VARCHAR(10) NOT NULL,
  Qualifications    VARCHAR(25) NOT NULL,
  Age               INT NOT NULL,
  Country           VARCHAR(20) NOT NULL,
  Name              VARCHAR(20) NOT NULL,
  Gender            VARCHAR(15) NOT NULL
); 

CREATE TABLE MANAGER
(
  Manager_Id    INT PRIMARY KEY,
  Contact       VARCHAR(20) NOT NULL
); 

CREATE TABLE ACCOUNT    
(
  Account_Id                INT PRIMARY KEY,
  Money                     INT NOT NULL,
  DestinationAccount_Id     INT,
  Holder                    INT NOT NULL,
  Manager                   INT NOT NULL,
  FOREIGN KEY(DestinationAccount_Id) REFERENCES ACCOUNT(Account_Id),
  FOREIGN KEY(Holder) REFERENCES CLIENT(Client_Id) ON DELETE CASCADE,
  FOREIGN KEY(Manager) REFERENCES MANAGER(Manager_Id) ON DELETE CASCADE
); 

 CREATE TABLE LOANS
(
  Loan_Id VARCHAR(40) PRIMARY KEY,
  Loan_Holder INT NOT NULL, 
  Category VARCHAR(20) NOT NULL,
  FOREIGN KEY(Loan_Holder) REFERENCES CLIENT(Client_Id) ON DELETE CASCADE
);

CREATE TABLE OPEN
(
  Client INT NOT NULL,
  Account INT NOT NULL,
  Date DATE NOT NULL,
  PRIMARY KEY(Client,Account),
  FOREIGN KEY(Client) REFERENCES CLIENT(Client_Id) ON DELETE CASCADE,
  FOREIGN KEY(Account) REFERENCES ACCOUNT(Account_Id) ON DELETE CASCADE
); 

CREATE TABLE SENT
(
  Source_Account_s      INT NOT NULL,
  Destination_Account_s INT NOT NULL,
  Amount_sent           DECIMAL(8,2) NOT NULL,
  FOREIGN KEY(Source_Account_s) REFERENCES ACCOUNT(Account_Id) ON DELETE CASCADE,
  FOREIGN KEY(Destination_Account_s) REFERENCES ACCOUNT(Account_Id) ON DELETE CASCADE
); 

CREATE TABLE RECEIVED
(
  Source_Account_r      INT NOT NULL,
  Destination_Account_r INT NOT NULL,
  Amount_received       DECIMAL(8,2) NOT NULL,
  FOREIGN KEY(Source_Account_r) REFERENCES ACCOUNT(Account_Id) ON DELETE CASCADE,
  FOREIGN KEY(Destination_Account_r) REFERENCES ACCOUNT(Account_Id) ON DELETE CASCADE
); 