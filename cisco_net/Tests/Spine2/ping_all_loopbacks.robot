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


Check Loopback Reachability to N9K3 Leaf1
    [Documentation]   ping  Leaf1 loopback0 n9k3
    ${output}         Execute Command    ping 100.100.100.3
    Should Contain    ${output}          64 bytes from 100.100.100.3

Check Loopback Reachability to N9K4 Leaf2
    [Documentation]   Ping Leaf2 Loopback0 n9k4
    ${output}         Execute Command    ping 100.100.100.4
    Should Contain    ${output}          64 bytes from 100.100.100.4

Check Loopback Reachability to N9K5 Leaf3
    [Documentation]   Ping Leaf3 Loopback0 n9k5
    ${output}         Execute Command    ping 100.100.100.5
    Should Contain    ${output}          64 bytes from 100.100.100.5

Check Loopback Reachability to N9K6 Leaf4
    [Documentation]   Ping Leaf4 Loopback0 n9k6
    ${output}         Execute Command    ping 100.100.100.6
    Should Contain    ${output}          64 bytes from 100.100.100.6

Check Loopback Reachability to N9K7 Leaf5
    [Documentation]   Ping Leaf5 Loopback0 n9k7
    ${output}         Execute Command    ping 100.100.100.7
    Should Contain    ${output}          64 bytes from 100.100.100.7
