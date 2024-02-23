*** Settings ***
Documentation    A testsuite for the Lab 2, testing the Infotiv Car Rental services webpage.
Library    SeleniumLibrary
Resource    Resources.robot
*** Test Cases ***
Infotiv car rental services
    [Documentation]    Testing the navigational flow of booking a car
    [Tags]    [Req 1]
    
    Open webpage
    Log into account
    Select trip-dates
    Choose car and press book
    Confirm booking
    Check booking details

Cancel a booking
    [Documentation]     Removing a booked car from 'My page'
    [Tags]
    Open webpage
    Log into account
    Cancel a car