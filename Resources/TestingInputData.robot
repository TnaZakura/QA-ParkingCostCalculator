*** Settings ***
Documentation    Keywords available to test PO Parking Lot

Resource  ./PO/EntryAndLeavingDateTime.robot
Resource  ./Common.robot

*** Variables ***
#defaultValues
${timetoTest}       1:00
${LtimetoTest}      8:00
${InvalidDate}      5566.55555
${InvalidTime}      5566.55555:00
${EMPTY}

*** Keywords ***
The user adds valid "Entry date" and "Leaving Date"
   Add Current Date to "Entry Date" and "Leaving Date"

User clicks "Calculate" Button and gets an estimation cost for 0 days, 0 hours, and 0 minutes.
    Clicks "Calculate" and Estimated Cost is different than "0"

Clicks "Calculate" and Estimated Cost is different than "0"
    User clicks "Calculate" Button
    Estimated Cost is different than "0"

Calculator returns an estimated cost for 0 days, 0 hours, and 0 minutes.
    The user adds valid "Entry date" and "Leaving Date"
    User clicks "Calculate" Button and gets an estimation cost for 0 days, 0 hours, and 0 minutes.

The user adds Valid "Entry Time" and and "Invalid "Leavind Time" and clicks "Calculate".
    Clicks "PM" radio button in "Entry time"
    User adds a value in "Leaving Time"  ${LtimetoTest}
    User clicks "Calculate" Button
    Estimated Cost is "0"

The user adds "Invalid Entry Time" and and "Invalid "Leavind Time" and clicks "Calculate".
    The user adds Invalid "Entry Time"      26.00
    The user adds Invalid "Leavind Time"    26.66
    Clicks "Calculate" and Estimated Cost is different than "0"

The user adds Valid "Entry Time"
    User adds a value in "Entry Time"   ${timetoTest}

The user adds Invalid "Leavind Time"
    [Arguments]  ${InvalidValue}
    User adds a value in "Leaving Time"   ${InvalidValue}

The user adds Invalid "Entry Time"
    [Arguments]  ${InvalidValue}
    User adds a value in "Entry Time"   ${InvalidValue}

The user adds "Invalid Dates"
   User adds a value in "Entry Date"   ${InvalidDate}
   User adds a value in "Leaving Date"   ${InvalidDate}

The user adds "Invalid Times" and clicks "Calculate".
   User adds a value in "Entry Time"     ${InvalidTime}
   User adds a value in "Leaving Time"   ${InvalidTime}
   Clicks "Calculate" and Estimated Cost is different than "0"

The user adds "Blank Spaces" into input fields and clicks "Calculate".
   User adds a value in "Entry Date"    ${EMPTY}
   User adds a value in "Entry Time"    ${EMPTY}
   User adds a value in "Leaving Date"    ${EMPTY}
   User adds a value in "Leaving Time"    ${EMPTY}
   Clicks "Calculate" and Estimated Cost is different than "0"