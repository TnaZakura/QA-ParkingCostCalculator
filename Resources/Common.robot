*** Settings ***
Documentation    Keywords used for Test Setup  and Test Teardown and some common functions
Resource  ./PO/EntryAndLeavingDateTime.robot
Library     SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://www.shino.de/parkcalc/
${BROWSER}        chrome

${EstimatedParkingCost}     xpath:*//table/tbody/tr[4]/td[2]/span[1]/b
${CalculateBtn}             xpath://body/form/input[2]

${EntryAMRadioButton}       xpath://table/tbody/tr[2]/td[@class='BodyCopy'][2]/input[3]
${EntryPMRadioButton}       xpath://table/tbody/tr[2]/td[@class='BodyCopy'][2]/input[4]

${LeavingAMRadioButton}     xpath://table/tbody/tr[3]/td[@class='BodyCopy'][2]/input[3]
${LeavingPMRadioButton}     xpath://table/tbody/tr[3]/td[@class='BodyCopy'][2]/input[4]
*** Keywords ***
Open Application
    Open Browser  ${LOGIN URL}  ${BROWSER}
    Maximize Browser Window
    Sleep  3s

Close Application
    Sleep  2s
    Close Browser

User clicks "Calculate" Button
    Click Element  ${CalculateBtn}
    Sleep  2s

User clicks "Calculate" Button and gets an estimation cost
    [Arguments]    ${ExpectedRate}
    User clicks "Calculate" Button
    ${Var}=  Get Text  ${EstimatedParkingCost}
    Log  ${Var}
    Should be equal  ${Var}  ${ExpectedRate}
    Sleep  3s

User Enters Valid "Entry Date/Time" and "Leaving Date/Time"
    [Arguments]  ${EntryTime}   ${LeavingTime}
    User adds a "Valid Entry Date" and Valid "Entry Time"        ${EntryTime}
    User adds a "Valid Leaving Date" and Valid "Leaving Time"    ${LeavingTime}

User Enters Valid "Entry Date/Time" and "Leaving Date/Time" values and "Clicks Calculate button"
    [Arguments]     ${EntryTime}  ${LeavingTime}  ${ExpectedRate}
    User Enters Valid "Entry Date/Time" and "Leaving Date/Time"  ${EntryTime}   ${LeavingTime}
    User clicks "Calculate" Button and gets an estimation cost   ${ExpectedRate}

User Enters Valid "Entry Date/Time" and "Leaving Date/Time" "Clicks Calculate" and gets "Incorrect" value.
    [Arguments]     ${EntryTime}  ${LeavingTime}  ${ExpectedRate}
    User Enters Valid "Entry Date/Time" and "Leaving Date/Time"        ${EntryTime}   ${LeavingTime}
    User clicks "Calculate" Button and gets incorrect estimated cost    ${ExpectedRate}

User clicks "Calculate" Button and gets incorrect estimated cost
    [Arguments]  ${ExpectedRate}
    User clicks "Calculate" Button
    ${Var}=  Get Text  ${EstimatedParkingCost}
    Should not be equal  ${Var}  ${ExpectedRate}
    Sleep  3s

Estimated Cost is different than "0"
    ${Var}=  Get Text  ${EstimatedParkingCost}
    Should not be equal  ${Var}  $ 0.00
    Sleep  3s

Estimated Cost is "0"
    ${Var}=  Get Text  ${EstimatedParkingCost}
    Should be equal  ${Var}  $ 0.00
    Sleep  3s


#Clicks "PM" radio button in "leaving time"
#    Click Element  ${LeavingPMRadioButton}
#    Sleep  2s

Clicks "PM" radio button in "Entry time"
    Click Element  ${EntryPMRadioButton}
    Sleep  2s