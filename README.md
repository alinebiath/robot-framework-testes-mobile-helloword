# Automated tests for Android app with Robot Framework

- Tests applied in the Android application"Hello World". The <i>.apk</i> is available in the project 
- This application is available for free by Haejoong Lee in his repository at: https://github.com/Anexinet/RobotFrameworkDemo-Android
- The script was developed to test application in physical device and don't perform in emulators. For this, the code must be adapted.

### 1. Pre-conditions for the tests
- Clone the project
- Python 2.7.15 installed
- NodeJS installed
- SDK or Android Studio installed (see how to install: https://robotizandotestes.blogspot.com/2018/01/season-mobile-com-appium-ep01.html)
- An ASCII editor of your preference (i.e. VSCode, Atom, RIDE, etc)</br>

### 2. Installing Appium Server
In the project root directory execute command below:
```sh
$ npm update 
```
This command will download and install Appium and its dependencies from the <i>package.json</i> file in the project folder.</br>

### 3. Installing required Python libraries
With the pre-conditions satisfied, the libraries required to run the tests must be installed. At the terminal, execute the command below:
```sh
Windows
$ pip install -r requirements.txt
```
```sh
Linux / Mac
$ sudo pip install -r requirements.txt
```
This command will perform pip installation of what is required by the Robot Framework specified in the <i>requirements.txt file</i>.</br>

### 4. Getting device information
