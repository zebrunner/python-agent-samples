*** Settings ***
Documentation       Import all necessary libraries
Library             SeleniumLibrary
Library             robotframework_zebrunner.ZebrunnerLib
Library             ../site-packages/robot/libraries/OperatingSystem.py


*** Variables ***
${URL}                      https://www.google.com/
${COOKIES_DIALOG_TEXT}      Before you continue to Google Search
${SEARCH_VALUE}             Zebrunner


*** Keywords ***
SETUP AND OPEN BROWSER
    [Documentation]     Setup and open browser
    ############################################################################################
    ${options} =                    EVALUATE            selenium.webdriver.[ChromeOptions(), EdgeOptions(), FirefoxOptions()]
    ${options.platform_name} =      SET VARIABLE        linux[...]
    ${options.browser_version} =    SET VARIABLE        109.0[108.0, 107.0]
    CALL METHOD     ${options}      set_capability      enableVideo     true[false]
    ############################################################################################
    ${browser_name} =       SET VARIABLE    ${options.default_capabilities.get("browserName")}
    RUN KEYWORD IF          '${browser_name}' == 'MicrosoftEdge'      ${browser_name} = SET VARIABLE      edge

    ${executor} =       GET ENVIRONMENT VARIABLE    ZEBRUNNER_SELENIUM_GRID     default=http://127.0.0.1:4444
    OPEN BROWSER        browser=${browser_name}     remote_url=${executor}      options=${options}

    MAXIMIZE BROWSER WINDOW
    SET BROWSER IMPLICIT WAIT    20

DELETE COOKIES AND CLOSE BROWSER
    [Documentation]         Close browser
    DELETE ALL COOKIES
    CLOSE ALL BROWSERS

TAKE A SCREENSHOT
    [Documentation]     Take a screenshot
    CAPTURE PAGE SCREENSHOT     filename=screenshot.png
    ATTACH TEST SCREENSHOT      path=screenshot.png
