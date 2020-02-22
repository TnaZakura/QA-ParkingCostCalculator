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
${LTime1hour}               02:00
${LTime4hours}              05:00
${LTime5hours}              06:00

#Results Expected
${ExpectedRateEP1hour}        $ 2.00
${ExpectedRateEP4hours}       $ 8.00
${ExpectedRateEP5hours}       $ 9.00
${ExpectedRateEP24hours}      $ 9.00
${ExpectedRateEP48hours}      $ 18.00
${ExpectedRateEP7days}        $ 54.00

*** Keywords ***
User calculates "Economy Parking” costs for 1 hour.
    User adds a "Valid Entry Date" and Valid "Entry Time"        ${DefaultEntryTime}
    User adds a "Valid Leaving Date" and Valid "Leaving Time"    ${LTime1hour}
    User clicks "Calculate" Button and gets an estimation cost   ${ExpectedRateEP1hour}

The user calculates "Economy Parking” costs for 4 hours.
    User adds a "Valid Entry Date" and Valid "Entry Time"        ${DefaultEntryTime}
    User adds a "Valid Leaving Date" and Valid "Leaving Time"    ${LTime4hours}
    User clicks "Calculate" Button and gets an estimation cost   ${ExpectedRateEP4hours}

The user calculates "Economy Parking” costs for 5 hours.
    User adds a "Valid Entry Date" and Valid "Entry Time"        ${DefaultEntryTime}
    User adds a "Valid Leaving Date" and Valid "Leaving Time"    ${LTime5hours}
    User clicks "Calculate" Button and gets an estimation cost   ${ExpectedRateEP5hours}

The user calculates "Economy Parking” costs for 24 hours.
    User Adds a 24 hours windonw in "Entry" and "Leaving" Date Time Fields
    User clicks "Calculate" Button and gets an estimation cost   ${ExpectedRateEP24hours}

The user calculates "Economy Parking” costs for 48 hours.
    User Adds X days and X hours into Date Time Fields   2 days  ${DefaultEntryTime}  ${DefaultEntryTime}
    User clicks "Calculate" Button and gets an estimation cost   ${ExpectedRateEP48hours}

The user calculates "Economy Parking” costs for 1 week.
    User Adds X days and X hours into Date Time Fields   7 days  ${DefaultEntryTime}  ${DefaultEntryTime}
    User clicks "Calculate" Button and gets an estimation cost   ${ExpectedRateEP7days}