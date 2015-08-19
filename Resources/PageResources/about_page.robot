*** Settings ***
Documentation           Contains keywords related to about page

*** Keywords ***
User Should Be Redirected To About Us Page
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}    Location Should Contain    ${ABOUT_US_URL_EXT}