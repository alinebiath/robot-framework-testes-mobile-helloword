*** Settings ***

Documentation     "Hello Word" Tests Suite to validate the app screens.

Resource          ${CURDIR}/../keywords/hello-world.robot

# Mouting and unmounting the environment by initializing the Appium server to the test suite
Suite Setup       Bootstrap test environment
Suite Teardown    Shutdown test environment

# Pre and post condition for all scenarios
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
    When I fill only the password field                 abcde
    And login is performed
    Then the alert on the screen should be displayed    Login Failed!

Scenario: Login with empty password field
    [Tags]                                              password
    When I fill only the username field                 userone
    And login is performed
    Then the alert on the screen should be displayed    Login Failed!