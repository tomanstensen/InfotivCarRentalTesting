*** Settings ***
Documentation    A testsuite for the Lab 2, testing the Infotiv Car Rental services webpage.
Library    SeleniumLibrary
Resource    Resources.robot
Resource    resources.robot
*** Test Cases ***
Infotiv car rental services
    [Documentation]    Testing the navigational flow of booking a car
    [Tags]    [Req 1][Req 2][Req 3][Req 4]
    
    Open webpage
    Log into account    ${user1}    ${passw1}
    Select trip-dates
    Choose car and press book
    Confirm booking
    Check booking details
    Log out and exit browser

Cancel a booking
    [Documentation]     Removing a booked car from 'My page'
    [Tags]    [Req 2][Req 3][Req 4]
    Open webpage
    Log into account    ${user1}    ${passw1}
    Cancel a car
    Log out and exit browser