*** Settings ***
Library           String
Library           DateTime
Resource          ../Variables/global_constants.robot

*** Keywords ***
Run And Wait Until Keyword Succeeds
    [Documentation]    This keyword is used in waiting for an element to be visible within the global timeout and interval
   [Arguments]    ${p_keyword}    ${p_arg1}    ${p_arg2}=No Operation
   ${isEqual}=  Run Keyword And Return Status    Should Be Equal As Strings    ${p_arg2}    No Operation
   # Run Keyword If     '${p_arg2}' == 'No Operation'
   Run Keyword If    ${isEqual}
   ...    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}    ${p_keyword}    ${p_arg1}
   ...    ELSE
   ...    Wait Until Keyword Succeeds    ${TIMEOUT}    ${INTERVAL}    ${p_keyword}    ${p_arg1}    ${p_arg2}

Go To URL And Bypass AB Test
    [Documentation]  This user keyword will by pass the URL with AB test URL flags with t=
    ${t_AbtestUrl}=    Get Location
    ${t_removeABParam}=  Remove String Using Regexp  ${t_AbtestUrl}   t=.&
    Go To  ${t_removeABParam}
