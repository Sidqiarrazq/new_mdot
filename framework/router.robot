*** Settings ***
Library            SeleniumLibrary
Library            OperatingSystem
Library            String

## Setting Config
Resource            config.robot
Resource            base.robot

## Data
Resource            ../properties/data.robot

## Page Objects
Resource            ../page/LoginPage.robot
Resource            ../page/HomePage.robot
Resource            ../page/OtpPage.robot