# BusinessDay
In SQL Server, this query generates a table with consecutive dates and their corresponding business day from the start of each month

To use this query, 
1.  Replace the starting date variable @startDay with your desired starting date
2.  Replace the end date variable @endDay with **one day after** your desired end date
3.  Replace the @holidays table's date values with the weekday holidays between your start and end date
    1. These will not count as business days
    2. Weekend holidays do not need to be added because weekends are already excluded
