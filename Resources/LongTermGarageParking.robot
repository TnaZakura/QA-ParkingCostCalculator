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
${LTime6hours}              07:10
${TwoDays}                   2 days
${OneWeek}                   7 days
#Results Expected
${ExpectedRateLTP1hour}         $ 2.00
${ExpectedRateLTP10hours}       $ 12.00
${ExpectedRateLTP24hours}       $ 12.00
${ExpectedRateLTP26hours}       $ 16.00
${ExpectedRateLTP48hours}       $ 24.00
${ExpectedRateLTP7days}         $ 72.00
${ExpectedRateLTP6Hours10m}     $ 12.00

*** Keywords ***
User calculates "Long-Term Garage Parking” costs for 1 hour.
    User Enters Valid "Entry Date/Time" and "Leaving Date/Time" values and "Clicks Calculate button"   ${DefaultEntryTime}  ${LTime1hour}  ${ExpectedRateLTP1hour}

The user calculates "Long-Term Garage Parking” costs for 10 hours.
    User Enters Valid "Entry Date/Time" and "Leaving Date/Time" values and "Clicks Calculate button"  ${DefaultEntryTime}  ${LTime10hours}  ${ExpectedRateLTP10hours}

The user calculates "Long-Term Garage Parking” costs for 24 hours.
    User Adds a 24 hours windonw in "Entry" and "Leaving" Date Time Fields
    User clicks "Calculate" Button and gets an estimation cost      ${ExpectedRateLTP24hours}

The user calculates "Long-Term Garage Parking” costs for 48 hours.
    User Adds X days and X hours into Date Time Fields              ${TwoDays}  ${DefaultEntryTime}  ${DefaultEntryTime}
    User clicks "Calculate" Button and gets an estimation cost      ${ExpectedRateLTP48hours}

The user calculates "Long-Term Garage Parking” costs for 1 week.
    User Adds X days and X hours into Date Time Fields              ${OneWeek}  ${DefaultEntryTime}  ${DefaultEntryTime}
    User clicks "Calculate" Button and gets an estimation cost      ${ExpectedRateLTP7days}

The user calculates "Long-Term Garage Parking” costs for 6 hours and 10 minutes, incorrect value is displayed.
   User Enters Valid "Entry Date/Time" and "Leaving Date/Time" "Clicks Calculate" and gets "Incorrect" value.  ${DefaultEntryTime}  ${LTime6hours}  ${ExpectedRateLTP6Hours10m}
