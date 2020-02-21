*** Settings ***
Library     SeleniumLibrary
Documentation    Navigation to main page
#Variables   ../../Variables/EnvironmentVariables.py


*** Variables ***
${PageTitle}                xpath://p[@class='PageTitle']
${ParkingLot}               xpath://td[@class='BodyCopy'][2]/select[@id='ParkingLot']
${EntryDateInput}           xpath://*[@id="StartingDate"]
${EntryTimeInput}           xpath://*[@id="StartingTime"]
${EntryAMRadioButton}       xpath://table/tbody/tr[2]/td[@class='BodyCopy'][2]/input[3]
${EntryPMRadioButton}       xpath://table/tbody/tr[2]/td[@class='BodyCopy'][2]/input[4]

${LeavingDateInput}         xpath://*[@id="LeavingDate"]
${LeavingTimeInput}         xpath://*[@id="LeavingTime"]
${LeavingAMRadioButton}     xpath://table/tbody/tr[3]/td[@class='BodyCopy'][2]/input[3]
${LeavingAMRadioButton}     xpath://table/tbody/tr[3]/td[@class='BodyCopy'][2]/input[4]

${EstimatedParkingCost}     xpath://tbody/tr[4]/td[@class='SubHead']
${CalculateBtn}             xpath://body/form/input[2]


${ValetParkingRateInfo}             xpath://p[@class='BodyCopy'][2]
${ShortTermParkingRateInfo}         xpath://p[@class='BodyCopy'][3]
${LongTermGarageParkingRateInfo}    xpath://p[@class='BodyCopy'][4]
${LongTermSurfaceParkingRateInfo}   xpath://p[@class='BodyCopy'][5]
${EconomyLotParkingRateInfo}        xpath://p[@class='BodyCopy'][5]


*** Keywords ***
Landing Page loads and its elements are visible
    Wait Until Page Contains Element            ${PageTitle}  timeout=30
    Wait Until Page Contains Element            ${ParkingLot}  timeout=30
    Sleep  2s
    Element should be visible                   ${EntryDateInput}
    Element should be visible                   ${EntryTimeInput}
    Element should be visible                   ${EntryAMRadioButton}
    Element should be visible                   ${EntryPMRadioButton}
    Element should be visible                   ${LeavingDateInput}
    Element should be visible                   ${LeavingTimeInput}
#    Element should be visible                   ${LeavingAMRadioButton}
#    Element should be visible                   ${LeavingAMRadioButton}
    Sleep  2s


Parking Rates Labels loads succesfully in Landing Page
    Wait Until Page Contains Element            ${ValetParkingRateInfo}             timeout=30
    Wait Until Page Contains Element            ${ShortTermParkingRateInfo}         timeout=30
    Wait Until Page Contains Element            ${LongTermGarageParkingRateInfo}    timeout=30
    Wait Until Page Contains Element            ${LongTermSurfaceParkingRateInfo}   timeout=30
    Wait Until Page Contains Element            ${EconomyLotParkingRateInfo}        timeout=30