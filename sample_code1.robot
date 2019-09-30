*** Settings ***
Suite Setup       Suite_setup
Suite Teardown    Suite_teardown
Library           SeleniumLibrary    WITH NAME    se
Library           OperatingSystem    WITH NAME    os
Library           SSHLibrary    WITH NAME    ssh
Library           String
Library           Collections

*** Test Cases ***
Basic_1
    [Tags]    exec
    [Setup]
    log    we are in the basic session
    hi
    #variables
    ${var1}    set variable    12
    log    ${var1}
    Comment    ${su_var}    set variable    "In the suite"
    Comment    log    ${su_var}
    log    ${su_var}
    #Strings
    ${string1}    set variable    "Hello wolrd"
    log    ${string1}
    ${string2}    convert to lowercase    ${string1}
    ${string3}    convert to uppercase    ${string2}
    log    ${string3}
    @{string3}    Split String To Characters    ${string2}
    log    ${string3}
    #Lists
    ${list1}    create list    45    2    3    4
    ${size_of_list}    get length    ${list1}
    log    ${size_of_list}
    log    ${list1}
    Append To List    ${list1}    5
    log    ${list1}
    ${val_form_list}    Get From List    ${list1}    0
    log    ${val_form_list}
    log list    ${list1}
    #Dicttionaries
    ${dict}    create dictionary    name=shankar    age=25
    log    ${dict}
    ${keys}    Get Dictionary Keys    ${dict}
    log    ${keys}
    ${vals}    Get Dictionary values    ${dict}
    log    ${vals}
    set to dictionary    ${dict}    dob=07/05/1992
    set to dictionary    ${dict}    dob=07/05/1992
    log dictionary    ${dict}
    #loop
    : FOR    ${i}    IN    @{list1}
    \    log    ${i}
    #if else condition    set variable    20
    ${var2}    set variable    20
    ${var1}    set variable    20
    runkeyword if    ${var1}==${var2}    log    pass
    ...    ELSE    FAIL
    [Teardown]

Test_case_SSHlibrary
    log    We are in the SSHLibrary test case
    ssh.login    server    spanidea
    ssh.write    ls
    ${op1}    ssh.read until prompt
    log    ${op1}
    ${op2}    ssh.execute command    pwd
    log    ${op2}
    ${op3}    ssh.execute command    ls -lrth
    log    ${op3}

*** Keywords ***
Suite_setup
    set suite variable    ${su_var}    Hello wolrd
    Comment    log    Hai Opening in the Browser using selenium
    #se.Open Browser    https://www.orangehrm.com/    Chrome
    log    Hai OPening the SSHConnection
    ssh.open connection    192.168.78.105    timeout=30sec    prompt=$

Suite_teardown
    log    Closing the web browswers used in selenium
    se.Close Browser
    log    closing all the SSH Connections
    ssh.close all connections

hi
    log    hai
