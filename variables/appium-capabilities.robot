*** Variables ***

${APPIUM_SERVER_ADDRESS}    http://localhost:4723/wd/hub
${PLATFORM_NAME}            Android
${PLATFORM_VERSION}         7
${DEVICE_NAME}              49ZSR4CEEM6TA6GI
${APK}                      ${CURDIR}/../apks/app-debug.apk
${APP_ACTIVITY}             com.example.helloworld.LoginActivity
${APP_PACKAGE}              com.example.helloworld
${AVD}                      49ZSR4CEEM6TA6GI
${AUTOMATION_NAME}          uiautomator2
${KILL_PROCESS_COMMAND}     ps aux | pgrep -f pattern | xargs kill $SIGTERM