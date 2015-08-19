*** Settings ***
Library           Collections
Library           Selenium2Library

*** Variables ***
${BROWSER}              firefox
${PLATFORM}             WINDOWS
${VERSION}              25.
${NATIVE_EVENTS}        ${false}
${LOCALHOST}            http://localhost:4444/wd/hub
${DESIRED_CAPABILITY}   Dynamic
${SERVER_IS_AWS}        0
${ALIAS1}               browser1
${ALIAS2}               browser2
${FREELANCER_EXT}       /

*** Keywords ***
Setup Desired Capability
    ${DC}    Create Dictionary    browserName    ${BROWSER}
    Set To Dictionary    ${DC}    platform    ${PLATFORM}
    Set To Dictionary    ${DC}    version    ${VERSION}
    Set To Dictionary    ${DC}    nativeEvents    ${NATIVE_EVENTS}
    Log    ${DC}
    Set Suite Variable    ${DESIRED_CAPABILITY}    ${DC}
