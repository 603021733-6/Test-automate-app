*** Settings ***
Library     SeleniumLibrary
Library     Collections
Library     RequestsLibrary


*** Variables ***
${BaseUrl}              https://reqres.in/
${CorrectApipath}        api/users/12
${IncorrecyApipath}      api/users/1234


*** Test Cases ***
1. Get user profile success
    Create Session                  Api                                 ${BaseUrl}
    ${resp}=  get request           Api                                 ${CorrectApipath}
    Status Should Be                200                                 ${resp}
    ${respJson}=  set variable      ${resp.json()}
    Should Be Equal As Integers     ${respJson['data']['id']}           12
    Should Be Equal As Strings      ${respJson['data']['email']}        rachel.howell@reqres.in
    Should Be Equal As Strings      ${respJson['data']['first_name']}   Rachel
    Should Be Equal As Strings      ${respJson['data']['last_name']}    Howell
    Should Be Equal As Strings      ${respJson['data']['avatar']}       https://reqres.in/img/faces/12-image.jpg

2. Get user profile but user not found
    Create Session                  Api                                 ${BaseUrl}
    ${resp}=  get request           Api                                 ${IncorrecyApipath}
    Status Should Be                404                                 ${resp}
    ${body}=  Convert To String     ${resp.content}      
    Should Be Equal                 ${body}                             {}
