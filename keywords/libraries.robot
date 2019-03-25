*** Settings ***

Documentation    AppiumLibrary: http://serhatbolsu.github.io/robotframework-appiumlibrary/AppiumLibrary.html
...              BuiltIn: http://robotframework.org/robotframework/latest/libraries/BuiltIn.html
...              Collections: http://robotframework.org/robotframework/latest/libraries/Collections.html
...              Process: http://robotframework.org/robotframework/latest/libraries/Process.html
...              String : http://robotframework.org/robotframework/latest/libraries/String.html

Library          AppiumLibrary
...              WITH NAME    appium

Library          BuiltIn
...              WITH NAME    std

Library          Collections
...              WITH NAME    collections

Library          Process
...              WITH NAME    process

Library          String              
...              WITH NAME    string