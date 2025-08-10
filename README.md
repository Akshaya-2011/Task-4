# Task-4

Coffee Sales Database – Step-by-Step Process
1. Checking existing tables
Verified the existing tables in the database to understand current data structure and avoid naming conflicts.

2. Creating the sales table
Designed a new table to store coffee sales details, including:

Sale date

Coffee type

Quantity

Price per cup

Total amount

This table will serve as the main transactional data source.

3. Inserting sample sales data
Added sample sales records to simulate real transactions for testing and analysis.

4. Adding a customer relationship
Introduced a customer_id column in the sales table to link each sale to a customer record.

5. Creating the customers table
Built a separate table to store customer details (name, city).
This normalization prevents duplication and improves data management.

6. Linking sales to customers
Updated the sales table so each sale references a customer via customer_id.
Some sales were intentionally left without a linked customer for join testing.

7. Performing JOIN operations
INNER JOIN → Only records with matching sales and customer entries.

LEFT JOIN → All sales, with customer details where available.

RIGHT JOIN → All customers, with sales data where available.

8. Using aggregate functions and grouping
Calculated:

Total revenue per coffee type

Average sale amount

Quantity sold per customer

9. Creating views for analysis
Saved complex queries as views for easier reuse and reporting.

10. Optimizing with indexes
Added indexes on frequently filtered columns (e.g., coffee_type, sale_date) to improve query performance.

11. Exporting data
Discussed exporting table data to CSV files using a client-side export method to avoid server permission issues.


