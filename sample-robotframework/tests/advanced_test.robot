*** Settings ***
Documentation   Import all necessary libraries and resources
Resource        ../resource.resource
Test Setup      SETUP AND OPEN BROWSER
Test Teardown   DELETE COOKIES AND CLOSE BROWSER
Suite Setup     RUN KEYWORDS    CURRENT TEST RUN SET LOCALE             en_US
...             AND             CURRENT TEST RUN SET BUILD              TR build version
...             AND             ATTACH TEST RUN ARTIFACT                artifacts/zeb.png
...             AND             ATTACH TEST RUN ARTIFACT REFERENCE      Zebrunner                           https://zebrunner.com/
...             AND             ATTACH TEST RUN ARTIFACT REFERENCE      Robot Framework                     https://robotframework.org/
...             AND             ATTACH TEST RUN ARTIFACT REFERENCE      Robot Framework Zebrunner Agent     https://zebrunner.com/documentation/reporting/robot/
...             AND             ATTACH TEST RUN LABEL                   TestRunLabel1                       Robot Framework
...             AND             ATTACH TEST RUN LABEL                   TestRunLabel2                       Zebrunner


*** Test Cases ***
Advanced_test
    [Documentation]     Simple demo test for Zebrunner-RobotFramework
    [Tags]                              maintainer=skywalker
    ATTACH TEST LABEL                   TestLabel                 Zebrunner
    ATTACH TEST ARTIFACT                artifacts/zeb.txt
    ATTACH TEST ARTIFACT REFERENCE      TestArtifactReference     https://zebrunner.com/

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
