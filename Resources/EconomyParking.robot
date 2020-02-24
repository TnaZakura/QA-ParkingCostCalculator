*** Settings ***
Documentation    Keywords available to test PO Parking Lot

#Library     SeleniumLibrary
#Resource  ./PO/ParkingLotDropDown.robot/
Resource  ./PO/EntryAndLeavingDateTime.robot
Resource  ./Common.robot

*** Variables ***
#defaultValues
${DefaultEntryTime}         01:00
${LTime1hour}               02:00
${LTime4hours}              05:00
${LTime5hours}              06:00
${LTime5hours10m}           06:10

#Results Expected
${ExpectedRateEP1hour}        $ 2.00
${ExpectedRateEP4hours}       $ 8.00
${ExpectedRateEP5hours}       $ 9.00
${ExpectedRateEP24hours}      $ 9.00
${ExpectedRateEP48hours}      $ 18.00
${ExpectedRateEP7days}        $ 54.00

${ExpectedRateEP5H10M}        $ 9.00

*** Keywords ***
User calculates "Economy Parking” costs for 1 hour.
    User Enters Valid "Entry Date/Time" and "Leaving Date/Time" values and "Clicks Calculate button"  ${DefaultEntryTime}  ${LTime1hour}   ${ExpectedRateEP1hour}

The user calculates "Economy Parking” costs for 4 hours.
    User Enters Valid "Entry Date/Time" and "Leaving Date/Time" values and "Clicks Calculate button"    ${DefaultEntryTime}  ${LTime4hours}  ${ExpectedRateEP4hours}

The user calculates "Economy Parking” costs for 5 hours.
    User Enters Valid "Entry Date/Time" and "Leaving Date/Time" values and "Clicks Calculate button"    ${DefaultEntryTime}  ${LTime5hours}  ${ExpectedRateEP5hours}

The user calculates "Economy Parking” costs for 24 hours.
    User Adds a 24 hours windonw in "Entry" and "Leaving" Date Time Fields
    User clicks "Calculate" Button and gets an estimation cost   ${ExpectedRateEP24hours}

The user calculates "Economy Parking” costs for 48 hours.
    User Adds X days and X hours into Date Time Fields   2 days  ${DefaultEntryTime}  ${DefaultEntryTime}
    User clicks "Calculate" Button and gets an estimation cost   ${ExpectedRateEP48hours}

The user calculates "Economy Parking” costs for 1 week.
    User Adds X days and X hours into Date Time Fields   7 days  ${DefaultEntryTime}  ${DefaultEntryTime}
    User clicks "Calculate" Button and gets an estimation cost   ${ExpectedRateEP7days}

The user calculates "Economy Parking” costs for 5 hours and 10 minutes, incorrect value is displayed.
    User Enters Valid "Entry Date/Time" and "Leaving Date/Time" "Clicks Calculate" and gets "Incorrect" value.  ${DefaultEntryTime}  ${LTime5hours10m}  ${ExpectedRateEP5H10M}

