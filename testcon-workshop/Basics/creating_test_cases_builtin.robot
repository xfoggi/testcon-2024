
*** Test Cases ***
Basic Math Operations with Built-in Keywords
    Log    Starting the test
    ${x}=    Set Variable    5
    ${y}=    Set Variable    10
    ${sum}=  Evaluate    ${x} + ${y}
    Log    The sum of ${x} and ${y} is ${sum}
    Should Be Equal    ${sum}    15
    Log    Test completed successfully
