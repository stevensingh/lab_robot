*** Settings ***
Documentation           Test all ospf neibours Leaf 1 N9K3
library                 SSHLibrary
Suite Setup             Open Connection And Log In
Suite Teardown          Close All Connections

*** Variables ***
${HOST}                 n9k3
${USERNAME}             admin
${PASSWORD}             cisco



*** Keywords ***

Open Connection And Log In

  Open Connection      ${HOST}
  Login                ${USERNAME}          ${PASSWORD}

*** Test Cases ***


Check OSPF Neighbor to N9K1
    [Documentation]   Check NVE interface to nk94
    ${output}         Execute Command    show nve peers peer-ip 100.100.100.4
    Should Contain    ${output}          nve1      100.100.100.4    Up

Check OSPF Neighbor to N9K2
    [Documentation]   Check NVE interface to n9k5
    ${output}         Execute Command    show nve peers peer-ip 100.100.100.5
    Should Contain    ${output}          nve1      100.100.100.5    Up
