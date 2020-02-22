*** Settings ***
Library     SeleniumLibrary

Documentation    Keywords available to test PO Parking Lot

*** Variables ***
${ParkingLotLocatior}       xpath://td[@class='BodyCopy'][2]/select[@id='ParkingLot']
${ValetParking}             Valet Parking
${STParking}                Short-Term Parking
${EconomyParking}           Economy Parking
${LTGParking}               Long-Term Garage Parking
${LTSParking}               Long-Term Surface Parking

*** Keywords ***
User selects an option from combobox
    [Arguments]   ${ComboLocator}  ${ParkingName}
    Click Element   ${ComboLocator}
    Click Element   //*[@id="ParkingLot"]/option[contains(text(),'${ParkingName}')]
    Sleep  3s

User Choose "Valet Parking" in combobox
    User selects an option from combobox         ${ParkingLotLocatior}  ${ValetParking}

User Choose “Short-Term Parking” in combobox
    User selects an option from combobox         ${ParkingLotLocatior}  ${STParking}







