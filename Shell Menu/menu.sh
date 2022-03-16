#!/bin/bash

# Alliyah Mohammed (500879485)
# Syed Zaidi (500986150)
# Jemil Modha (500969726)
# Section 2 - Group 82

pause(){
   read -p "Press [Enter] key to continue..."
}

MainMenu()

{ while [ "$CHOICE" != "E" ]
  do
    clear
    echo "-----------------------------------------------------------------"
    echo "|                    Oracle All Inclusive Tool                  |"
    echo "|              Main Menu -Select Desired Operation(s):          |"
    echo "|        <CTRL-Z Anytime to Enter Interactive CMD Prompt>       |"
    echo "-----------------------------------------------------------------"
    echo " "
    echo " 1)  Drop Tables"
    echo " 2)  Create Tables"
    echo " 3)  Populate Tables"
    echo " 4)  Query Tables"
    echo " 5)  Read Tables"
    echo " 6)  Update Records"
    echo " 7)  Delete Records"
    echo " 8)  Search Records"
    echo " E)  End/Exit"
    echo "Choose: "

    read CHOICE
    if  [ "$CHOICE" == "1" ]
    then
        bash drop_tables.sh
        echo " "
        pause
    
    elif [ "$CHOICE" == "2" ]
    then
        bash create_tables.sh
        echo " "
        pause

    elif [ "$CHOICE" == "3" ]
    then
        bash populate_tables.sh
        echo " "
        pause

    elif [ "$CHOICE" == "4" ]
    then
        bash queries.sh
        echo " "
        pause

    elif [ "$CHOICE" == "5" ]
    then
        bash read_tables.sh
        echo " "
        pause

    elif [ "$CHOICE" == "6" ]
    then
        bash update_records.sh
        echo " "
        pause

    elif [ "$CHOICE" == "7" ]
    then
        bash delete_records.sh
        echo " "
        pause

    elif [ "$CHOICE" == "8" ]
    then
        bash search_records.sh
        echo " "
        pause

    elif [ "$CHOICE" == "E" ]
    then
        echo " "
        echo "Exiting..."
        exit

    else
        echo " "
        echo "Invalid choice"
        echo " "
        pause
    fi
done
}

#--COMMENTS BLOCK--
# Main Program 
#--COMMENTS BLOCK--

ProgramStart()
{
    StartMessage
    while [ 1 ]
    do
        MainMenu
    done
}

ProgramStart
