CREATE TABLE [Restaurant_DB].[dbo].[geographic] (
    city VARCHAR(100) PRIMARY KEY,
    county VARCHAR(100),
    region VARCHAR(100)
);
GO

INSERT INTO [Restaurant_DB].[dbo].[geographic] (city, county, region) VALUES 
    ('alameda', 'bangalore', 'bay area'),
    ('alamo contra', 'bangalore', 'bay area'),
    ('albany', 'bangalore', 'bay area'),
    ('alviso', 'bangalore', 'bay area'),
    ('american', 'bangalore', 'bay area'),
    ('angwin', 'bangalore', 'napa valley'),
    ('antioch', 'bangalore', 'bay area'),
    ('aptos', 'bangalore', 'bay area'),
    ('aromas', 'bangalore', 'unknown'),
    ('atherton', 'bangalore', 'bay area');
GO

SELECT * FROM [Restaurant_DB].[dbo].[geographic]

BEGIN TRANSACTION
    INSERT INTO [Restaurant_DB].[dbo].[geographic] VALUES ('roha', 'maximoff county', 'sing valley');
    
    SAVE TRANSACTION T1;

    SELECT * FROM [Restaurant_DB].[dbo].[geographic]
    UPDATE [Restaurant_DB].[dbo].[geographic] SET county = 'contra costa county' WHERE city = 'roha';

    ROLLBACK TRANSACTION T1

    SELECT * FROM [Restaurant_DB].[dbo].[geographic]

COMMIT
