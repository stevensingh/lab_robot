
*** Settings ***
Documentation           Test all ospf neibours Leaf 3 N9K5
library                 SSHLibrary
Suite Setup             Open Connection And Log In
Suite Teardown          Close All Connections

*** Variables ***
${HOST}                 n9k6
${USERNAME}             admin
${PASSWORD}             cisco



*** Keywords ***

Open Connection And Log In

  Open Connection      ${HOST}
  Login                ${USERNAME}          ${PASSWORD}

*** Test Cases ***


Check OSPF Neighbor to N9K1
    [Documentation]   Check OSPF neighbour to n9k1
    ${output}         Execute Command    show ip ospf neighbors 100.100.100.1
    Should Contain    ${output}          100.100.100.1     1 FULL/  Eth1/1

Check OSPF Neighbor to N9K2
    [Documentation]   Check OSPF neighbour to n9k2
    ${output}         Execute Command    show ip ospf neighbors 100.100.100.2
    Should Contain    ${output}          100.100.100.2     1 FULL/  Eth1/2
