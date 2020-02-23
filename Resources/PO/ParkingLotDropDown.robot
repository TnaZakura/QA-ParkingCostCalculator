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
    Sleep   2s
    Wait Until Element Is Visible           //*[@id="ParkingLot"]/option[contains(text(),'${ParkingName}')]  timeout=20
    sleep  1s
    Click Element                           //*[@id="ParkingLot"]/option[contains(text(),'${ParkingName}')]
    Sleep  5s

User Choose "Valet Parking" in combobox
    User selects an option from combobox         ${ParkingLotLocatior}  ${ValetParking}

User Choose “Short-Term Parking” in combobox
    User selects an option from combobox         ${ParkingLotLocatior}  ${STParking}

User Choose “Economy Parking” in combobox
    User selects an option from combobox         ${ParkingLotLocatior}  ${EconomyParking}

User Choose “Long-Term Garage Parking” in combobox
    User selects an option from combobox         ${ParkingLotLocatior}  ${LTGParking}

User Choose “Long-Term Surface Parking” in combobox
    User selects an option from combobox         ${ParkingLotLocatior}  ${LTSParking}







