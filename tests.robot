*** Settings ***
Documentation    A testsuite for the Lab 2, testing the Infotiv Car Rental services webpage.
Library    SeleniumLibrary
Library    OperatingSystem
Resource    Resources.robot

*** Test Cases ***
Infotiv car rental services
    [Documentation]    Testing the navigational flow of booking a car
    [Tags]    [Req 1][Req 2][Req 3][Req 4]
    ${date1}=    Get Current Date     increment=1d
    ${date2}=    Get Current Date     increment=2d
    
    Open webpage
    Log into account    ${user1}    ${passw1}
    Select trip-dates    ${date1}    ${date2}
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

Wrong start-date input
    [Documentation]    Giving the wrong input to booking start-date
    [Tags]    [Req 4][Req 5]
    ${date1}=    Get Current Date     increment=-1d
    ${date2}=    Get Current Date     increment=3d 
    Open webpage
    Log into account    ${user1}    ${passw1}
    Select trip-dates    ${date1}    ${date2}

Wrong end-date input
    [Documentation]    Giving the wrong input to booking end-date
    [Tags]    [Req 4][Req 5]
    ${date1}=    Get Current Date     increment=1d
    ${date2}=    Get Current Date     increment=-3d
    Open webpage
    Log into account    ${user1}    ${passw1}
    Select trip-dates    ${date1}    ${date2}

Booking car using Gherkin-syntax
    [Documentation]    Full flow of booking a car using the Gherkin-syntax
    [Tags]    [VG_test][Req 7]
    Given User is logged in to car booking page
    When User selects booking dates and car-model
    And User inputs its credit card information
    Then Selected car is booked
