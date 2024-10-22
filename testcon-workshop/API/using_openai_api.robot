
*** Settings ***
Library    RequestsLibrary

*** Variables ***
${API_KEY}      sk-your_openai_key_here
${BASE_URL}     https://api.openai.com/v1
${MODEL}        gpt-4o-mini

*** Test Cases ***
Send OpenAI API Request
    Create Session    openai    ${BASE_URL}    headers={"Authorization":"Bearer ${API_KEY}"}
    ${data}=    Create Dictionary    model=${MODEL}    prompt=What is Robot Framework?    max_tokens=50
    ${response}=    POST    openai    /completions    json=${data}
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    ${response.json()}
    Log    ${response.json()['choices'][0]['text']}
