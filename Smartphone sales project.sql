-- select database
use salesdatabase;

-- descibe the dataset
describe datasales;

-- describe the column names
 show columns from datasales;

-- check number of rows in dataset
select count(*) as total_rows from datasales;

-- check date ranges of data collected
select min(Date) as 'Start', max(Date) as 'End' from datasales;

-- check payment methods availabe 
select distinct(Payment_type) from datasales;

-- Total Unique payments avaialable
select 	count(distinct Payment_type)from datasales;

-- most used payment type
select Payment_type, count(Payment_type) as most_used from datasales
group by Payment_type
order by most_used desc
limit 1;

-- total revenue for each year
select Financial_year, sum(amount) as total_revenue from datasales
group by Financial_year;

-- the products sold
select distinct Type_of_product from datasales;

-- top selling product type
select Type_of_product, sum(Quantity) as total_quantity_sold from datasales
group by Type_of_product
order by total_quantity_sold desc
limit 1 ;

-- average price per quarter
select Quarter, avg(Price) from datasales
group by Quarter;


-- months with highest and lowest sales
select month(Date) as 'month', sum(Amount) as total_sales from datasales
group by month
order by total_sales desc
limit 1; 

select month(Date) as 'month', sum(Amount) as total_sales from datasales
group by month
order by total_sales asc
limit 1;

-- total revenue for each type of accessory
select 'Type_of_accessory/phone', sum(Amount) as total_revenue from datasales
group by 'Type_of_accessory/phone';

-- the number of sales transactions per quarter
select Quarter, count(*) as transaction_count from datasales
group by Quarter;

-- most profitable quarter
select Quarter, sum(Amount) as profit from datasales
group by Quarter
order by profit desc
limit 1; 

-- total quantity sold per year
select Financial_year, sum(Quantity) from datasales
group by Financial_year; 


-- average quantity sold per transaction
select avg(Quantity) from datasales;

-- top pyament method for each year
-- select financial_year, min(distinct Payment_type) from datasales
-- group by financial_year;

select financial_year, payment_type, sum(amount) as total_sales from datasales
group by financial_year, payment_type
order by financial_year, total_sales
desc;

-- prodcuts with prices higher than average
select Type_of_product,  Price from datasales
where price > (select avg(Price) from datasales);

-- financial year with the highest sales
select financial_year, sum(Amount) as Total_sales from datasales
group by financial_year
order by Total_sales
limit 1;
