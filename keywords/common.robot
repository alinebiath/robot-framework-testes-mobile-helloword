*** Settings ***

Resource    ${CURDIR}/libraries.robot


*** Keywords ***

I select the environment
    [Arguments]                                        ${environment}
    collections.List Should Contain Value              ${ENVIRONMENTS_LIST}                                      ${environment}                                                                   msg=Invalid environment: ${environment}.
    appium.Wait Until Page Contains Element            id=logoText                                               20s
    Show debug drawer
    appium.Wait Until Page Contains                    ${environment}                                            timeout=20
    ${count}                                           appium.Get Matching Xpath Count                           //android.widget.RadioButton[@text='${environment}' and @checked='true']
    ${is_desired_environment_not_selected}             std.Evaluate                                              ${count} == 0
    std.Run Keyword If                                 ${is_desired_environment_not_selected}                    appium.Click Element                                                             xpath=//android.widget.RadioButton[@text='${environment}']
    ...                                                ELSE                                                      Hide debug drawer
    std.Sleep                                          time_=1s
    Show debug drawer
    appium.Capture Page Screenshot
    appium.Swipe By Percent                            50                                                        50                                                                               99                                                            50                                                350

Launch application
    appium.Open Application                            ${APPIUM_SERVER_ADDRESS}                                  platformName=${PLATFORM_NAME}                                                    platformVersion=${PLATFORM_VERSION}                           deviceName=${DEVICE_NAME}                         appPackage=${APP_PACKAGE}                        appActivity=${APP_ACTIVITY}    automationName=${AUTOMATION_NAME}    app=${APK}    noReset=${noReset}    fullReset=${fullReset}    newCommandTimeout=0    adbExecTimeout=86400    waitAction=${waitAction}    printPageSourceOnFindFailure=${printPageSourceOnFindFailure}    deviceReadyTimeout=15

Exit application
    appium.Quit Application

Show debug drawer
    appium.Swipe By Percent                            98                                                        50                                                                               15                                                            50
    appium.Wait Until Page Contains Element            id=debugView

Hide debug drawer
    appium.Swipe By Percent                            05                                                        50                                                                               95                                                            50                                                350
    appium.Wait Until Page Does Not Contain Element    id=debugView

Swipe from right to left
    appium.Swipe By Percent                            95                                                        50                                                                               05                                                            50

Validate strings on screen
    [Documentation]                                    Validating i18n text messages in POC selection screen.
    [Arguments]                                        @{texts_to_validate}
    :FOR  ${index}  ${text}  IN ENUMERATE  @{texts_to_validate}
    \    appium.Page Should Contain Text               ${text}

Screen should contains some of strings
    [Documentation]                                    Validating i18n text messages in POC selection screen.
    [Arguments]                                        ${wrong_credentials_messages}
    :FOR  ${index}  ${statement}  IN ENUMERATE  @{wrong_credentials_messages}
    \    appium.Page Should Contain Text               ${statement}

I have selected an environment and I go to authentication screen
    [Documentation]                                    Validate authentication with wrong credentials.
    [Arguments]                                        ${environment}
    Launch application
    I select the environment                           ${environment}
    appium.Click Element                               id=logIn
    appium.Wait Until Page Contains Element            id=signInForm

Bootstrap test environment
    [Documentation]                                    Bootstrap Appium server and Android emulator/device.
    Shutdown test environment
    # Start android virtual device
    Start appium server

Shutdown test environment
    [Documentation]                                    Shutdown Appium server and Android emulator/device.
    # Shutdown android virtual device
    Shutdown appium server

Shutdown android virtual device
    [Documentation]                                    Shutdown Android virtual device.
    ${command}                                         string.Replace String                                     ${KILL_PROCESS_COMMAND}                                                          search_for=pattern                                            replace_with=${AVD}
    ${handle}                                          process.Start Process                                     command=${command}                                                               shell=true                                                    output_encoding=UTF-8
    process.Wait For Process                           handle=${handle}

Start android virtual device
    [Documentation]                                    Start Android virtual device.
    ${handle}                                          process.Start Process                                     command=%{ANDROID_HOME}/emulator/emulator -avd ${AVD} -memory 512 -debug init    shell=true                                                    stdout=${CURDIR}/../output/emulator-output.txt    stderr=${CURDIR}/../output/emulator-error.txt    alias=emulator                 output_encoding=UTF-8

Shutdown appium server
    [Documentation]                                    Shutdown Appium server.
    ${command}                                         string.Replace String                                     ${KILL_PROCESS_COMMAND}                                                          search_for=pattern                                            replace_with=appium
    ${handle}                                          process.Start Process                                     command=${command}                                                               shell=true
    process.Wait For Process                           handle=${handle}

Start appium server
    [Documentation]                                    Start Appium server.
    ${handle}                                          process.Start Process                                     command=${CURDIR}/../node_modules/.bin/appium                                    shell=true                                                    stdout=${CURDIR}/../output/appium-output.txt      stderr=${CURDIR}/../output/appium-error.txt      alias=appium                   output_encoding=UTF-8
    std.Sleep                                          time_=3s