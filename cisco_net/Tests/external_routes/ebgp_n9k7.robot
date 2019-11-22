*** Settings ***
Documentation           External BGP routes from external router
library                 SSHLibrary
Suite Setup             Open Connection And Log In
Suite Teardown          Close All Connections

*** Variables ***
${HOST}                 n9k7
${USERNAME}             admin
${PASSWORD}             cisco



*** Keywords ***

Open Connection And Log In

  Open Connection      ${HOST}
  Login                ${USERNAME}          ${PASSWORD}

*** Test Cases ***

Check BGP routes being recived to see if the contain
    [Documentation]   Check Features
    ${output}         Execute Command    show  ip route vrf Tenant-1
    Should Contain    ${output}          11.0.0.0/24, ubest/mbest: 1/0
    Should Contain    ${output}          12.0.0.0/24, ubest/mbest: 1/0
