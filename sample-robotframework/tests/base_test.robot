*** Settings ***
Documentation       Import all necessary libraries and resources
Resource            ../resource.resource
Test Setup          SETUP AND OPEN BROWSER
Test Teardown       DELETE COOKIES AND CLOSE BROWSER


*** Test Cases ***
Simple_test
    [Documentation]         Simple demo test for Zebrunner-RobotFramework
    LOG                     'Simple test' test was started
    GO TO                   ${URL}
    TAKE A SCREENSHOT

    ${page_source} =        GET SOURCE
    RUN KEYWORD IF          '${page_source.find('COOKIES_DIALOG_TEXT')}' != '-1'
    ...    RUN KEYWORDS     CLICK ELEMENT    //button[.='Accept all']
    ...    AND
    ...    TAKE A SCREENSHOT

    INPUT TEXT              //input[@name='q']      Zebrunner
    TAKE A SCREENSHOT
    PRESS KEYS              None                    RETURN
    TAKE A SCREENSHOT

    ${first_link} =         GET TEXT                //*[@id='search']//a
    SHOULD CONTAIN          ${first_link}           ${SEARCH_VALUE}

    LOG                     Finish 'simple test' execution
