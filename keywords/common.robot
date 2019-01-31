*** Settings ***

Resource                   ${CURDIR}/libraries.robot
Resource                   ${CURDIR}/../variables/appium-capabilities.robot

*** Variables ***

#Variable stores a Unix command that kills a process
${KILL_PROCESS_COMMAND}    ps aux | pgrep -f pattern | xargs kill $SIGTERM

*** Keywords ***

Launch application
    appium.Open Application                 ${APPIUM_SERVER_ADDRESS}
    ...                                     platformName=${PLATFORM_NAME}
    ...                                     deviceName=${DEVICE_NAME}
    ...                                     uidi=${UDID}
    ...                                     appPackage=${APP_PACKAGE}
    ...                                     appActivity=${APP_ACTIVITY}
    ...                                     automationName=${AUTOMATION_NAME}
    ...                                     app=${APP}
    ...                                     noReset=${noReset}
    ...                                     fullReset=${fullReset}
    ...                                     newCommandTimeout=0
    ...                                     adbExecTimeout=86400
    ...                                     waitAction=${waitAction}
    ...                                     printPageSourceOnFindFailure=${printPageSourceOnFindFailure}
    ...                                     deviceReadyTimeout=15

Exit application
    appium.Quit Application

Validate strings on screen
    [Documentation]                         Validating text on initial screen.
    [Arguments]                             @{texts_to_validate}
    :FOR  ${index}  ${text}  IN ENUMERATE  @{texts_to_validate}
    \    appium.Page Should Contain Text    ${text}

Bootstrap test environment
    [Documentation]                         Bootstrap Appium server.
    Shutdown test environment
    Start appium server

Shutdown test environment
    [Documentation]                         Shutdown Appium server.
    Shutdown appium server

Shutdown appium server
    #Change in the ${KILL_PROCESS_COMMAND} variable the word "pattern" to "appium"
    ${command}                              string.Replace String                                           ${KILL_PROCESS_COMMAND}
    ...                                     search_for=pattern
    ...                                     replace_with=appium
    # Starts the process passed in the command variable (${KILL_PROCESS_COMMAND})
    ${handle}                               process.Start Process
    ...                                     command=${command}
    ...                                     shell=true
    # Waits the shutdown process is complete
    process.Wait For Process                handle=${handle}

Start appium server
    # Launches Appium on the informed path
    ${handle}                               process.Start Process
    ...                                     command=${CURDIR}/../node_modules/.bin/appium
    ...                                     shell=true
    ...                                     stdout=${CURDIR}/../output/appium-output.txt
    ...                                     stderr=${CURDIR}/../output/appium-error.txt
    ...                                     alias=appium
    ...                                     output_encoding=UTF-8
    std.Sleep                               time_=3s