*** Settings ***
Library     AppiumLibrary


*** Test Cases ***
Open Application and select languege
    Open Test Application
    Select languege
Log in app with userpassword
    Login with username



*** Keywords ***
Open Test Application
    Open Application        remote_url=http://localhost:4723/wd/hub
    ...         deviceName=mobile_training
    ...         platformVersion=13.0
    ...         platformName=Android
    ...         app=/Users/pimphet/Downloads/app-uat-debug.apk
    ...         appPackage=com.scg.ssb.smartlivingplus
    

Select languege
    Wait Until Page Contains Element    xpath=//*[contains(@text,'ภาษาไทย')]    5s
    Click Element    xpath=//*[contains(@text,'ภาษาไทย')]
    Sleep        5s
    Click Element    xpath=//*[contains(@text,'ยืนยัน')]
    Wait Until Page Contains Element    xpath=//*[contains(@text,'เริ่มต้นใช้งาน')]    5s
    Click Element    xpath=//*[contains(@text,'เริ่มต้นใช้งาน')]
    Wait Until Page Contains Element    xpath=//android.widget.Button[@text='Allow']    5s
    Click Element    xpath=//android.widget.Button[@text='Allow']


# Login with username
#     Click Element     xpath=//*[contains(@text,'เข้าใช้งาน')]
#     Wait Until Page Contains Element    xpath=//*[contains(@text,'เข้าสู่ระบบ')]    5s
#     Click Element    xpath=//*[contains(@text,'ด้วยรหัสผ่าน')]
#     Input Text        xpath=//android.view.View[@resource-id="__nuxt"]/android.view.View/android.view.View[2]/android.view.View[1]/android.widget.EditText      0957643007
#     Input Text        xpath=//android.widget.EditText[@resource-id="password"]       Test12345
#     Click Element     xpath=//*[contains(@text,'Login')]

