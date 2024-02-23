*** Settings ***
Documentation    Resources for the Infotiv car rental services test suite
Library    SeleniumLibrary
Library    DateTime


*** Variables ***
${url}    http://rental6.infotiv.net/webpage/html/gui/index.php
${user1}  tom.anstensen@iths.se  
${passw1}    IAmUser#6
${date1}
${date2}
${creditcard}    1234123412341234
${cardholder}    Tom Anstensen
${cvc}    123


*** Keywords ***
Open webpage
    [Documentation]     Opens the browser to selected url
    Open Browser    browser=Chrome
    Maximize Browser Window
    Go To    ${url}
Log into account
    [Documentation]    Login using given username and password
    [Tags]    [Req 4]
    [Arguments]   ${username}    ${password}
    Log    ${username}
    Log    ${password}
    Input Text    email    ${username}
    Input Password    password    ${password}
    Click Button    login
Select trip-dates
    [Documentation]    Selecting tripdates
    ${date1}=    Get Current Date     increment=1d
    ${date2}=    Get Current Date     increment=2d
    Input Text    start    ${date1}  
    Input Text    end    ${date2}
    Click Button    continue
Choose car and press book
    [Documentation]    Selecting car    
    Click Button    bookTTpass2
Confirm booking
    [Documentation]    Input of credit card information to confirm booking
    Input Text    cardNum    ${creditcard}
    Input Text    fullName    ${cardholder}
    Input Password    cvc    ${cvc}
    Click Button    confirm

Check booking details
    [Documentation]    Going to my account page to check booking is done
    Click Button    mypage

Log out and exit browser
    [Documentation]    Log out and close browser
    Click Button    logout
    Close Browser

Cancel a car
    [Documentation]    Log in to account and navigate to cancel a former booking
    Click Button    mypage
    Click Button    unBook1
    Alert Should Be Present
