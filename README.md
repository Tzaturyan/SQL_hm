# SQL_hm
# Database management
Install the MySQL DBMS. Create a .my.cnf file in your home directory, specifying in it the username and password that was specified during installation.
Create an example database, place a users table in it, consisting of two columns, a numeric id and a string name.
Create an example database dump from the previous job, expand the contents of the dump into a new sample database.
(optional) Read the mysqldump utility documentation in more detail. Create a dump of the single help_keyword table of the mysql database. Moreover, make sure that the dump contains only the first 100 rows of the table.
# Introduction to Database Design
Write a crypt that adds 3 new tables to the vk database that was created during the lesson (with a list of fields, indexes and foreign keys)
# CRUD operations
i. Fill all tables of the vk database with data (10-20 records in each table)
ii. Write a script that returns a list of names (firstname only) of users without repetitions in alphabetical order
iii. Write a script marking underage users as inactive (field is_active = false). Pre-add such a field to the profiles table with the default value = true (or 1)
iv. Write a script that deletes messages "from the future" (the date is longer than today)
v. Write the name of the topic of the course project (in the comments)
# Operators, filtering, sorting and restriction. Data aggregation
Suppose the created_at and updated_at fields in the users table were left blank. Fill them with the current date and time.
The users table was poorly designed. The created_at and updated_at records were set by the VARCHAR type and values in the format "10/20/2017 8:10" were placed in them for a long time. It is necessary to convert the fields to the DATETIME type, saving the values entered earlier.
In the storehouses_products inventory table, a variety of numbers can occur in the value field: 0 if the product has run out and above zero if there are stocks in the warehouse. It is necessary to sort the records in such a way that they are displayed in order of increasing value. However, zero stocks should be displayed at the end, after all entries.
optional) From the users table, it is necessary to extract users born in August and May. Months are set as a list of English names ('may', 'august')
(optional) Records are extracted from the catalogs table using a query. SELECT * FROM catalogs WHERE id IN (5, 1, 2); Sort the entries in the order specified in the IN list.
# Data aggregation
Calculate the average age of users in the users table
Count the number of birthdays that fall on each of the days of the week. It should be noted that the days of the week of the current year are needed, not the year of birth.
(optional) Calculate the product of the numbers in the table column
# Operators, filtering, sorting and restriction. Data aggregation
Practical assignment on the topic “Operators, filtering, sorting and restriction. Data aggregation". We work with the vk database and the data that you generated earlier:
Let some user be specified. Of all the users of the social network, find the person who communicated with the selected user the most (wrote him messages).
Calculate the total number of likes that users under the age of 10 have received..
Determine who has more likes (total): men or women.
Please send the solutions of practical tasks in this course in the form of text files attached to the portal with scripts (executed commands). For such scripts, as a rule, the file extension "*.sql" is used (for example, "homework_1.sql")
# Complex queries
Make a list of users who have made at least one orders order in the online store.
Output a list of products and catalogs sections that corresponds to the product.
(optional) Let there be a table of flights flights (id, from, to) and a table of cities cities (label, name). The from, to and label fields contain English names of cities, the name field is Russian. Display a list of flights with Russian city names.
# Complex queries
We work with the teachers.db database of teachers. For each task, you need to submit only the code that is executed to get the result in a text file. As a report, a screenshot should be attached to the fourth task.
Find the total number of students for each course. In the report, output the name of the course and the number of students in all streams of the course. Solve the task using window functions.
Find the average grade across all streams for all teachers. In the report, output the ID, last name and first name of the teacher, the average grade for all conducted streams. Teachers who did not have streams should also be included in the sample. Solve the task using window functions.
What indexes should be created for the fastest execution of the submitted query?
# Transactions, variables, views. Administration. Stored procedures and functions, triggers
The shop and sample databases contain the same tables, the training database. Move the entry id = 1 from the shop table.users to the sample table.users. Use transactions.
Create a view that outputs the name of the item name from the products table and the corresponding name of the catalog name from the catalogs table.
optional) Let there be a table with a calendar field created_at. It contains sparse calendar entries for August 2018 '2018-08-01', '2016-08-04', '2018-08-16' and 2018-08-17. Make a query that outputs a complete list of dates for August, setting the value in the adjacent field to 1 if the date is present in the original table and 0 if it is absent.
(optional) Let there be any table with a calendar field created_at. Create a query that removes outdated records from the table, leaving only the 5 most recent records.
# MySQL Administration
Create two users who have access to the shop database. The first shop_read user should only be able to read data requests, the second shop user should be able to perform any operations within the shop database.
(optional) Let there be an accounts table containing three columns id, name, password containing the primary key, the user name and his password. Create a username view of the accounts table that provides access to the id and name columns. Create a user_read user who would not have access to the accounts table, but could retrieve records from the username view.
# Stored procedures and functions, triggers
Create a stored hello() function that will return a greeting, depending on the current time of day. From 6:00 to 12:00, the function should return the phrase "Good morning", from 12:00 to 18:00, the function should return the phrase "Good afternoon", from 18:00 to 00:00 — "Good evening", from 00:00 to 6:00 — "Good night"
There are two text fields in the products table: name with the product name and description with its description. The presence of both fields or one of them is acceptable. A situation where both fields take an undefined NULL value is unacceptable. Using triggers, ensure that one or both of these fields are filled in. If you try to assign a NULL value to the fields, you must cancel the operation.
(optional) Write a stored function to calculate an arbitrary Fibonacci number. Fibonacci numbers are a sequence in which the number is equal to the sum of the two previous numbers. Calling the FIBONACCI(10) function should return the number 55.
# Transactions, variables, views. Administration. Stored procedures and functions, triggers
Send a preliminary version of the course project:
DDL commands;
Database dump (filling tables with data), no more than 10 rows in each table (you can use data generators).
# Query optimization. NoSQL
Create a logs table of the Archive type. Let's assume that each time a record is created in the users, catalogs, and products tables, the time and date of the record creation, the table name, the primary key identifier, and the contents of the name field are placed in the logs table.
(optional) Create an SQL query that puts a million records in the users table.
# NoSQL
In the Redis database, select a collection for counting visits from certain IP addresses.
Using the Redis database, solve the problem of searching for the user's name by email address and vice versa, searching for the user's email address by his name.
Organize the storage of categories and product items of the shop training database in the MongoDB DBMS.
# Requirements for the course project
Create a general text description of the database and the tasks it solves;
the minimum number of tables is 10;
scripts for creating a database structure (with primary keys, indexes, foreign keys);
create an ERDiagram for a database;
scripts for filling the database with data;
scripts of characteristic samples (including groupings, joins, nested tables);
views (minimum 2);
stored procedures /triggers.
