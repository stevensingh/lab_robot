*** Settings ***
Documentation           Test Tenant1 Hosts
library                 SSHLibrary
Suite Setup             Open Connection And Log In
Suite Teardown          Close All Connections

*** Variables ***
${HOST}                 centos4
${USERNAME}             root
${PASSWORD}             redhat



*** Keywords ***

Open Connection And Log In

  Open Connection      ${HOST}
  Login                ${USERNAME}          ${PASSWORD}

*** Test Cases ***


Check Centos1 Reachability
    [Documentation]   ping Centos1
    ${output}         Execute Command    ping -c 10 10.0.11.11
    Should Contain    ${output}          64 bytes from 10.0.11.11

Check Centos2 Reachability
    [Documentation]   ping Centos2
    ${output}         Execute Command    ping -c 10 10.0.11.12
    Should Contain    ${output}          64 bytes from 10.0.11.12

Check Centos3 Reachability
    [Documentation]   ping Centos3
    ${output}         Execute Command    ping -c 10 10.0.11.13
    Should Contain    ${output}          64 bytes from 10.0.11.13

Check Centos4 Reachability
    [Documentation]   ping Centos4
    ${output}         Execute Command    ping -c 10 10.0.11.14
    Should Contain    ${output}          64 bytes from 10.0.11.14

Check Centos5 Reachability
    [Documentation]   ping Centos4
    ${output}         Execute Command    ping -c 10 10.0.11.15
    Should Contain    ${output}          64 bytes from 10.0.11.15




