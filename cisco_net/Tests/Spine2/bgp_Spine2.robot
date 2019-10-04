
*** Settings ***
Documentation           Test L2 BGP Neighborship neibours Leaf 1 N9K3
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


Check BGP Neighbor to N9K3
    [Documentation]   Check l2vpn Neibourship with Leaf1 N9K3
    ${output}         Execute Command    show bgp l2vpn evpn summary 
    Should Contain    ${output}          100.100.100.3   4 65001

Check BGP  Neighbor to N9K4
    [Documentation]   Check l2vpn Neibourship with Leaf2 N9K4
    ${output}         Execute Command    show bgp l2vpn evpn summary
    Should Contain    ${output}          100.100.100.4   4 65001

Check BGP Neighbor to N9K5
    [Documentation]   Check l2vpn Neibourship with Leaf3 N9K5
    ${output}         Execute Command    show bgp l2vpn evpn summary
    Should Contain    ${output}          100.100.100.5   4 65001

Check BGP  Neighbor to N9K6
    [Documentation]   Check l2vpn Neibourship with Leaf4 N9K6
    ${output}         Execute Command    show bgp l2vpn evpn summary
    Should Contain    ${output}          100.100.100.6  4 65001

Check BGP Neighbor to N9K7
    [Documentation]   Check l2vpn Neibourship with Leaf5 N9K7
    ${output}         Execute Command    show bgp l2vpn evpn summary
    Should Contain    ${output}          100.100.100.7   4 65001

