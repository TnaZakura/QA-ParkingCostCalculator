*** Settings ***
Resource  ../Resources/Common.robot
Resource  ../Resources/ParkingCostCalculatorLoads.robot
Resource  ../Resources/EconomyParking.robot
Resource  ../Resources/PO/ParkingLotDropDown.robot

Test Setup       Open Application
Test Teardown    Close Application

*** Test Cases ***
User selects parking lot: "Economy Parking" and gets the estimated Parking Cost
    [Documentation]  Calculates the Economy parking cost for 1, 4,5, 24, 48 hours and a week.
    Landing Page loads and its elements are visible
    User Choose “Economy Parking” in Combobox
    User calculates "Economy Parking” costs for 1 hour.
    User Choose “Economy Parking” in combobox
    The user calculates "Economy Parking” costs for 4 hours.
    User Choose “Economy Parking” in combobox
    The user calculates "Economy Parking” costs for 5 hours.
    User Choose “Economy Parking” in combobox
    The user calculates "Economy Parking” costs for 24 hours.
    User Choose “Economy Parking” in combobox
    The user calculates "Economy Parking” costs for 48 hours.
    User Choose “Economy Parking” in combobox
    The user calculates "Economy Parking” costs for 1 week.

User selects "Economy Parking" adds 5 hours and 10 minutes in leaving time and gets incorrect parking cost
    [Documentation]  This test calculates the parking cost adding minutes
    Landing Page loads and its elements are visible
    User Choose “Economy Parking” in combobox
    The user calculates "Economy Parking” costs for 5 hours and 10 minutes, incorrect value is displayed.