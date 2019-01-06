*** Settings ***

Documentation     "Hello Word" Tests Suite to validate the app screens.

Resource          ${CURDIR}/../keywords/hello-world.robot

Suite Setup       Bootstrap test environment
Suite Teardown    Shutdown test environment

Test Setup        Launch application
Test Teardown     Exit application

*** Test Cases ***

Scenario: Load initial screen
    [Tags]                                             initial
    When load the initial screen
    Then login screen should be presentend

Scenario: Click the login button with all fields filled out
    [Tags]                                             all
    When the credential fields are filled              usertest        1234
    And login is performed
    Then the text on the screen should be displayed    Hello World!


# Scenario: Click the login button with empty username field
#                 When let the username field empty
#                 And fill in the password field                           1234
#                 Then app should display a toast read                     Login Failed

# Scenario: Click the login button with empty password field
#                 When fill in the username field                          usertest
#                 And let the password field empty
#                 Then app should display a toast read                     Login Failed