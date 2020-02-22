*** Settings ***
Library     SeleniumLibrary
Library     DateTime
Documentation    Keywords used for Test Setup  and Test Teardown

*** Variables ***
${LOGIN URL}      http://www.shino.de/parkcalc/
${BROWSER}        chrome

${EstimatedParkingCost}     xpath:*//table/tbody/tr[4]/td[2]/span[1]/b
${CalculateBtn}             xpath://body/form/input[2]

*** Keywords ***
Open Application
    Open Browser  ${LOGIN URL}  ${BROWSER}
    Maximize Browser Window
    Sleep  3s

Close Application
    Sleep  2s
    Close Browser

User clicks "Calculate" Button and gets an estimation cost
    [Arguments]    ${ExpectedRate}
    Click Element  ${CalculateBtn}
    Sleep  2s
    ${Var}=  Get Text  ${EstimatedParkingCost}
    Log  ${Var}
    Should be equal  ${Var}  ${ExpectedRate}
    Sleep  3s


