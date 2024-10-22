
*** Settings ***
Library    MyLibrary.py

*** Variables ***
${NUMBER ONE}    5
${NUMBER TWO}    10

*** Keywords ***
# Custom keyword for summing two numbers
Sum Two Numbers
    [Arguments]    ${x}    ${y}
    ${result}=    Evaluate    ${x} + ${y}
    Log    The sum of ${x} and ${y} is ${result}
    [Return]    ${result}

# Custom keyword using a Python function from MyLibrary
Multiply Two Numbers
    [Arguments]    ${x}    ${y}
    ${result}=    Multiply Numbers    ${x}    ${y}
    Log    The result of multiplying ${x} and ${y} is ${result}
    [Return]    ${result}

*** Test Cases ***
# Test using the custom keyword "Sum Two Numbers"
Test Sum Two Numbers
    ${sum}=    Sum Two Numbers    ${NUMBER ONE}    ${NUMBER TWO}
    Should Be Equal    ${sum}    15

# Test using the Python custom function for multiplication
Test Multiply Two Numbers
    ${result}=    Multiply Two Numbers    ${NUMBER ONE}    ${NUMBER TWO}
    Should Be Equal    ${result}    50
