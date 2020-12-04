IF OBJECT_ID('BusinessDay') IS NULL
BEGIN
    CREATE TABLE BusinessDay (
        TodaysDate DATE NOT NULL,
        BusinessDayNum INT NULL
    );

    --TRUNCATE TABLE BusinessDay;

    DECLARE @startDay DATE = '2020-1-1'; --the starting date
    DECLARE @endDay DATE = '2021-1-1'; --the end date
    DECLARE @dayCounter INT = 1;
    DECLARE @holidays TABLE (Dates DATE);

    INSERT INTO @holidays (Dates) --holiday dates
    VALUES ('2020-1-1'),
            ('2020-5-25'),
            ('2020-7-3'),
            ('2020-9-7'),
            ('2020-11-26'),
            ('2020-12-25');

    SELECT DATEDIFF(DAY, @startDay, @endDay) [Days added to table];

    WHILE (@startDay < @endDay)
    BEGIN
        INSERT INTO BusinessDay (TodaysDate) VALUES(@startDay);

        IF (DATEPART(DW,@startDay) NOT IN (1,7)
            AND @startDay NOT IN (SELECT * FROM @holidays))
        BEGIN
            UPDATE BusinessDay
            SET BusinessDayNum = @dayCounter
            WHERE TodaysDate = @startDay;

            IF DAY(DATEADD(DAY, 1, @startDay)) != 1
            BEGIN
                SELECT @dayCounter = @dayCounter + 1;
            END
        END

        IF DAY(DATEADD(DAY, 1, @startDay)) = 1
        BEGIN
            SELECT @dayCounter = 1;
        END

        SELECT @startDay = DATEADD(DAY, 1, @startDay);
    END

SELECT * FROM BusinessDay;
END
