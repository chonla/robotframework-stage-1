# Robot Framework - Stage 1

## Check-in

* [Stage 1-0 : เตรียมความพร้อม](1-0/README.md)

## Foundation

* [Stage 1-1 : Test Structure](1-1/README.md)
* [Stage 1-2 : Variables](1-2/README.md)

## Web testing

* [Stage 1-3 : Web testing](1-3/README.md)

## Practices

* [Stage 1-4 : Better keywords](1-4/README.md)
* [Stage 1-5 : Good test cases](1-5/README.md)

## Nice to know

* [Stage 1-6 : Data driven](1-6/README.md)
* [Stage 1-7 : Tags](1-7/README.md)

## A little bit more

* [Stage 1-8 : Headless](1-8/README.md)
* [Stage 1-9 : Configurable execution](1-9/README.md)
* [Stage 1-10 : Custom libraries](1-10/README.md)
* [Stage 1-11 : RESTful API testing](1-11/README.md)
* [Stage 1-12 : Parallel execution](1-12/README.md)

## Test site

* https://robot-stage-1.firebaseapp.com


## Example
-------

Below is a simple example test case for testing login to some system.
You can find more examples with links to related demo projects from
http://robotframework.org.


    *** Settings ***
    Library           DatabaseLibrary

    *** Variables ***
    ${DB_HOST}        127.0.0.1
    ${DB_PORT}        3306
    ${DB_NAME}        DBTEST
    ${DB_USER}        robot
    ${DB_PWD}         robotframework

    *** Keywords ***
    Verify transaction admin session timeout 30 min
        Connect to Database     pymssql    ${DB_NAME}    ${DB_USER}    ${DB_PWD}    ${DB_HOST}    ${DB_PORT}
        Execute Sql String      insert into ADMIN_TOKEN_SECRET (Login_Name, Secret, Create_Dtm) values ('robot', 'ROBOT_UUID', DATEADD(mi,-125,GETDATE()))
        Disconnect from Database
