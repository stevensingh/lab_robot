*** Settings ***
Documentation           Test all ospf neibours Leaf 1 N9K3
library                 SSHLibrary
Suite Setup             Open Connection And Log In
Suite Teardown          Close All Connections

*** Variables ***
${HOST}                 n9k5
${USERNAME}             admin
${PASSWORD}             cisco



*** Keywords ***

Open Connection And Log In

  Open Connection      ${HOST}
  Login                ${USERNAME}          ${PASSWORD}

*** Test Cases ***


Check Network Virtual interface to N9K3
    [Documentation]   Check NVE interface to n9k3
    ${output}         Execute Command    show nve peers peer-ip 100.100.100.3
    Should Contain    ${output}          nve1      100.100.100.3    Up

Check Network Virtual Interface to N9K4
    [Documentation]   Check NVE interface to n9k4
    ${output}         Execute Command    show nve peers peer-ip 100.100.100.4
    Should Contain    ${output}          nve1      100.100.100.4    Up
