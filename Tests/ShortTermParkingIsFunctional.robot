*** Settings ***
Resource  ../Resources/Common.robot
Resource  ../Resources/ParkingCostCalculatorLoads.robot
Resource  ../Resources/EconomyParking.robot
Library  SeleniumLibrary

Test Setup       Open Application
Test Teardown    Close Application

*** Test Cases ***
User selects parking lot: "Short-Tearm Parking" and gets the estimated Parking Cost for 1, 1:30, 24, 26, and 48 hours
    [Documentation]  Calculates the parking cost for 1, 1:30, 24 and 26 hours.
    Landing Page loads and its elements are visible
    User Choose “Short-Term Parking” in combobox
    The user calculates “Short-Term Parking” costs for 1 hour.
    User Choose “Short-Term Parking” in combobox
    The user calculates “Short-Term Parking” costs for 1 hour and 30 minutes.
    User Choose “Short-Term Parking” in combobox
    The user calculates “Short-Term Parking” costs for 24 hours.
    User Choose “Short-Term Parking” in combobox
    The user calculates “Short-Term Parking” costs for 1 day and 2 hours.
    User Choose “Short-Term Parking” in combobox
    The user calculates “Short-Term Parking” costs for 48 hours.