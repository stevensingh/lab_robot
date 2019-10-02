*** Settings ***
Documentation           Test Loopback reachability
library                 SSHLibrary
Suite Setup             Open Connection And Log In
Suite Teardown          Close All Connections

*** Variables ***
${HOST}                 172.17.177.209
${USERNAME}             admin
${PASSWORD}             Cisco



*** Keywords ***

Open Connection And Log In

  Open Connection      ${HOST}
  Login                ${USERNAME}          ${PASSWORD}

*** Test Cases ***


Show version
    [Documentation]   show vesrion
    ${output}         Execute Command    show version 
    Should Contain    ${output}          version

Show run 
    [Documentation]   show run
    ${output}         Execute Command    run
    Should Contain    ${output}          64 bytes from 100.100.100.2

Show hardware
    [Documentation]   show hardware
    ${output}         Execute Command    show hardware
    Should Contain    ${output}          64 bytes from 100.100.100.1

Show interface status
    [Documentation]   show interface status
    ${output}         Execute Command    show interface status
    Should Contain    ${output}          64 bytes from 100.100.100.2

Show interface transceiver
    [Documentation]   show interface transciever
    ${output}         Execute Command    show interface transceiver
    Should Contain    ${output}          64 bytes from 100.100.100.1

Show cdp neighbors detail
    [Documentation]   cdp neighbors
    ${output}         Execute Command    show cdp neighbors detail
    Should Contain    ${output}          64 bytes from 100.100.100.2

Show ip ospf interface
    [Documentation]   
    ${output}         Execute Command    show ip ospf interface
    Should Contain    ${output}          64 bytes from 100.100.100.1

Show ip ospf neigbor detail
    [Documentation]   sho ip ospf neighbor
    ${output}         Execute Command    show ip ospf neighbor detail
    Should Contain    ${output}          64 bytes from 100.100.100.2

Show bgp summay all
    [Documentation]   show bgp summary all
    ${output}         Execute Command    
    Should Contain    ${output}          64 bytes from 100.100.100.1

Show nve vni summary
    [Documentation]   show nve vni summary
    ${output}         Execute Command    show nve vni summary
    Should Contain    ${output}          64 bytes from 100.100.100.2

Show vxlan interface
    [Documentation]   show vxlan interface
    ${output}         Execute Command    show vxlan interface 
    Should Contain    ${output}          64 bytes from 100.100.100.1

Show l2route topology
    [Documentation]   show l2route topology
    ${output}         Execute Command    show l2route topology
    Should Contain    ${output}          64 bytes from 100.100.100.2

Show interface transceiver
    [Documentation]   show interface transceiver
    ${output}         Execute Command    show interface transceiver
    Should Contain    ${output}          64 bytes from 100.100.100.1

