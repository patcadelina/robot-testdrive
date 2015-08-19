*** Settings ***
Library           Selenium2Library
Library           OperatingSystem

*** Variables ***
${BASE_URL}                     https://www.freelancer.com
${FIREFOX_PROFILE_DIR}          ${CURDIR}${/}firefoxprofile${/}
# ${FIREFOX_PROFILE_DIR}          ${EMPTY}
# ${BROWSER}                      chrome
${NATIVE_EVENTS_TRUE}           ${true}
${NATIVE_EVENTS_FALSE}          ${false}

*** Keywords ***
Browser Is Open
    [Arguments]    ${p_urlExt}    ${p_browser}    ${p_alias}
    Setup Server
    Run Keyword If    '${SERVER_IS_AWS}' == '1'    Browser Is Launched    ${p_urlExt}    ${p_browser}    ${p_alias}    ${LOCALHOST}
    ...    ${DESIRED_CAPABILITY}
    Run Keyword If    '${SERVER_IS_AWS}' == '0'    Browser Is Launched Locally    ${p_urlExt}    ${p_browser}    ${p_alias}

Launch Browser Setup
    [Documentation]    The following arguments are required for this keyword
    ...    ${p_urlExtension}    ${p_browser}    ${p_alias}    ${p_nativeEvents}

        [Arguments]    ${p_urlExtension}    ${p_browser}    ${p_alias}    ${p_nativeEvents}
    ...    ${p_keyword_1}=No Operation    ${p_keyword_2}=No Operation    ${p_keyword_3}=No Operation    ${p_keyword_4}=No Operation

    Run Keyword If    ${p_nativeEvents}    Setup Desired Capability Native True
    ...    ELSE    Setup Desired Capability
    Browser Is Open    ${p_urlExtension}    ${p_browser}    ${p_alias}
    Run Keywords    ${p_keyword_1}    ${p_keyword_2}    ${p_keyword_3}    ${p_keyword_4}

#===============================================#
#             INTERNAL KEYWORDS                 #
#===============================================#

Browser Is Launched
    [Arguments]    ${p_urlExt}    ${p_browser}    ${p_alias}    ${p_remoteUrl}    ${p_desiredCapability}
    Open Browser    ${BASE_URL}    browser=${p_browser}    alias=${p_alias}    remote_url=${p_remoteUrl}    desired_capabilities=${p_desiredCapability}    ff_profile_dir=${FIREFOX_PROFILE_DIR}
    Set Window Size    1024    800
    # Reload Page
    Go To    ${BASE_URL}${p_urlExt}
    Reload Page
    Set Selenium Speed    .5
    Run Keyword If    '${BASE_URL}'!='https://www.freelancer.com'
    ...    Set Global Variable    ${TIMEOUT}    40 sec

Browser Is Launched Locally
    [Arguments]    ${p_urlExt}    ${p_browser}    ${p_alias}
    Open Browser    ${BASE_URL}    browser=${p_browser}    alias=${p_alias}    ff_profile_dir=${FIREFOX_PROFILE_DIR}
    Set Window Size    1024    800
    Go To    ${BASE_URL}${p_urlExt}
    Set Selenium Speed    .5
    Run Keyword If    '${BASE_URL}'!='https://www.freelancer.com'
    ...    Set Global Variable    ${TIMEOUT}    40 sec

Setup Server
    ${hasEnvVar} =    Run Keyword And Return Status    Get Environment Variable    AWS_ENABLED
    Run Keyword If    '${hasEnvVar}' == 'True'    Set Global Variable    ${SERVER_IS_AWS}    %{AWS_ENABLED}
