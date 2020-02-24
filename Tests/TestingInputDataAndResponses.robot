*** Settings ***
Resource  ../Resources/Common.robot
Resource  ../Resources/ParkingCostCalculatorLoads.robot
Resource  ../Resources/TestingInputData.robot
Resource  ../Resources/PO/ParkingLotDropDown.robot

Test Setup       Open Application
Test Teardown    Close Application

*** Test Cases ***
Testing Input Data and Calculator Response
    Landing Page loads and its elements are visible
    Calculator returns an estimated cost for 0 days, 0 hours, and 0 minutes.

User is allowed to add "entry time" greater than "leaving time".
    Landing Page loads and its elements are visible
    The user adds valid "Entry date" and "Leaving Date"
    The user adds Valid "Entry Time" and and "Invalid "Leavind Time" and clicks calculate button.

User is able to add an invalid entry time and invalid leaving time and get an estimation cost.
    Landing Page loads and its elements are visible
    The user adds valid "Entry date" and "Leaving Date"
    The user adds "Invalid Entry Time" and and "Invalid "Leavind Time" and clicks "Calculate".