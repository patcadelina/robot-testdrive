*** Settings ***
Documentation     This resource file will contain all keywords for testing PVP File Attachment
Resource          ../Variables/homepage_lpo_constants.robot

*** Keywords ***
User Is In Home Page
    ${t_isHomePage} =    Run Keyword And Return Status    Location Should Contain    ${BASE_URL}/
    Run Keyword If    ${t_isHomePage}    Go To    ${BASE_URL}
    ${t_isLocation_abTest} =    Run Keyword And Return Status    Location Should Contain    ?t=
    Run Keyword If    ${t_isLocation_abTest}    Go To URL And Bypass AB Test

Home Page Setup
    Launch Browser Setup    ${FREELANCER_EXT}    ${BROWSER}    ${ALIAS1}    ${NATIVE_EVENTS_FALSE}    Setup Selenium Speed
