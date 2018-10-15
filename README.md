# Automated mySQL updater
## Requirements a.k.a. what am I trying to achieve
So my script will have to perform certain operations to update database with sql statements gathered in the folder. One file could have multiple statements and They might be multiple files to execute.

Every file begins with number for instance 045.createtable.sql or 046dosthelse.sql and once db is updated last executed file number should become db version.

We also do not want to execute files which were already executed in previous updates and once We start executing sql statements We want to do it in numerical order.
## Steps
Firstly as if the db version is up to date I do not need to execute anything I need to find db version and highest file number.

I created find newest_file_number function which will map only file numbers (first 3 characters of the file name and convert them to an integer).

I created get_db_version function to get the current db version.

Now I can be sure that with the simple if statement I can prevent script from executing already executed queries.

Next step was to find only the files which were not executed so I created find_files_to_exec method to select only files starting with the numbers higher than the current database version.

Once I found the files to execute I needed to sort them in numerical order so I created sort_files_in_numerical_order method.

At this point I have selected and sorted files so It is time to open them. I decided to put all queries due to be executed in one array so I created get_all_queries method which iterates through all the files to open and opening them with get_queries_from_file method.

Now I just needed to execute them against the database which I did with execute_queries function.

At the very end I created update_db_version function which is updating the database version once all statements are executed.

## Assumptions
I assumed that the sql statements in the files are valid so there is no validation for statements.

I assumed that all the files start with 3 digit number (I used regexp at first to get only numbers from the file name, but then realised that numbers might be common in file names)

Files are in ./sqlfiles folder, I included some simple statements in the directory.

## To be improved
I was not sure about last part of the exercise
```
Your script will be executed automatically via a program, and must satisfy these command line input parameters exactly in order to run:
  './your-script.your-lang directory-with-sql-scripts username-for-the-db db-host db-name db-password'
```
So I stored host username and password as local environmental variables and the program can be executed by just running script.rb

Solution is not fully tested as I was not sure how to automatically test interactions with mySQL database. I tested execution of statements locally on my machine and It seems to be fine but no tests are included.
