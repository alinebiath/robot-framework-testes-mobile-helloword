*** Variables ***

#Defautl Appium server address
${APPIUM_SERVER_ADDRESS}    http://localhost:4723/wd/hub

#Which mobile OS platform to use
${PLATFORM_NAME}            Android

#Any name for device (this capability is ignored but required for Android SO)
${DEVICE_NAME}              Any name

#Get through the command "$ adb devices"
${UDID}                     insert_device_serial_number

#app relative path
${APP}                      ${CURDIR}/../apks/app-debug.apk

#Activity name for the Android app
${APP_ACTIVITY}             com.example.helloworld.LoginActivity

#Java package of the Android app you want to run
${APP_PACKAGE}              com.example.helloworld

#Which automation engine to use
${AUTOMATION_NAME}          uiautomator2
