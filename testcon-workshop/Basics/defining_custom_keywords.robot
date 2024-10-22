
*** Keywords ***
Calculate Sum
    [Arguments]    ${x}    ${y}
    ${result}=    Evaluate    ${x} + ${y}
    Log    The sum of ${x} and ${y} is ${result}

*** Test Cases ***
Use Custom Keyword Example
    Calculate Sum    5    10
