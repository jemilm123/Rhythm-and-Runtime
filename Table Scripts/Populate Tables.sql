--ADDRESS_INFO
INSERT INTO address_info VALUES ('A1B2C3', 'Bussin Ave.', 'Toronto', 'ON');
INSERT INTO address_info VALUES ('M5B2K3', 'Victoria St.', 'Toronto', 'ON');
INSERT INTO address_info VALUES ('K1R7R5', 'Champagne Ave.', 'Ottawa', 'ON');
INSERT INTO address_info VALUES ('L6R2K7', 'Hell St.', 'Brampton', 'ON');

--USERS
INSERT INTO users VALUES ('1', 'jon@gmail.com', 'a8fff97227ad6901bd730702d993dd9e8aa7016c3e0724d36e6058a2208ba295', 'Jon', ' ', 'Smith', TO_DATE('1997-03-14', 'YYYY-MM-DD'), '', '24', 'A1B2C3');
INSERT INTO users VALUES ('2', 'michal22@gmail.com', '4005162cad7bc31c18cae2e42298941dfd4fa77161db1685edd95bce58766f67', 'Michal', 'Edward', 'Jones', TO_DATE('2000-01-22', 'YYYY-MM-DD'), '', '350', 'M5B2K3');
INSERT INTO users VALUES ('3', 'clarejs@gmail.com', '24f63fa670ef4442328948bae72f67ec7abdd6a12e94cae1d014e54e3defdbce', 'Clare', 'Julie', 'Jackson',TO_DATE('2000-09-13', 'YYYY-MM-DD'), '17', '125', 'K1R7R5');
INSERT INTO users VALUES ('4', 'lucy.l.33@gmail.com', 'db0a7e65bea9d87b7952234c674773324fe2ba31753426541d2c71b7f51e4f9b', 'Lucy', ' ', 'Brown', TO_DATE('2006-06-06', 'YYYY-MM-DD'), '', '333', 'L6R2K7');

--TYPES
INSERT INTO types VALUES('1', 'DVD');
INSERT INTO types VALUES('2', 'CD');
INSERT INTO types VALUES('3', 'MP3');
INSERT INTO types VALUES('4', 'BLU-RAY');
INSERT INTO types VALUES('5', 'MP4');
INSERT INTO types VALUES('6', 'FLAC');
INSERT INTO types VALUES('7', 'Vinyl');

--PRODUCTS
INSERT INTO products VALUES (1, 2, 'Look at the Sky', 2021, 'Electronic');
INSERT INTO products VALUES (2, 2, 'Get Your Wish', 2021, 'Electronic');
INSERT INTO products VALUES (3, 2, 'Something Comforting', 2021, 'Electronic');
INSERT INTO products VALUES (4, 2, 'Mirror', 2021, 'Electronic');
INSERT INTO products VALUES (5, 2, 'Dream Dream Dream', 2019, 'Electronic');
INSERT INTO products VALUES (6, 2, 'Mania', 2019, 'Electronic');
INSERT INTO products VALUES (7, 2, 'Lights Out', 2016, 'Electronic');
INSERT INTO products VALUES (8, 2, '34+35', 2020, 'Pop');
INSERT INTO products VALUES (9, 2, 'Mikasa', 2015, 'Metal');
INSERT INTO products VALUES (10, 2, 'The Worst', 2017, 'Alternative');

INSERT INTO products VALUES (11, 1, 'Scream', 1996, 'Horror');
INSERT INTO products VALUES (12, 1, 'Ready Player 1', 2018, 'Sci-Fi');
INSERT INTO products VALUES (13, 1, 'The Collector', 2009, 'Horror');
INSERT INTO products VALUES (14, 1, 'Hush', 2016, 'Thriller');
INSERT INTO products VALUES (15, 1, 'The Purge', 2013, 'Horror');
INSERT INTO products VALUES (16, 1, 'Step Up', 2009, 'Drama');
INSERT INTO products VALUES (17, 1, 'Coraline', 2009, 'Animation');
INSERT INTO products VALUES (18, 1, 'Midsommar', 2019, 'Horror');
INSERT INTO products VALUES (19, 1, 'Spiral', 2021, 'Crime');
INSERT INTO products VALUES (20, 1, 'Zodiac', 2007, 'Crime');

--MUSIC
INSERT INTO music (product_id, artist, album, explicit) VALUES (1, 'Porter Robinson', 'Nurture', 0);
INSERT INTO music (product_id, artist, album, explicit) VALUES (2, 'Porter Robinson', 'Nurture', 0);
INSERT INTO music (product_id, artist, album, explicit) VALUES (3, 'Porter Robinson', 'Nurture', 0);
INSERT INTO music (product_id, artist, album, explicit) VALUES (4, 'Porter Robinson', 'Nurture', 0);
INSERT INTO music (product_id, artist, album, explicit) VALUES (5, 'Madeon', 'Good Faith', 0);
INSERT INTO music (product_id, artist, album, explicit) VALUES (6, 'Madeon', 'Good Faith', 0);
INSERT INTO music (product_id, artist, album, explicit) VALUES (7, 'Zomboy', 'Neon Grave', 1);
INSERT INTO music (product_id, artist, album, explicit) VALUES (8, 'Ariana Grande', 'Positions', 1);
INSERT INTO music (product_id, artist, album, explicit) VALUES (9, 'Veil of Maya', 'Matriarch', 0);
INSERT INTO music (product_id, artist, album, explicit) VALUES (10, 'Polyphia', 'The Most Hated', 0);

--MOVIES
INSERT INTO movies (product_id, imdb_id, age_rating) VALUES (11, 'tt0117571', 'R');
INSERT INTO movies (product_id, imdb_id, age_rating) VALUES (12, 'tt1677720', 'PG-13');
INSERT INTO movies (product_id, imdb_id, age_rating) VALUES (13, 'tt0844479', 'R');
INSERT INTO movies (product_id, imdb_id, age_rating) VALUES (14, 'tt5022702', 'R');
INSERT INTO movies (product_id, imdb_id, age_rating) VALUES (15, 'tt2184339', 'R');
INSERT INTO movies (product_id, imdb_id, age_rating) VALUES (16, 'tt0462590', 'PG-13');
INSERT INTO movies (product_id, imdb_id, age_rating) VALUES (17, 'tt0327597', 'PG');
INSERT INTO movies (product_id, imdb_id, age_rating) VALUES (18, 'tt8772262', 'R');
INSERT INTO movies (product_id, imdb_id, age_rating) VALUES (19, 'tt1034273', 'R');
INSERT INTO movies (product_id, imdb_id, age_rating) VALUES (20, 'tt0443706', 'R');

--PRICES
INSERT INTO prices VALUES (1, 7, 0, 11.99);
INSERT INTO prices VALUES (2, 7, 0, 11.99);
INSERT INTO prices VALUES (3, 7, 0, 11.99);
INSERT INTO prices VALUES (4, 7, 0, 11.99);
INSERT INTO prices VALUES (5, 7, 0, 15.00 );
INSERT INTO prices VALUES (6, 3, 0, 2.99);
INSERT INTO prices VALUES (7, 6, 0, 3.99);
INSERT INTO prices VALUES (8, 2, 25, 6.99);
INSERT INTO prices VALUES (9, 3, 0, 2.99);
INSERT INTO prices VALUES (10, 3, 0, 2.99);
INSERT INTO prices VALUES (11, 1, 0, 4.99);
INSERT INTO prices VALUES (12, 5, 0, 6.99);
INSERT INTO prices VALUES (13, 1, 0, 4.99);
INSERT INTO prices VALUES (14, 5, 0, 6.99);
INSERT INTO prices VALUES (15, 1, 30, 9.99);
INSERT INTO prices VALUES (16, 4, 0, 10.99);
INSERT INTO prices VALUES (17, 4, 0, 11.99);
INSERT INTO prices VALUES (18, 5, 15, 6.99);
INSERT INTO prices VALUES (19, 5, 5, 5.99);
INSERT INTO prices VALUES (20, 1, 10, 7.99);

--INVENTORY
INSERT INTO inventory VALUES (1, 7, 150);
INSERT INTO inventory VALUES (2, 7, 125);
INSERT INTO inventory VALUES (3, 7, 120);
INSERT INTO inventory VALUES (4, 7, 150);
INSERT INTO inventory VALUES (5, 7, 200);
INSERT INTO inventory VALUES (6, 3, 999);
INSERT INTO inventory VALUES (7, 6, 999);
INSERT INTO inventory VALUES (8, 2, 75);
INSERT INTO inventory VALUES (9, 3, 999);
INSERT INTO inventory VALUES (10, 3, 999);
INSERT INTO inventory VALUES (11, 1, 68);
INSERT INTO inventory VALUES (12, 5, 999);
INSERT INTO inventory VALUES (13, 1, 103);
INSERT INTO inventory VALUES (14, 5, 999);
INSERT INTO inventory VALUES (15, 1, 77);
INSERT INTO inventory VALUES (16, 4, 100);
INSERT INTO inventory VALUES (17, 4, 80);
INSERT INTO inventory VALUES (18, 5, 999);
INSERT INTO inventory VALUES (19, 5, 999);
INSERT INTO inventory VALUES (20, 1, 215);

--ORDERS
INSERT INTO orders VALUES (1, 1, TO_DATE('28-Sep-21 14:10:10', 'YYYY-MM-DD HH24:MI:SS'), '', '24', 'A1B2C3', 0);
INSERT INTO orders VALUES (2, 2, TO_DATE('1-Oct-21 17:49:52', 'YYYY-MM-DD HH24:MI:SS'), '', '350', 'M5B2K3', 0);
INSERT INTO orders VALUES (3, 3, TO_DATE('7-Oct-21 10:11:22', 'YYYY-MM-DD HH24:MI:SS'), '17', '125', 'K1R7R5', 0);
INSERT INTO orders VALUES (4, 4, TO_DATE('18-Oct-21 16:16:10', 'YYYY-MM-DD HH24:MI:SS'), '', '333', 'L6R2K7', 0);
INSERT INTO orders VALUES (5, 1, CURRENT_TIMESTAMP, '', '24', 'A1B2C3', 0);

--ORDERS_ITEMS
INSERT INTO orders_items VALUES (1, 1, 7, 0, 11.99, 2, 23.98, 3.12, 27.10);
INSERT INTO orders_items VALUES (1, 3, 7, 0, 11.99, 1, 11.99, 1.56, 13.55);
INSERT INTO orders_items VALUES (2, 20, 1, 10, 7.99, 1, 7.99, 1.04, 9.03);
INSERT INTO orders_items VALUES (3, 17, 4, 0, 11.99, 1, 11.99, 1.56, 13.55);
INSERT INTO orders_items VALUES (3, 18, 5, 15, 6.99, 1, 6.99, 0.91, 7.9);
INSERT INTO orders_items VALUES (4, 8, 2, 25, 6.99, 2, 13.98, 1.82, 15.80);
INSERT INTO orders_items VALUES (5, 11, 1,0, 4.99, 1, 4.99, 0.65, 5.64);
