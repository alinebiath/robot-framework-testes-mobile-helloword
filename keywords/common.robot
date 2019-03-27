*** Settings ***

Resource                         ${CURDIR}/libraries.robot
Resource                         ${CURDIR}/../variables/appium-capabilities.robot

*** Variables ***

#Variables stores a command that kills a process
${KILL_PROCESS_COMMAND_UNIX}=    ps aux | pgrep -f process | xargs kill $SIGTERM
${KILL_PROCESS_COMMAND_WIN}=     taskkill.exe /F /IM process


*** Keywords ***

Launch application
    appium.Open Application            ${APPIUM_SERVER_ADDRESS}
    ...                                platformName=${PLATFORM_NAME}
    ...                                deviceName=${DEVICE_NAME}
    ...                                uidi=${UDID}
    ...                                appPackage=${APP_PACKAGE}
    ...                                appActivity=${APP_ACTIVITY}
    ...                                automationName=${AUTOMATION_NAME}
    ...                                app=${APP}
    ...                                noReset=${noReset}
    ...                                fullReset=${fullReset}
    ...                                newCommandTimeout=0
    ...                                adbExecTimeout=86400
    ...                                waitAction=${waitAction}
    ...                                printPageSourceOnFindFailure=${printPageSourceOnFindFailure}
    ...                                deviceReadyTimeout=20

Exit application
    appium.Quit Application

Validate strings on screen
    [Documentation]                    Validating text on initial screen.

    [Arguments]                        @{texts_to_validate}

    FOR
    ...                                ${index}
    ...                                ${text}                                                         IN ENUMERATE
    ...                                @{texts_to_validate}
    appium.Page Should Contain Text    ${text}
    END

Bootstrap test environment
    [Documentation]                    Bootstrap Appium server.

    Shutdown test environment

    Start appium server

Shutdown test environment
    [Documentation]                    Shutdown Appium server.

    Shutdown appium server

Shutdown appium server
    # #Change in the ${KILL_PROCESS_COMMAND_WIN} variable the word "process" to "node.exe"
    ${command}                         string.Replace String
    ...                                ${KILL_PROCESS_COMMAND_WIN}
    ...                                search_for=process
    ...                                replace_with=node.exe

    # Starts the process passed in the command variable (${KILL_PROCESS_COMMAND_WIN})
    ${handle}                          process.Start Process
    ...                                command=${command}
    ...                                shell=true

    # Waits the shutdown process is complete
    process.Wait For Process           handle=${handle}

Start appium server
    # Launches Appium on the informed path
    ${handle}                          process.Start Process
    ...                                command=${CURDIR}/../node_modules/.bin/appium
    ...                                shell=true
    ...                                stdout=${CURDIR}/../output/appium-output.txt
    ...                                stderr=${CURDIR}/../output/appium-error.txt
    ...                                alias=appium
    ...                                output_encoding=UTF-8

    std.Sleep                          time_=30s