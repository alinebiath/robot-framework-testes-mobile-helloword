*** Settings ***

Resource    ${CURDIR}/libraries.robot

*** Keywords ***

Launch application
    appium.Open Application                 ${APPIUM_SERVER_ADDRESS}                                  platformName=${PLATFORM_NAME}                    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}                       appPackage=${APP_PACKAGE}                      appActivity=${APP_ACTIVITY}    automationName=${AUTOMATION_NAME}    app=${APK}    noReset=${noReset}    fullReset=${fullReset}    newCommandTimeout=0    adbExecTimeout=86400    waitAction=${waitAction}    printPageSourceOnFindFailure=${printPageSourceOnFindFailure}    deviceReadyTimeout=15

Exit application
    appium.Quit Application

Validate strings on screen
    [Documentation]                         Validating i18n text messages in POC selection screen.
    [Arguments]                             @{texts_to_validate}
    :FOR  ${index}  ${text}  IN ENUMERATE  @{texts_to_validate}
    \    appium.Page Should Contain Text    ${text}

Bootstrap test environment
    [Documentation]                         Bootstrap Appium server and Android emulator/device.
    Shutdown test environment
    Start appium server

Shutdown test environment
    [Documentation]                         Shutdown Appium server and Android emulator/device.
    Shutdown appium server

Shutdown appium server
    [Documentation]                         Shutdown Appium server.
    ${command}                              string.Replace String                                     ${KILL_PROCESS_COMMAND}                          search_for=pattern                     replace_with=appium
    ${handle}                               process.Start Process                                     command=${command}                               shell=true
    process.Wait For Process                handle=${handle}

Start appium server
    [Documentation]                         Start Appium server.
    ${handle}                               process.Start Process                                     command=${CURDIR}/../node_modules/.bin/appium    shell=true                             stdout=${CURDIR}/../output/appium-output.txt    stderr=${CURDIR}/../output/appium-error.txt    alias=appium                   output_encoding=UTF-8
    std.Sleep                               time_=3s