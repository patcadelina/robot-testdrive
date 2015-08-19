*** Settings ***
Resource          ../Variables/footer_constants.robot

*** Keywords ***
User Clicks About Us Footer Link
    Home Page Footer Should Be Displayed
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}    Element Should Be Visible    ${FOOTER_ABOUT_US_LINK}
    Click Element    ${FOOTER_ABOUT_US_LINK}

Home Page Footer Should Be Displayed
    Run And Wait Until Keyword Succeeds    Element Should Be Visible    ${HOME_PAGE_BANNER_SECTION}
