#!/bin/bash
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib

# Alliyah Mohammed (500879485)
# Syed Zaidi (500986150)
# Jemil Modha (500969726)
# Section 2 - Group 82

sqlplus64 "$USER/$OR12_PASS@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl12c)))" <<EOF

DROP TABLE orders_items;
DROP TABLE orders;
DROP TABLE movies;
DROP TABLE music;
DROP TABLE prices;
DROP TABLE inventory;
DROP TABLE products;
DROP TABLE products_subclasses;
DROP TABLE types;
DROP TABLE users;
DROP TABLE address_info;

exit;
EOF