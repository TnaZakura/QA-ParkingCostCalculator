*** Settings ***
Resource  ../Resources/Common.robot
Resource  ../Resources/ParkingCostCalculatorLoads.robot
Resource  ../Resources/ValetParking.robot
Resource  ../Resources/PO/ParkingLotDropDown.robot

Test Setup       Open Application
Test Teardown    Close Application

*** Test Cases ***
User selects parking lot: "Valet Parking" and gets the estimated Parking Cost for 5, 10 and 24 hours
    [Documentation]  This test calculates the parking cost for 5,10 and 24 hours.
    Landing Page loads and its elements are visible
    User Choose "Valet Parking" in combobox
    The user calculates "Valet Parking" costs for 5 hours.
    The user calculates "Valet Parking" costs for 10 hours.
    The user calculates "Valet Parking" costs for 24 hours.

User selects parking lot: "Valet Parking" and gets the estimated Parking Cost for 1 day and 5 hours
    [Documentation]  This test calculates the parking cost for 29 hours (Test will fail)
    Landing Page loads and its elements are visible
    User Choose "Valet Parking" in combobox
    The user calculates "Valet Parking" costs for "1 day and 5 hours".


