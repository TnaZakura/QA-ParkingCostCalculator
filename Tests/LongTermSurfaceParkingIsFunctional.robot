*** Settings ***
Resource  ../Resources/Common.robot
Resource  ../Resources/ParkingCostCalculatorLoads.robot
Resource  ../Resources/LongTermSurfaceParking.robot
Resource  ../Resources/PO/ParkingLotDropDown.robot

Test Setup       Open Application
Test Teardown    Close Application

*** Test Cases ***
User selects parking lot: "Long-Term Surface Parking" and gets the estimated Parking Cost
    [Documentation]  Calculates the Long-Term Surface Parking parking cost for 1, 5, 24, 26, 48 hours and one week.
    Landing Page loads and its elements are visible
    User Choose “Long-Term Surface Parking” in Combobox
    The user calculates the parking costs for 1 hour.
    User Choose “Long-Term Surface Parking” in Combobox
    The user calculates the parking costs for 5 hours.
    User Choose “Long-Term Surface Parking” in combobox
    The user calculates the parking costs for 24 hours.
    User Choose “Long-Term Surface Parking” in combobox
    The user calculates the parking for 1 day and 2 hours.
    User Choose “Long-Term Surface Parking” in combobox
    The user the parking costs for 48 hours.
    User Choose “Long-Term Surface Parking” in combobox
    The user calculates the parking for 1 week.