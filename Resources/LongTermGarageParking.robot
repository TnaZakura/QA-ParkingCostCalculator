*** Settings ***
Library     SeleniumLibrary

Documentation    Keywords available to test Parking Lot scenarios
#Resource  ./PO/ParkingLotDropDown.robot
Resource  ./PO/EntryAndLeavingDateTime.robot
Resource  ./Common.robot

*** Variables ***
#defaultValues
${DefaultEntryTime}         01:00
${LTime1hour}               02:00
${LTime10hours}             11:00


#Results Expected
${ExpectedRateLTP1hour}       $ 2.00
${ExpectedRateLTP10hours}      $ 12.00
${ExpectedRateLTP24hours}      $ 12.00
${ExpectedRateLTP26hours}      $ 16.00
${ExpectedRateLTP48hours}      $ 24.00
${ExpectedRateLTP7days}        $ 72.00

*** Keywords ***
User calculates "Long-Term Garage Parking” costs for 1 hour.
    User adds a "Valid Entry Date" and Valid "Entry Time"        ${DefaultEntryTime}
    User adds a "Valid Leaving Date" and Valid "Leaving Time"    ${LTime1hour}
    User clicks "Calculate" Button and gets an estimation cost   ${ExpectedRateLTP1hour}

The user calculates "Long-Term Garage Parking” costs for 10 hours.
    User adds a "Valid Entry Date" and Valid "Entry Time"        ${DefaultEntryTime}
    User adds a "Valid Leaving Date" and Valid "Leaving Time"    ${LTime10hours}
    User clicks "Calculate" Button and gets an estimation cost   ${ExpectedRateLTP10hours}

The user calculates "Long-Term Garage Parking” costs for 24 hours.
    User Adds a 24 hours windonw in "Entry" and "Leaving" Date Time Fields
    User clicks "Calculate" Button and gets an estimation cost   ${ExpectedRateLTP24hours}

The user calculates "Long-Term Garage Parking” costs for 48 hours.
    User Adds X days and X hours into Date Time Fields   2 days  ${DefaultEntryTime}  ${DefaultEntryTime}
    User clicks "Calculate" Button and gets an estimation cost   ${ExpectedRateLTP48hours}

The user calculates "Long-Term Garage Parking” costs for 1 week.
    User Adds X days and X hours into Date Time Fields   7 days  ${DefaultEntryTime}  ${DefaultEntryTime}
    User clicks "Calculate" Button and gets an estimation cost   ${ExpectedRateLTP7days}