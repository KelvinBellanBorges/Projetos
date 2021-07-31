*** Settings ***
Library     SeleniumLibrary
 
*** Keywords ***
Acessar Perfil Paciente
    AcessarPerfilPaciente.acesso a minha area paciente
    AcessarPerfilPaciente.acesso a Area Restrita paciente

clico meu perfil verifico os dados do paciente
# Meu perfil
    Click Element                                   ${AcessarPerfilPaciente.meuPerfilPaciente}