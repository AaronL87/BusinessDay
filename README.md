# BusinessDay
In SQL Server, this query generates a table with consecutive dates and their corresponding business day from the start of each month

To use this query, 
1.  Replace the starting date variable @startDay with your desired starting date
2.  Replace the end date variable @endDay with **one day after** your desired end date
3.  Replace the @holidays table's date values with the weekday holidays between your start and end date
    1. These will not count as business days
    2. Weekend holidays do not need to be added because weekends are already excluded
    
- You may need to change the table prefix name and the table existence conditions depending on how many times you need to run the query
- I created the existence conditions to ensure that existing SQL objects were not unwantingly modified
