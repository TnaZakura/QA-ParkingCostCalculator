*** Settings ***
Resource  ../Resources/Common.robot
#Resource  ../Resources/PO/ParkingLotDropDown.robot
Resource  ../Resources/ParkingCostCalculatorLoads.robot
Resource  ../Resources/ValetParking.robot
Library  SeleniumLibrary

Test Setup       Open Application
Test Teardown    Close Application

*** Test Cases ***
User selects parking lot: "Valet Parking" and gets the estimated Parking Cost
    Landing Page loads and its elements are visible
    User Choose "Valet Parking" in combobox
    The user calculates "Valet Parking" costs for 5 hours.
    The user calculates "Valet Parking" costs for 10 hours.
    The user calculates "Valet Parking" costs for 24 hours.

#User selects parking lot: "Valet Parking" and gets the estimated Parking Cost for 10 hours
 #   Landing Page loads and its elements are visible
  #  User Choose "Valet Parking" in combobox
   # The user calculates "Valet Parking" costs for 10 hours.

#User selects parking lot: "Valet Parking" and gets the estimated Parking Cost for 1 day
#    Landing Page loads and its elements are visible
#    User Choose "Valet Parking" in combobox
#    The user calculates "Valet Parking" costs for 24 hours.

