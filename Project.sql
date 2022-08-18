Create database project;
use project;

drop table customer;
drop table receiver;
drop table package;
drop table tracking;
drop table billing;

create table customer (CID integer primary key, C_Name varchar(20), C_Mobile varchar(10), C_Address varchar(50), C_Pincode integer, O_Date date);
Create table Receiver (CID integer ,foreign key (CID) references customer (CID),D_Name varchar(20), D_Mobile varchar(10), D_Address varchar(50), D_Pincode integer, Due_Date date);
Create table Package (Package_id varchar(5) primary key, CID integer,foreign key (CID) references customer (CID), Weight_Class varchar(50), Product_Type varchar(20));
Create table Tracking (Package_id varchar(5),foreign key (Package_id) references package (Package_id), CID integer,foreign key (CID) references customer (CID), Order_Picked timestamp, On_Way timestamp, Order_Delivered timestamp default null);
Create table Billing (Bill_no varchar(6), Package_id varchar(5),foreign key (Package_id) references package (Package_id), CID integer,foreign key (CID) references customer (CID), Weight_charge integer, Type_charge integer, Distance_charge integer, Total integer);

Insert into customer values (1101, "Charlie", "9012341234", "Lajpat Nagar,Jaipur", 302001, "2021-03-02");
Insert into customer values (1201, "Fitz", "9012341212", "STPS Colony, Raipur", 490042, "2021-02-21");
Insert into customer values (2205, "Ainsley", "9012341263", "Angel Apartment,Mumbai", 400001, "2021-03-23");

Insert into Receiver values (1101, "David", "9012344321", "Thermal Colony, Kota", 324005, "2021-03-09");
Insert into Receiver values (1201, "John", "9012314214", "Sindhi Colony, Mumbai", 400003, "2021-02-28");
Insert into Receiver values (2205, "Rahul", "9012325232", "Link Road, Pune", 410038, "2021-03-28");

Insert into Package values ("A1101", 1101, "Below 200gm", "Document");
Insert into Package values ("A1201", 1201, "2-5 kg", "Hadle with care");
Insert into Package values ("A2205", 2205, "500 - 1000gm", "Others");

Insert into Tracking values ("A1101", 1101, "2021-03-03 11:23:23", "2021-03-05 16:32:23", "2021-03-07 12:12:06");
Insert into Tracking values ("A1201", 1201, "2021-02-22 10:36:23", "2021-02-24 19:06:23", "2021-02-27 14:56:06");
Insert into Tracking values ("A2205", 2205, "2021-03-24 15:53:53", "2021-03-25 19:21:23",null);

Insert into Billing values ("AA1101", "A1101", 1101, 100, 50, 100, 250);
Insert into Billing values ("AA1201", "A1201", 1201, 2000, 1000, 500, 3500);
Insert into Billing values ("BA2205", "A2205", 2205, 800, 200, 300, 1300);

