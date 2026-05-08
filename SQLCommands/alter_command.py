CREATE TABLE geographic (
    city VARCHAR(100) PRIMARY KEY,
    county VARCHAR(100),
    region VARCHAR(100),
    country VARCHAR(100)
);
GO

CREATE TABLE generalinfo (
    id_restaurant INT PRIMARY KEY,
    label VARCHAR(255),
    food_type VARCHAR(100),
    city VARCHAR(100),
    review DECIMAL(3,1)
);
GO

INSERT INTO generalinfo (id_restaurant, label, food_type, city, review) VALUES
    (1, 'sparkys diner', '24 hour diner', 'alameda', 2.3),
    (2, 'kabul afghan cuisine', 'afghani', 'alamo contra', 3.8),
    (3, 'helmand restaurant', 'afghani', 'albany', 4.0),
    (4, 'afghani house', 'afghani', 'alviso', 3.6),
    (5, 'kabul afghan cuisine', 'afghani', 'american canyon', 3.7),
    (6, 'bamyan afghan restaurant', 'afghani', 'angwin', 2.8),
    (7, 'kabul palace', 'afghani', 'antioch', 2.8),
    (8, 'kandahar', 'afghani', 'aptos', 3.5),
    (9, 'kabobs house', 'afghani', 'aromas', 2.7),
    (10, 'massawa restaurant', 'african', 'atherton', 3.4);
GO

SELECT * FROM generalinfo;

ALTER TABLE generalinfo ADD chef varchar(40);

ALTER TABLE generalinfo ALTER COLUMN food_type varchar(50);

UPDATE geographic
SET county = 'contra costa county';
GO
