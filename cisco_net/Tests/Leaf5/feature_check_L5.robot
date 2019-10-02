*** Settings ***
Documentation           Test all ospf neibours Leaf 1 N9K3
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


Check Leaf4 Feature Set
    [Documentation]   Check Features
    ${output}         Execute Command    show feature
    Should Contain    ${output}          bgp                    1          enabled
    Should Contain    ${output}          bash-shell             1          enabled
    Should Contain    ${output}          nxapi                  1          enabled
    Should Contain    ${output}          hmm                    1          enabled
    Should Contain    ${output}          interface-vlan         1          enabled
    Should Contain    ${output}          nve                    1          enabled
    Should Contain    ${output}          ospf                   1          enabled
    Should Contain    ${output}          pim                    1          enabled
    Should Contain    ${output}          scpServer              1          enabled
    Should Contain    ${output}          sshServer              1          enabled
    Should Contain    ${output}          vnseg_vlan             1          enabled


