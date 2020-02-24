*** Settings ***
Resource  ../Resources/Common.robot
Resource  ../Resources/ParkingCostCalculatorLoads.robot
Resource  ../Resources/LongTermGarageParking.robot
Resource  ../Resources/PO/ParkingLotDropDown.robot

Test Setup       Open Application
Test Teardown    Close Application

*** Test Cases ***
User selects parking lot: "Long-Term Garage Parking" and gets the estimated Parking Cost
    [Documentation]  Calculates the Long-Term Garage Parking parking cost for 1, 10, 24, 48 hours and one week.
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

User selects "Long-Term Garage Parking" and calculates parking cost for 6 hours and 10 minutes and gets an incorrect cost
    [Documentation]  This test calculates the parking cost testing rate with minutes.
    Landing Page loads and its elements are visible
    User Choose “Long-Term Garage Parking” in combobox
    The user calculates "Long-Term Garage Parking” costs for 6 hours and 10 minutes, incorrect value is displayed.