*** Settings ***
Resource  ../Resources/Common.robot
Resource  ../Resources/PO/ParkingLotDropDown.robot
Resource  ../Resources/ParkingCostCalculatorLoads.robot
Library  SeleniumLibrary

Test Setup       Open Application
Test Teardown    Close Application

*** Test Cases ***
User selects parking lot: "Valet Parking" and gets the estimated Parking Cost
    Landing Page loads and its elements are visible
#    Parking Rates Labels loads succesfully in Landing Page
    The user calculates "Valet Parking" costs for 5 hours.