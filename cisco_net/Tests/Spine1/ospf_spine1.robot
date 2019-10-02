
*** Settings ***
Documentation           Test all ospf neibours Spine 1
library                 SSHLibrary
Suite Setup             Open Connection And Log In
Suite Teardown          Close All Connections

*** Variables ***
${HOST}                 n9k1
${USERNAME}             admin
${PASSWORD}             cisco



*** Keywords ***

Open Connection And Log In

  Open Connection      ${HOST}
  Login                ${USERNAME}          ${PASSWORD}

*** Test Cases ***


Check OSPF Neighbor to N9K3
    [Documentation]   Check OSPF neighbour to n9k3
    ${output}         Execute Command    show ip ospf neighbors 100.100.100.3
    Should Contain    ${output}          100.100.100.3     1 FULL/  Eth1/1

Check OSPF Neighbor to N9K4
    [Documentation]   Check OSPF neighbour to n9k4
    ${output}         Execute Command    show ip ospf neighbors 100.100.100.4
    Should Contain    ${output}          100.100.100.4     1 FULL/  Eth1/2

Check OSPF Neighbor to N9K5
    [Documentation]   Check OSPF neighbour to n9k5
    ${output}         Execute Command    show ip ospf neighbors 100.100.100.5
    Should Contain    ${output}          100.100.100.5     1 FULL/  Eth1/3

Check OSPF Neighbor to N9K6
    [Documentation]   Check OSPF neighbour to n9k6
    ${output}         Execute Command    show ip ospf neighbors 100.100.100.6
    Should Contain    ${output}          100.100.100.6     1 FULL/  Eth1/4

Check OSPF Neighbor to N9K7
    [Documentation]   Check OSPF neighbour to n9k6
    ${output}         Execute Command    show ip ospf neighbors 100.100.100.7
    Should Contain    ${output}          100.100.100.6     1 FULL/  Eth1/5
