*** Settings ***
Documentation    Keywords available to test Parking Lot scenarios for Long-Term Surface Parking

Resource  ./PO/EntryAndLeavingDateTime.robot
Resource  ./Common.robot

*** Variables ***
#defaultValues
${DefaultEntryTime}         01:00
${LTime1hour}               02:00
${LTime5hours}              06:00
${time2hours}               03:00

#Results Expected
${ExpectedRateLTSP1hour}        $ 2.00
${ExpectedRateLTSP5hours}       $ 10.00
${ExpectedRateLTsP24hours}      $ 10.00
${ExpectedRateLTsP26hours}      $ 14.00
${ExpectedRateLTsP48hours}      $ 20.00
${ExpectedRateLTsP7days}        $ 60.00

*** Keywords ***
The user calculates the parking costs for 1 hour.
    User Enters Valid "Entry Date/Time" and "Leaving Date/Time" values and "Clicks Calculate button"   ${DefaultEntryTime}  ${LTime1hour}  ${ExpectedRateLTSP1hour}

The user calculates the parking costs for 5 hours.
    User Enters Valid "Entry Date/Time" and "Leaving Date/Time" values and "Clicks Calculate button"   ${DefaultEntryTime}  ${LTime5hours}  ${ExpectedRateLTSP5hours}

The user calculates the parking costs for 24 hours.
    User Adds a 24 hours windonw in "Entry" and "Leaving" Date Time Fields
    User clicks "Calculate" Button and gets an estimation cost   ${ExpectedRateLTsP24hours}

The user calculates the parking for 1 day and 2 hours.
    User Adds X Days And X Hours Into Date Time Fields              1 days  ${DefaultEntryTime}  ${time2hours}
    User clicks "Calculate" Button and gets an estimation cost      ${ExpectedRateLTsP26hours}

The user the parking costs for 48 hours.
    User Adds X days and X hours into Date Time Fields              2 days  ${DefaultEntryTime}  ${DefaultEntryTime}
    User clicks "Calculate" Button and gets an estimation cost      ${ExpectedRateLTsP48hours}

The user calculates the parking for 1 week.
    User Adds X days and X hours into Date Time Fields              7 days  ${DefaultEntryTime}  ${DefaultEntryTime}
    User clicks "Calculate" Button and gets an estimation cost      ${ExpectedRateLTsP7days}