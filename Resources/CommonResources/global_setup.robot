*** Settings ***
Library           Selenium2Library    timeout=60
Resource          global_helper.robot
Resource          launch_webdriver_page.robot
Resource          webdriver_config.robot
Resource          ../PageResources/footer_page.robot
Resource          ../Variables/url_extension_constants.robot

*** Keywords ***
Setup Selenium Speed
    Set Selenium Speed    0.5

Setup Selenium Timeout
    Set Selenium Timeout    15
