*** Settings ***
Library     SeleniumLibrary
Documentation    Keywords used for Test Setup  and Test Teardown


*** Variables ***
${LOGIN URL}      http://www.shino.de/parkcalc/
${BROWSER}        chrome

*** Keywords ***
Open Application
    Open Browser  ${LOGIN URL}  ${BROWSER}
    Maximize Browser Window
    Sleep  3s

Close Application
    Sleep  2s
    Close Browser