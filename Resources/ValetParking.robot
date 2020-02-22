*** Settings ***
Documentation    Keywords available to test scenarios Parking Lot

Resource  ./PO/EntryAndLeavingDateTime.robot
Resource  ./Common.robot

*** Variables ***
#defaultValues
${DefaultEntryTime}         01:00
${LeavingTime5hours}        06:00
${LeavingTime10}            11:00

#Results Expected
${ExpectedRateFor5hours}        $ 12.00
${ExpectedRateFor10hours}       $ 18.00
${ExpectedRateFor24hours}       $ 18.00
${ExpectedRateFor29hours}       $ 30.00

*** Keywords ***
The user calculates "Valet Parking" costs for 5 hours.
    User Enters Valid "Entry Date/Time" and "Leaving Date/Time" values and "Clicks Calculate button"   ${DefaultEntryTime}  ${LeavingTime5hours}  ${ExpectedRateFor5hours}

The user calculates "Valet Parking" costs for 10 hours.
    User Enters Valid "Entry Date/Time" and "Leaving Date/Time" values and "Clicks Calculate button"   ${DefaultEntryTime}  ${LeavingTime10}  ${ExpectedRateFor10hours}

The user calculates "Valet Parking" costs for 24 hours.
    User Adds a 24 hours windonw in "Entry" and "Leaving" Date Time Fields
    User clicks "Calculate" Button and gets an estimation cost      ${ExpectedRateFor24hours}

The user calculates "Valet Parking" costs for "1 day and 5 hours".
    User Adds X days and X hours into Date Time Fields             1 days  ${DefaultEntryTime}  ${LeavingTime5hours}
    User clicks "Calculate" Button and gets an estimation cost      ${ExpectedRateFor29hours}