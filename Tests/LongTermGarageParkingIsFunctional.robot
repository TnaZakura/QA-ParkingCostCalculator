*** Settings ***
Resource  ../Resources/Common.robot
Resource  ../Resources/ParkingCostCalculatorLoads.robot
Resource  ../Resources/LongTermGarageParking.robot
Resource  ../Resources/PO/ParkingLotDropDown.robot

Test Setup       Open Application
Test Teardown    Close Application

*** Test Cases ***
User selects parking lot: "Long-Term Garage Parking" and gets the estimated Parking Cost
    [Documentation]  Calculates the Long-Term Garage Parking parking cost for 1, 10, 24, 48 hours and a week.
    Landing Page loads and its elements are visible
    User Choose “Long-Term Garage Parking” in Combobox
    User calculates "Long-Term Garage Parking” costs for 1 hour.
    User Choose “Long-Term Garage Parking” in Combobox
    The user calculates "Long-Term Garage Parking” costs for 10 hours.
    User Choose “Long-Term Garage Parking” in combobox
    The user calculates "Long-Term Garage Parking” costs for 24 hours.
    User Choose “Long-Term Garage Parking” in combobox
    The user calculates "Long-Term Garage Parking” costs for 48 hours.
    User Choose “Long-Term Garage Parking” in combobox
    The user calculates "Long-Term Garage Parking” costs for 1 week.