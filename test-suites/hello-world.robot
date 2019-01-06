*** Settings ***

Documentation     "Hello Word" Tests Suite to validate the app screens.

Resource          ${CURDIR}/../keywords/hello-world.robot

Suite Setup       Bootstrap test environment
Suite Teardown    Shutdown test environment

Test Setup        Launch application
Test Teardown     Exit application

*** Test Cases ***

Scenario: Load initial screen
    [Tags]                                              initial
    When load the initial screen
    Then login screen should be presentend

Scenario: Login with all fields filled out
    [Tags]                                              all
    When the credential fields are filled               usertest         1234
    And login is performed
    Then the text on the screen should be displayed     Hello World!


Scenario: Login with empty username field
    [Tags]                                              username
    When I fill only the password field                 1234
    And login is performed
    Then the alert on the screen should be displayed    Login Failed!

# Scenario: Login with empty password field
#                 When fill in the username field                          usertest
#                 And let the password field empty
#                 Then app should display a toast read                     Login Failed!