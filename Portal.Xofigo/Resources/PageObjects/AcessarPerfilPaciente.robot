*** Settings ***
Library     SeleniumLibrary
 
*** Keywords ***
 
acesso a minha area paciente 
    Click Element                                   ${AcessarPerfilPaciente.btnPaciente}       
    Wait Until Element Is Visible                   ${AcessarPerfilPaciente.emailPaciente}        
    Input Text                                      ${AcessarPerfilPaciente.emailPaciente}        ${EmailPaciente}
    Input Text                                      ${AcessarPerfilPaciente.senhaPaciente}        ${PWD}
    Click                                           ${AcessarPerfilPaciente.btnentrarminhaareaPaciente}
 
acesso a Area Restrita paciente
    Wait Until Element Is Visible                   ${AcessarPerfilPaciente.imgArearestritamsgSucesso}
    Wait Until Element Is Visible                   ${AcessarPerfilPaciente.imgPaciente}  


