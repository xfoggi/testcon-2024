
*** Settings ***
Library    Browser

*** Test Cases ***
Search in Example Website
    New Browser    headless=False
    New Page    https://example.com
    Click    text=More Information
    Wait For Elements State    text=Example Domains    visible
    Close Browser
# 