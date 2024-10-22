*** Settings ***
Library    Browser    auto_closing_level=KEEP    show_keyword_call_banner=True
Resource   browser_page_obj/cookie.resource
Resource   browser_page_obj/main_page.resource

*** Variables ***
${URL}    https://www.ebay.com

*** Test Cases ***
Add Shoes To The Basket
    Open Browser    ${URL}    pause_on_failure=True
    Accept The Cookie
    Search For A Product    shoes
    
    Get Text    xpath=//h1    contains    shoes
    Click    xpath=//li[contains(@class, "s-item")][1]//a[contains(@class, "s-item__link")][1][1]
    Close Browser
