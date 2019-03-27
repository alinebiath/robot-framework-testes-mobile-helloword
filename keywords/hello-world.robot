*** Settings ***

Resource     ${CURDIR}/libraries.robot
Resource     ${CURDIR}/../keywords/common.robot
Variables    ../variables/initial-screen.py


*** Keywords ***

Load the initial screen
    appium.Page Should Contain Element    id=action_bar

    appium.Hide Keyboard

Login screen should be presentend
    Validate strings on screen            @{INITIAL_SCREEN_TEXTS}

    Capture Page Screenshot               filename=initial-screen-validation.png

the credential fields are filled
    [Arguments]                           ${username}
    ...                                   ${password}

    appium.Input Text                     id=txt_username
    ...                                   ${username}

    appium.Input Password                 id=txt_password
    ...                                   ${password}

login is performed
    appium.Hide Keyboard

    appium.Tap                            id=btn_login

the text on the screen should be displayed
    [Arguments]                           ${screen_text}

    appium.Wait Activity                  .MainActivity
    ...                                   timeout=5

    appium.Page Should Contain Text       ${screen_text}

    Capture Page Screenshot               filename=helloworld-text-validation.png

I fill only the password field
    [Arguments]                           ${password}

    appium.Input Password                 id=txt_password
    ...                                   ${password}

the alert on the screen should be displayed
    [Arguments]                           ${fail_alert}

    appium.Wait Until Page Contains       ${fail_alert}

    Capture Page Screenshot               filename=fail-alert-validation.png

I fill only the username field
    [Arguments]                           ${username}

    appium.Input Text                     id=txt_username
    ...                                   ${username}