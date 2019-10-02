*** Settings ***
Documentation           Test Loopback reachability
library                 SSHLibrary
Suite Setup             Open Connection And Log In
Suite Teardown          Close All Connections

*** Variables ***
${HOST}                 n9k2
${USERNAME}             admin
${PASSWORD}             cisco



*** Keywords ***

Open Connection And Log In

  Open Connection      ${HOST}
  Login                ${USERNAME}          ${PASSWORD}

*** Test Cases ***


Check Loopback Reachability to N9K1
    [Documentation]   ping Spine 1 loopback N9k1
    ${output}         Execute Command    ping 100.100.100.1
    Should Contain    ${output}          64 bytes from 100.100.100.1

Check Loopback Reachability to N9K2
    [Documentation]   Check OSPF neighbour to n9k2
    ${output}         Execute Command    ping 100.100.100.2
    Should Contain    ${output}          64 bytes from 100.100.100.2
