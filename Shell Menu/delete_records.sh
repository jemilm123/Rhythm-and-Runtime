#!/bin/bash

# Alliyah Mohammed (500879485)
# Syed Zaidi (500986150)
# Jemil Modha (500969726)
# Section 2 - Group 82

clear
read -p "Enter table: " TABLE
clear
read -p "Enter WHERE clause: " WHERE
clear

sqlplus64 "$USER/$OR12_PASS@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl12c)))" << EOF
DELETE
FROM $TABLE
WHERE $WHERE;

exit;
EOF
