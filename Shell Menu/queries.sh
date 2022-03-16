#!/bin/bash
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib

# Alliyah Mohammed (500879485)
# Syed Zaidi (500986150)
# Jemil Modha (500969726)
# Section 2 - Group 82

sqlplus64 "$USER/$OR12_PASS@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl12c)))" <<EOF

-- Information summary on music products released during or after 2020
SELECT title, artist, release_year, genre, p.product_id, stock
FROM products p, music m, inventory i
WHERE release_year >= 2020 AND p.product_id = ALL (i.product_id, m.product_id)
ORDER BY title ASC;

-- Information summary on all R rated movies
SELECT title, release_year, genre, age_rating, p.product_id, stock
FROM products p, movies m, inventory i
WHERE age_rating = 'R' AND p.product_id = ALL (i.product_id, m.product_id)
ORDER BY title ASC;

--Average price based on product type
SELECT t.name AS "Product Type", AVG(pri.amount) AS "Average Price"
FROM products pro, types t, prices pri
WHERE pro.product_id = pri.product_id AND pri.type_id = t.type_id
GROUP BY name
ORDER BY name ASC;

--Low inventory items
SELECT
    product_id AS "Product ID",
    title AS "Title",
    COUNT(*) AS "Total Types",
    SUM(stock) AS "Total Stock"
FROM (
    SELECT
        product.product_id, product.title, inventory.stock
    FROM
        products product
        INNER JOIN inventory
            ON inventory.product_id = product.product_id
    WHERE
        EXISTS(
            SELECT 1
            FROM movies movie
            WHERE movie.product_id = product.product_id)
    UNION   
    SELECT
        product.product_id, product.title, inventory.stock
    FROM
        products product
        INNER JOIN inventory
            ON inventory.product_id = product.product_id
    WHERE
        EXISTS(
            SELECT 1
            FROM music
            WHERE music.product_id = product.product_id))
GROUP BY
    product_id, title
HAVING
    SUM(stock) < 250
ORDER BY "Total Stock";

--Birthdays in the next 7 days
SELECT
    user_.user_id AS "User ID",
    user_.email AS "Email",
    user_.date_of_birth AS "Date of Birth"
FROM
    users user_
WHERE
    EXISTS(
        SELECT 1
        FROM orders order_
        WHERE order_.user_id = user_.user_id)
MINUS
SELECT
    user_.user_id AS "User ID",
    user_.email AS "Email",
    user_.date_of_birth AS "Date of Birth"
FROM
    users user_
WHERE
    EXISTS(
        SELECT 1
        FROM orders order_
        WHERE order_.user_id = user_.user_id) AND
    NOT(to_char(user_.date_of_birth, 'Month') = to_char(sysdate, 'Month') AND
        ABS(to_char(user_.date_of_birth, 'DD') - to_char(sysdate, 'DD')) <= 7);

--Mailing list of users who recently purchased vinyl records
SELECT DISTINCT
    user_.user_id AS "User ID",
    user_.email AS "Email"
FROM
    orders order_
    INNER JOIN users user_
        ON user_.user_id = order_.user_id
WHERE
    EXISTS(
        SELECT 1
        FROM orders_items order_item
        WHERE
            order_item.order_id = order_.order_id AND
            order_item.type_id = 7);

--Songs by artists with at least 2 songs and whose names start with ‘P’ or ‘M’
SELECT
    music.artist AS "Artist",
    music.album AS "Album",
    product.title AS "Song Title"
FROM
    music
    INNER JOIN products product
        ON product.product_id = music.product_id
WHERE
    (music.artist LIKE 'P%' OR music.artist LIKE 'M%') AND
    EXISTS (
        SELECT NULL
        FROM music music_
        WHERE music_.artist = music.artist
        GROUP BY music_.artist
        HAVING COUNT(*) >= 2)
ORDER BY music.artist;

--All items rated 18+
SELECT
    product.title AS "Title",
    product.release_year AS "Year",
    product.genre AS "Genre"
FROM
    products product
    INNER JOIN movies movie
        ON movie.product_id = product.product_id    
WHERE
    movie.age_rating = 'R'
UNION
SELECT
    product.title AS "Title",
    product.release_year AS "Year",
    product.genre AS "Genre"
FROM
    products product
    INNER JOIN music
        ON music.product_id = product.product_id    
WHERE
    music.explicit = 1;

exit;
EOF