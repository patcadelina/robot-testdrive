*** Settings ***
Documentation     This test suite contains testing the footer links in home page
Suite Setup       Launch Browser Setup    ${FREELANCER_EXT}    ${BROWSER}    ${ALIAS1}    ${NATIVE_EVENTS_FALSE}
Suite Teardown    Close All Browsers
Resource          Resources/CommonResources/global_setup.robot
Resource          Resources/PageResources/footer_page.robot
Resource          Resources/PageResources/homepage_lpo_page.robot
Resource          Resources/PageResources/about_page.robot

*** Test Cases ***
Guest User Successfully Goes To About Us Page Through Footer
    Given User Is In Home Page
    When User Clicks About Us Footer Link
    Then User Should Be Redirected To About Us Page
