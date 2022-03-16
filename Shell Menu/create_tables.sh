#!/bin/bash
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib

# Alliyah Mohammed (500879485)
# Syed Zaidi (500986150)
# Jemil Modha (500969726)
# Section 2 - Group 82

sqlplus64 "$USER/$OR12_PASS@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl12c)))" <<EOF

CREATE TABLE address_info (
    address_postal_code  VARCHAR2(6)   PRIMARY KEY,
    address_street       VARCHAR2(50)  NOT NULL,
    address_city         VARCHAR2(50)  NOT NULL,
    address_province     VARCHAR2(25)  NOT NULL
);

CREATE TABLE users (
    user_id                INTEGER        PRIMARY KEY,
    email                  VARCHAR2(320)  UNIQUE NOT NULL,
    password               CHAR(64)       NOT NULL,
    name_first             NVARCHAR2(50)  NOT NULL,
    name_middle            NVARCHAR2(50)  NOT NULL,
    name_last              NVARCHAR2(50)  NOT NULL,
    date_of_birth          DATE           DEFAULT NULL,
    address_apt_number     VARCHAR2(10)   DEFAULT NULL,
    address_street_number  VARCHAR2(10)   DEFAULT NULL,
    address_postal_code    VARCHAR2(6)    DEFAULT NULL REFERENCES address_info(address_postal_code)
);

CREATE TABLE types (
    type_id  INTEGER       PRIMARY KEY,
    name     VARCHAR2(10)  UNIQUE NOT NULL
);

CREATE TABLE products_subclasses (
    product_subclass_id  INTEGER       PRIMARY KEY,
    name                 VARCHAR2(10)  UNIQUE NOT NULL
);

INSERT INTO products_subclasses VALUES (1, 'Movie');
INSERT INTO products_subclasses VALUES (2, 'Music');

CREATE TABLE products (
    product_id           INTEGER        PRIMARY KEY,
    product_subclass_id  INTEGER        NOT NULL REFERENCES products_subclasses(product_subclass_id),
    title                VARCHAR2(255)  NOT NULL,
    release_year         NUMBER(4)      NOT NULL,
    genre                VARCHAR2(255)  NOT NULL,
    CONSTRAINT products_alt_pk UNIQUE (product_id, product_subclass_id)
);

CREATE TABLE movies (
    product_id           INTEGER      PRIMARY KEY REFERENCES products(product_id) ON DELETE CASCADE,
    product_subclass_id  AS (1)       NOT NULL REFERENCES products_subclasses(product_subclass_id),
    imdb_id              CHAR(9)      UNIQUE NOT NULL,
    age_rating           VARCHAR2(10)  NOT NULL,
    FOREIGN KEY (product_id, product_subclass_id) REFERENCES products(product_id, product_subclass_id)
);


CREATE TABLE music (
    product_id           INTEGER        PRIMARY KEY REFERENCES products(product_id) ON DELETE CASCADE,
    product_subclass_id  AS (2)         NOT NULL REFERENCES products_subclasses(product_subclass_id),
    artist               NVARCHAR2(50)  NOT NULL,
    album                NVARCHAR2(50)  NOT NULL,
    explicit             NUMBER(1)      DEFAULT 0 NOT NULL,
    FOREIGN KEY (product_id, product_subclass_id) REFERENCES products(product_id, product_subclass_id)
);

CREATE TABLE prices (
    product_id  INTEGER   NOT NULL REFERENCES products(product_id) ON DELETE CASCADE,
    type_id     INTEGER   NOT NULL REFERENCES types(type_id),
    discount    INTEGER   DEFAULT 0 NOT NULL,
    amount      FLOAT(2)  NOT NULL,
    PRIMARY KEY (product_id, type_id)
);

CREATE TABLE inventory (
    product_id  INTEGER  NOT NULL REFERENCES products(product_id) ON DELETE CASCADE,
    type_id     INTEGER  NOT NULL REFERENCES types(type_id),
    stock       INTEGER  NOT NULL,
    PRIMARY KEY (product_id, type_id)
);

CREATE TABLE orders (
    order_id               INTEGER       PRIMARY KEY,
    user_id                INTEGER       NOT NULL REFERENCES users(user_id),
    placed_at              TIMESTAMP     NOT NULL,
    address_apt_number     VARCHAR2(10)  DEFAULT NULL,
    address_street_number  VARCHAR2(10)  DEFAULT NULL,
    address_postal_code    VARCHAR2(6)   DEFAULT NULL REFERENCES address_info(address_postal_code),
    discount               INTEGER       DEFAULT 0 NOT NULL
);

CREATE TABLE orders_items (
    order_id    INTEGER   NOT NULL REFERENCES orders(order_id) ON DELETE CASCADE,
    product_id  INTEGER   NOT NULL REFERENCES products(product_id),
    type_id     INTEGER   NOT NULL REFERENCES types(type_id),
    discount    INTEGER   DEFAULT 0 NOT NULL,
    amount      FLOAT(2)  NOT NULL,
    quantity    INTEGER   DEFAULT 1 NOT NULL,
    sub_total   FLOAT(2)  NOT NULL,
    tax         FLOAT(2)  NOT NULL,
    total       FLOAT(2)  NOT NULL,
    PRIMARY KEY (order_id, product_id, type_id)
);

exit;
EOF