*** Test Cases ***
Basic Math Operations with Built-in Keywords
    Log    Starting the test
    ${x}=    Set Variable    5
    ${y}=    Set Variable    10
    Sum of two numbers with validation    ${x}    ${y}    ${15}
    Log    Test completed successfully

Basic Math Operations with Built-in Keywords 2
    Log    Starting the test
    ${sum}=  Sum of two numbers with validation   ${5}    ${5}    ${10}
    Log    Test completed successfully ${sum}


*** Keywords ***
Sum of two numbers with validation
    [Arguments]    ${x}    ${y}    ${expected}
    [Documentation]    This keyword will sum two numbers and validate the result, and returns the sum.
    [Tags]    Math
    ${sum}=  Evaluate    ${x} + ${y}
    Log    The sum of ${x} and ${y} is ${sum}
    Should Be Equal As Numbers    ${sum}    ${expected}
    RETURN    ${sum}
