*** Settings ***
Resource  ../Resources/Common.robot
Resource  ../Resources/ParkingCostCalculatorLoads.robot
Resource  ../Resources/TestingInputData.robot
Resource  ../Resources/PO/ParkingLotDropDown.robot

Test Setup       Open Application
Test Teardown    Close Application

*** Test Cases ***
Testing Input Data and Calculator Response
    [Documentation]  BUG-01
    Landing Page loads and its elements are visible
    Calculator returns an estimated cost for 0 days, 0 hours, and 0 minutes.

User is allowed to add "entry time" greater than "leaving time".
     [Documentation]  BUG-02
    Landing Page loads and its elements are visible
    The user adds valid "Entry date" and "Leaving Date"
    The user adds Valid "Entry Time" and and "Invalid "Leavind Time" and clicks "Calculate".

User is able to add an invalid entry time and invalid leaving time and get an estimation cost.
    [Documentation]  BUG-03
    Landing Page loads and its elements are visible
    The user adds valid "Entry date" and "Leaving Date"
    The user adds "Invalid Entry Time" and and "Invalid "Leavind Time" and clicks "Calculate".

The user is able to add invalid values in entry date, entry time, leaving date, and leaving time and get an estimation cost.
     [Documentation]  BUG-04
     Landing Page loads and its elements are visible
     The user adds "Invalid Dates"
     The user adds "Invalid Times" and clicks "Calculate".

The user is able to add “blank spaces” in all "input fields" and get an estimation cost.
     [Documentation]  BUG-05
     Landing Page loads and its elements are visible
     The user adds "Blank Spaces" into input fields and clicks "Calculate".