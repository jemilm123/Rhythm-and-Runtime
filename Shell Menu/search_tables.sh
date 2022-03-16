#!/bin/bash

# Alliyah Mohammed (500879485)
# Syed Zaidi (500986150)
# Jemil Modha (500969726)
# Section 2 - Group 82

clear
echo "Search for"
echo "  1)  User"
echo "  2)  Order"
echo "  3)  Product"
echo "Choose:"

read CHOICE
if [ "$CHOICE" == "1" ]
then
    clear
    read -p "Enter first or last name: " NAME
    clear
    sqlplus64 "$USER/$OR12_PASS@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl12c)))" << EOF
    SELECT *
    FROM users
    WHERE
        name_first = '$NAME' OR
        name_last = '$NAME';
EOF

if [ "$CHOICE" == "2" ]
then
    clear
    read -p "Enter order ID: " ORDER_ID
    clear
    sqlplus64 "$USER/$OR12_PASS@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl12c)))" << EOF
    SELECT *
    FROM orders
    WHERE
        order_id = '$ORDER_ID';
EOF

if [ "$CHOICE" == "3" ]
then
    clear
    read -p "Enter product ID: " PRODUCT_ID
    clear
    echo "Product of type"
    echo "  1)  Movie"
    echo "  2)  Music"
    echo "Choose:"

    read PRODUCT_TYPE
    if [ "$PRODUCT_TYPE" == "1" ]
    then
        clear
        sqlplus64 "$USER/$OR12_PASS@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl12c)))" << EOF
        SELECT *
        FROM movies
        WHERE
            product_id = '$PRODUCT_ID';
EOF

    elif [ "$PRODUCT_TYPE" == "2" ]
    then
        clear
        sqlplus64 "$USER/$OR12_PASS@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl12c)))" << EOF
        SELECT *
        FROM music
        WHERE
            product_id = '$PRODUCT_ID';
EOF
