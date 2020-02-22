*** Settings ***
Library     SeleniumLibrary
Library  DateTime
Documentation    Keywords available to test PO Parking Lot
Resource  ./PO/ParkingLotDropDown.robot
Resource  ./PO/EntryAndLeavingDateTime.robot
Resource  ./Common.robot

*** Variables ***
#defaultValues
${DefaultEntryTime}         01:00
${LeavingTime5hours}        06:00

#Results Expected
${ExpectedRateFor5hours}        $ 12.00
${ExpectedRateFor10hours}       $ 18.00
${ExpectedRateFor24hours}       $ 18.00
${ExpectedRateFor29hours}       $ 30.00

*** Keywords ***
The user calculates "Valet Parking" costs for 5 hours.
    User adds a "Valid Entry Date" and Valid "Entry Time"        ${DefaultEntryTime}
    User adds a "Valid Leaving Date" and Valid "Leaving Time"    ${LeavingTime5hours}
    User clicks "Calculate" Button and gets an estimation cost   ${ExpectedRateFor5hours}

The user calculates "Valet Parking" costs for 10 hours.
    User adds a "Valid Entry Date" and Valid "Entry Time"        ${DefaultEntryTime}
    User adds a "Valid Leaving Date" and Valid "Leaving Time"    11:00
    User clicks "Calculate" Button and gets an estimation cost   ${ExpectedRateFor10hours}

The user calculates "Valet Parking" costs for 24 hours.
    User Adds a 24 hours windonw in "Entry" and "Leaving" Date Time Fields
    User clicks "Calculate" Button and gets an estimation cost      ${ExpectedRateFor24hours}

The user calculates "Valet Parking" costs for "1 day and 5 hours".
    User Adds a 1 day 5 hours into Date Time Fields                 ${DefaultEntryTime}  ${LeavingTime5hours}
    User clicks "Calculate" Button and gets an estimation cost      ${ExpectedRateFor29hours}