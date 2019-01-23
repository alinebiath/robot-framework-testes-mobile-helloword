*** Variables ***

#Defautl Appium server address
${APPIUM_SERVER_ADDRESS}    http://localhost:4723/wd/hub
#Which mobile OS platform to use
${PLATFORM_NAME}            Android
#Mobile OS version
${PLATFORM_VERSION}         7
#Get through the command $ adb devices
${DEVICE_NAME}              insert_device_name
#app relative path
${APK}                      ${CURDIR}/../apks/app-debug.apk
#Activity name for the Android app
${APP_ACTIVITY}             com.example.helloworld.LoginActivity
#Java package of the Android app you want to run
${APP_PACKAGE}              com.example.helloworld
#Which automation engine to use
${AUTOMATION_NAME}          uiautomator2
