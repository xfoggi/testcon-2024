*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Test Cases ***
GET Google Test
    Create Session    google  http://www.google.com

    ${resp}=    GET On Session    google    /    expected_status=200
    Log    ${resp}

# Basic variable ${ }
# Dictionary &{ }
# List @{ }

POST Test
    Create Session  jsonplaceholder  https://jsonplaceholder.typicode.com 
    
    &{data}=    Create dictionary    
    ...    title=Robotframework requests    
    ...    body=This is a test!
    ...    userId=1
    
    ${resp}=    POST On Session    jsonplaceholder  /posts  json=${data}  expected_status=anything     
    Log    ${resp.json()}
    
    Status Should Be    201  ${resp}
    Should Be Equal As Strings    ${resp.json()}[title]    ${data}[title]
    Should Be Equal As Strings    ${resp.json()}[body]    ${data}[body]
    Should Be Equal As Strings    ${resp.json()}[userId]    ${data}[userId]
    Should Be Equal As Strings    ${resp.json()}[id]    101