
*** Settings ***
Documentation           Test L2 BGP Neighborship neibours Leaf 1 N9K3
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


Check BGP Neighbor to N9K1
    [Documentation]   Check l2vpn Neibourship with Spine 1 N9K1
    ${output}         Execute Command    show bgp l2vpn evpn summary 
    Should Contain    ${output}          100.100.100.1   4 65001

Check BGP  Neighbor to N9K2
    [Documentation]   Check l2vpn Neibourship with Spine N9K2
    ${output}         Execute Command    show bgp l2vpn evpn summary
    Should Contain    ${output}          100.100.100.1   4 65001
