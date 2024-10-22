*** Settings ***
Library    Browser
Variables    variables.py

*** Variables ***
${SUBMIT_BTN}    xpath=//input[@type="submit"]

*** Keywords ***
Search For A Product
    [Arguments]    ${product}
    Fill Text    ${INPUT}    ${product}
    Click    ${SUBMIT_BTN}