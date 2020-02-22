*** Settings ***
Library     SeleniumLibrary
Library  DateTime
Documentation    Keywords available to test PO Parking Lot

Resource  ./PO/EntryAndLeavingDateTime.robot
Resource  ./Common.robot

*** Variables ***
#defaultValues
${DefaultEntryTime}              01:00
${LeavingTime1hour}              02:00
${LeavingTime2hours}              03:00
${LeavingTime1_30hour}           02:30

#Results Expected
${ExpectedRate1hour}             $ 2.00
${ExpectedRate1hours30Minutes}   $ 3.00
${ExpectedRate24hours}           $ 24.00
${ExpectedRate26hours}           $ 28.00
${ExpectedRate48hours}           $ 48.00

*** Keywords ***
The user calculates “Short-Term Parking” costs for 1 hour.
    User adds a "Valid Entry Date" and Valid "Entry Time"        ${DefaultEntryTime}
    User adds a "Valid Leaving Date" and Valid "Leaving Time"    ${LeavingTime1hour}
    User clicks "Calculate" Button and gets an estimation cost   ${ExpectedRate1hour}

The user calculates “Short-Term Parking” costs for 1 hour and 30 minutes.
    User adds a "Valid Entry Date" and Valid "Entry Time"        ${DefaultEntryTime}
    User adds a "Valid Leaving Date" and Valid "Leaving Time"    ${LeavingTime1_30hour}
    User clicks "Calculate" Button and gets an estimation cost   ${ExpectedRate1hours30Minutes}

The user calculates “Short-Term Parking” costs for 24 hours.
    User Adds a 24 hours windonw in "Entry" and "Leaving" Date Time Fields
    User clicks "Calculate" Button and gets an estimation cost   ${ExpectedRate24hours}

The user calculates “Short-Term Parking” costs for 1 day and 2 hours.
    User Adds X Days And X Hours Into Date Time Fields     1 days  ${DefaultEntryTime}  ${leavingtime2hours}
    User clicks "Calculate" Button and gets an estimation cost   ${ExpectedRate26hours}

The user calculates “Short-Term Parking” costs for 48 hours.
    User Adds X days and X hours into Date Time Fields   2 days  ${DefaultEntryTime}  ${DefaultEntryTime}
    User clicks "Calculate" Button and gets an estimation cost   ${ExpectedRate48hours}
