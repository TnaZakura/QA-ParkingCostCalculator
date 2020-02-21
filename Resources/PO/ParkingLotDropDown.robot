*** Settings ***
Library     SeleniumLibrary
Library  DateTime
Documentation    Keywords available to test PO Parking Lot

*** Variables ***
${ParkingLotLocatior}       xpath://td[@class='BodyCopy'][2]/select[@id='ParkingLot']
${ValetParking}             Valet Parking

${EntryDateInput}           xpath://*[@id="StartingDate"]
${EntryTimeInput}           xpath://*[@id="StartingTime"]
${DefaultEntryTime}         01:00

${LeavingDateInput}         xpath://*[@id="LeavingDate"]
${LeavingTimeInput}         xpath://*[@id="LeavingTime"]

${EstimatedParkingCost}     xpath://tbody/tr[4]/td[2]/span[@class='SubHead']/b
${CalculateBtn}             xpath://body/form/input[2]

#results expected
${ExpectedRateFor5hours}    $ 12.00

*** Keywords ***
User selects an option from combobox
    [Arguments]  ${Locator}
    Click Element   //*[@id="ParkingLot"]/option[contains(text(),'${Locator}')]
    Sleep  3s

User Choose Valet Parking in combobox
    Click Element  ${ParkingLotLocatior}
    User selects an option from combobox  ${ValetParking}
#     Click Element  ${ParkingLotLocatior}
#    User selects an option from combobox  Short-Term Parking

User Enters a Valid Entry Date and Time
    Click Element       ${EntryDateInput}
    Click Element       ${EntryTimeInput}

The user calculates "Valet Parking" costs for 5 hours.
    User Choose Valet Parking in combobox
    User adds a "Valid Entry Date" and Valid "Entry Time"
    User adds a "Valid Leaving Date" and Valid "Leaving Time"
    User clicks "Calculate" Button and gets the estimation cost

User adds a "Valid Entry Date" and Valid "Entry Time"
    Add Current Date from system into Datefield  ${EntryDateInput}
    User adds a valid time  ${EntryTimeInput}  ${DefaultEntryTime}


User adds a valid time
    [Arguments]  ${EntryTimeInput}  ${DefaultEntryTime}
    Click element                       ${EntryTimeInput}
    Clear element Text                  ${EntryTimeInput}
    Sleep  2s
    Input Text           ${EntryTimeInput}  ${DefaultEntryTime}
    Sleep  3s


User adds a "Valid Leaving Date" and Valid "Leaving Time"
    Add Current Date from system into Datefield  ${LeavingDateInput}
    User adds a valid time  ${LeavingTimeInput}  06:00

User clicks "Calculate" Button and gets the estimation cost
    Click Element  ${CalculateBtn}
    Sleep  2s
    ${Var}=  Get Text  ${EstimatedParkingCost}
    Log  ${Var}
    Should be equal  ${Var}  ${ExpectedRateFor5hours}
    Sleep  3s


Input Date into Datefield
    [Arguments]   ${DateInputLocator}   ${Date}
    Click element                       ${DateInputLocator}
    Clear element Text                  ${DateInputLocator}
    Sleep  2s
    Input Text           ${DateInputLocator}  ${Date}
    Sleep  2s

Add Current Date from system into Datefield
    [Arguments]  ${DateLocator}
    ${CurrentDate}=  Get Current Date   UTC   exclude_millis=yes
    ${future}      Convert Date      ${CurrentDate}      result_format=%m/%d/%Y
    Log      ${future}      console=yes
    Input Date into Datefield          ${DateLocator}  ${future}

