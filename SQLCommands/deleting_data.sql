CREATE TABLE geographic (
    city VARCHAR(100) PRIMARY KEY,
    region VARCHAR(100),
    country VARCHAR(100)
);
GO

CREATE TABLE location (
    id_restaurant INT PRIMARY KEY,
    street_num INT,
    street_name VARCHAR(255),
    city VARCHAR(100)
);
GO

INSERT INTO location (id_restaurant, street_num, street_name, city) VALUES
    (1, 242, 'church st', 'alameda'),
    (2, 135, 'el camino real', 'alamo contra'),
    (3, 430, 'broadway', 'albany'),
    (4, 1103, 'e. el camino real', 'alviso'),
    (5, 833, 'w. el camino real', 'american canyon'),
    (6, NULL, NULL, 'angwin'),
    (7, 155, 'san fernando', 'antioch'),
    (8, 2118, 'mt diablo', 'aptos'),
    (9, 3005, 'alamo drive (corner nut tree)', 'aromas'),
    (10, 907, 'irving', 'atherton');
GO

SELECT * FROM geographic;

DELETE FROM geographic WHERE city = 'albany';

SELECT * FROM location;

TRUNCATE TABLE location;

DROP TABLE location;
GO
