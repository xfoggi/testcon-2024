*** Settings ***
Library    Browser

*** Test Cases ***
Open Browser
    Open Browser    https://www.google.com    pause_on_failure=True
    Click    selector=//button[@id="L2AGLb"]
    Click    selector=//input[@value="Google Search"]
    Close Browser