create database blinkit_db
use blinkit_db




CREATE TABLE blinkit_sales (
    Item_Fat_Content VARCHAR(50),
    Item_Identifier VARCHAR(20),
    Item_Type VARCHAR(50),
    Outlet_Establishment_Year INT,
    Outlet_Identifier VARCHAR(20),
    Outlet_Location_Type VARCHAR(20),
    Outlet_Size VARCHAR(20),
    Outlet_Type VARCHAR(50),
    Item_Visibility FLOAT,
    Item_Weight VARCHAR(40),
    Sales FLOAT,
    Rating INT
);


LOAD DATA INFILE 'you_file_path'
INTO TABLE blinkit_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- see the data 
select * from blinkit_sales

-- modity column Item_fat_contain
-- update the data -> 
update blinkit_sales 
set Item_Fat_Content = 
case 
when Item_Fat_Content IN ('LF' ,'low fat')
then 'Low Fat'

when Item_Fat_Content = 'reg' then 'Regular'

else Item_Fat_Content
end


-- total sales ( total revenue generated ) 
select sum(Sales) as Total_Sales
from blinkit_sales
-- to show this sales in million upto 2 decimal 
select cast(sum(Sales)/1000000 as decimal(10,2)) as Total_sales
from blinkit_sales 


