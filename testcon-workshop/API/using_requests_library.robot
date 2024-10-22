*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Create a New Post
    # Step 1: Define the data to be sent in the POST request
    ${data}=    Create Dictionary    title=foo    body=bar    userId=1

    # Step 2: Make a POST request using the full URL
    ${response}=    POST    ${BASE_URL}/posts    json=${data}

    # Step 3: Verify that the response status is 201 (Created)
    Should Be Equal As Numbers    ${response.status_code}    201

    # Step 4: Log the response body as JSON
    Log    ${response.json()}
