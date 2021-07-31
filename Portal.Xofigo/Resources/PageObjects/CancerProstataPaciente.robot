*** Settings ***
Library     SeleniumLibrary
 
*** Keywords ***
Acessar Perfil Paciente cp
    AcessarPerfilPaciente.acesso a minha area paciente
    AcessarPerfilPaciente.acesso a Area Restrita paciente

clico em cancer de prostata
    Click Element                                   ${AcessarPerfilPaciente.btnCancerdeProstata}