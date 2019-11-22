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

Check Leaf1 Feature Set
    [Documentation]   Check Features
    ${output}         Execute Command    show  ip route vrf Tenant-1
    Should Contain    ${output}          11.0.0.0/24, ubest/mbest: 1/0
    Should Contain    ${output}          *via 10.10.1.1, [20/0], bgp-65001, external, tag 65003
    Should Contain    ${output}          12.0.0.0/24, ubest/mbest: 1/0
    Should Contain    ${output}          *via 10.10.1.1, [20/0], bgp-65001, external, tag 65003
