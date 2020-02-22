*** Settings ***
Library     SeleniumLibrary
Documentation    Keywords available to Time and Date fields

*** Variables ***
${EntryDateInput}           xpath://*[@id="StartingDate"]
${EntryTimeInput}           xpath://*[@id="StartingTime"]

${LeavingDateInput}         xpath://*[@id="LeavingDate"]
${LeavingTimeInput}         xpath://*[@id="LeavingTime"]
${DefaultTime24}            01:00

${EntryPMRadioButton}       xpath://table/tbody/tr[2]/td[@class='BodyCopy'][2]/input[4]
${LeavingPMRadioButton}     xpath://table/tbody/tr[3]/td[@class='BodyCopy'][2]/input[4]
*** Keywords ***
Input Date into Datefield
    [Arguments]   ${DateInputLocator}   ${Date}
    Click Element                       ${DateInputLocator}
    Clear element Text                  ${DateInputLocator}
    Sleep  2s
    Input Text                          ${DateInputLocator}  ${Date}
    Sleep  2s

Add Current Date from system into Datefield
    [Arguments]         ${DateLocator}
    ${CurrentDate}=     Get Current Date   UTC   exclude_millis=yes
    ${date}           Convert Date          ${CurrentDate}      result_format=%m/%d/%Y
    Input Date into Datefield            ${DateLocator}  ${date}

Add One Day to current date from system into Datefield
    [Arguments]  ${dateLocator}
    Get Date from system and add X day  1 days  ${dateLocator}

Get Date from system and add X day
    [Arguments]  ${value}  ${dateLocator}
    ${CurDate}=  Get Current Date   UTC   exclude_millis=yes
    ${addOne}=   Add Time To Date      ${CurDate}      ${value}
    ${nextDay}   Convert Date           ${addOne}      result_format=%m/%d/%Y
    Log      ${nextDay}      console=yes
    Input Date into Datefield           ${dateLocator}  ${nextDay}

User adds a "Valid Entry Date" and Valid "Entry Time"
    [Arguments]  ${DefaultTime}
    Add Current Date from system into Datefield  ${EntryDateInput}
    User adds a valid time  ${EntryTimeInput}  ${DefaultTime}


User adds a valid time
    [Arguments]  ${TimeInputLocator}  ${DefaultTime}
    Click element                       ${TimeInputLocator}
    Clear element Text                  ${TimeInputLocator}
    Sleep  2s
    Input Text           ${TimeInputLocator}  ${DefaultTime}
    Sleep  3s

User adds a "Valid Leaving Date" and Valid "Leaving Time"
    [Arguments]  ${DefaultLeavingTime}
    Add Current Date from system into Datefield  ${LeavingDateInput}
    User adds a valid time  ${LeavingTimeInput}  ${DefaultLeavingTime}

User Adds a 24 hours windonw in "Entry" and "Leaving" Date Time Fields
    Add Current Date from system into Datefield              ${EntryDateInput}
    User adds a valid time  ${EntryTimeInput}   ${DefaultTime24}
    Click Element  ${EntryPMRadioButton}
    Add One Day to current date from system into Datefield   ${LeavingDateInput}
    User adds a valid time  ${LeavingTimeInput}   ${DefaultTime24}
    Click Element  ${LeavingPMRadioButton}
