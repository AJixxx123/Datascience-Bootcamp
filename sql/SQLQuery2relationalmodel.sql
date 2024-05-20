create database Relationalmodel
use relationalmodel

--1) Convert the given the given edr into a relational model
--2)the relational model are table 1: wine(wine_id,Numw,category,quantity,year,degree)
--3)inserting data into the database.first create he tables.

Create Table wine(
                wine_id INT primary key NOT NULL,
				numw INT NOT NULL,
				category VARCHAR (30) NOT NULL,
				Quantity DECIMAL (10,2) CHECK (quantity>0)NOT NULL,
				WINE_year DATE not null,
				Degree DECIMAL(20,2)NOT NULL,
);

select * from wine

CREATE TABLE Producer(
				     Producer_id INT PRIMARY KEY NOT NULL,
					 NUMP INT NOT NULL,
					 firstname VARCHAR (30) not null,
					 lastname VARCHAR (30) not null,
					 region VARCHAR (30) not null,
);

select * from producer

CREATE TABLE Harvest(
				    Harvest_id INT Primary key not null,
					wine_id int not null,
					producer_id int not null,
					quantity DECIMAL (10,2) CHECK(QUANTITY>0) not null,
					FOREIGN KEY (WINE_ID)REFERENCES wine(wine_id),
					FOREIGN KEY (PRODUCER_ID) References Producer(producer_id),



);
select * from harvest

insert into wine(wine_id,numw,category,Quantity,WINE_year,Degree)
values(1,1,'Red Wine',203,'1430',9),
       (2,2,'Rose',100,'1998',8),
	   (3,3,'pinot noir',101,'1992',12),
	   (4,4,'chardonnay',201,'1802',27),
	   (5,5,'white wine',290,'2010',10),
	   (6,6,'sparkling wine',7,'2024',29),
	   (7,7,'dessert wine',2,'2020',10),
	   (8,8,'grape wine',50,'2024',40),
	   (9,9,'fruit wine',14,'2012',50),
	   (10,10,'rose',40,'2000',30),
	   (11,11,'cava',38,'2000',11),
	   (12,12,'ogogoro',30,'2020',12.3),
	   (13,13,'brandy',10,'2005',39.3),
	   (14,14,'red wine',87,'2021',10.4),
	   (15,15,'ogogoro',10,'2024',49.5),
	   (16,16,'cava',11,'2008',30.7),
	   (17,17,'spanish wine',300,'2001',16),
	   (18,18,'american wine',8,'2000',8),
	   (19,19,'naija wine',500,'1997',36.2),
	   (20,20,'chardonney',20,'2010',20),
	   (21,21,'naija wine',200,'1998',32.7),
	   (22,22,'pinot noir',10,'2000',10),
	   (23,23,'grape wine',400,'2023',7),
	   (24,24,'rose',20,'2021',13),
	   (25,25,'ogogoro',80,'2000',34),
	   (26,26,'red wine',12,'2000',28),
	   (27,27,'fruit wine',200,'2016',3.67),
	   (28,28,'spanish tears',101,'2017',29),
	   (29,29,'cava',48,'2022',32),
	   (30,30,'grape wine',67,'2020',10);

	   



insert into Producer(Producer_id,NUMP,firstname,lastname,region)
values(1,1,'Esther','Faith','chevron'),
	   (2,2,'ibrahim','kareem','Atlanta'),
	   (3,3,'Simi','Ajix','sousse'),
	   (4,4,'gbemiga','bayo','chicago'),
	   (5,5,'hakeem','raul','togo'),
	   (6,6,'yetunde','abayomi','senegal'),
	   (7,7,'sodiq','bosun','paris'),
	   (8,8,'barry','sum','chicago'),
	   (9,9,'drake','mabed','mexico'),
	   (10,10,'dayo','wizzy','surulere'),
	   (11,11,'bunmi','ayo','germany'),
	   (12,12,'jane','dean','zimbzbwe'),
	   (13,13,'tife','dex','ghana'),
	   (14,14,'Brown','seth','lagos'),
	   (15,15,'moses','Ade','Abeokuta'),
	   (16,16,'Adebodun','kareem','south africa'),
	   (17,17,'riley','brooke','maryland'),
	   (18,18,'dan','john','santafe'),
	   (19,19,'seun','duke','new jersey'),
	   (20,20,'dotun','ire','jamaica'),
	   (21,21,'Bayo','Ajisafe','ogun'),
	   (22,22,'dide','joko','canada'),
	   (23,23,'chris','antwon','canada'),
	   (24,24,'dotun','fayose','brazil'),
	   (25,25,'jennifer','obi','yaba'),
	   (26,26,'gentry','bisola','sabo'),
	   (27,27,'nnena','grace','ketu'),
	   (28,28,'nonso','evans','italy'),
	   (29,29,'hillary','clinton','maimi'),
	   (30,30,'astro','juwan','ketu');


--list of producer, list of producer by name
select * from Producer

--list of producer by name
select   producer.firstname,Producer.lastname 
from Producer

order by  (firstname)asc

--give the list done by sousse

select * from Producer
where region = 'sousse'
 
 -- total quantity of wine done by wine id 12
 select
 sum(wine.quantity) as total_quantity
 from wine 
 where wine_id =12
 group by wine_id

 insert into Harvest(harvest_id,wine_id,producer_id,quantity)
 values(1,1,1,203),
	    (2,2,2,100),
		(3,3,3,101),
		(4,4,4,201),
		(5,5,5,290),
		(6,6,6,7),
		(7,7,7,2),
		(8,8,8,50),
		(9,9,9,14),
		(10,10,10,40),
		(11,11,11,38),
		(12,12,12,30),
		(13,13,13,10),
		(14,14,14,87),
		(15,15,15,10),
		(16,16,16,11),
		(17,17,17,300),
		(18,18,18,8),
		(19,19,19,500),
		(20,20,20,20),
		(21,21,21,200),
		(22,22,22,10),
		(23,23,23,400),
		(24,24,24,20),
		(25,25,25,80),
		(26,26,26,12),
		(27,27,27,200),
		(28,28,28,101),
		(29,29,29,48),
		(30,30,30,67);

		-- number of wine by category
select category,
sum(wine.quantity) as total_quantity_produced
from wine
group by wine.category

--producer in sousse region that have harvested atleast 1 wine
select firstname,lastname from producer
inner join harvest
on producer.producer_id = harvest.producer_id
where producer.region = 'sousse'and harvest.quantity >=300
order by firstname,lastname desc

--the wine numbers with degree greater than 12 and produced by produce 24
select h.Harvest_id,wine.numw,wine.Degree,Producer.Producer_id,Producer.firstname,Producer.lastname,h.quantity
from Harvest as h
inner join wine on
h.wine_id = wine.wine_id
inner join producer on 
h.producer_id = Producer.Producer_id
--after joinin the tables i will use the result to get wine degree higher than 12
select h.Harvest_id,wine.numw,wine.Degree,Producer.Producer_id,Producer.firstname,Producer.lastname,h.quantity
from Harvest as h
inner join wine on
h.wine_id = wine.wine_id
inner join producer on 
h.producer_id = Producer.Producer_id
where wine.Degree >12 and producer.Producer_id = 24