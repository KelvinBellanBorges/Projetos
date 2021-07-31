*** Settings ***
Library     SeleniumLibrary

*** Keywords ***

# Cenario 11 : Acesso Minha Area Medico
acesso a minha area medico
    Click Element                         ${AreaRestritaMedicos.btnMedico}       
    
preencher os campos email e senha e clica em enviar
    Wait Until Element Is Visible         ${AreaRestritaMedicos.emailMedico}        
    Input Text                            ${AreaRestritaMedicos.emailMedico}        ejunior@epharma.com.br
    Input Text                            ${AreaRestritaMedicos.senhaMedico}        Mudei#66
    Click                                 ${AreaRestritaMedicos.btnentrarminhaareaMedico}
    
Consulta por todos os meus pacientes
       clico em "todos" meus pacientes                      
       clico em "Ativos" meus pacientes
       clico em "Inativos" meus pacientes

acesso a Area Restrita Medico
    Wait Until Element Is Visible   ${AreaRestritaMedicos.imgArearestritamsgSucesso}
    Wait Until Element Is Visible   ${AreaRestritaMedicos.imgMedicos}
  
clico em "todos" meus pacientes 
    Wait Until Element Is Visible   ${AreaRestritaMedicos.checkboxTodosPacientes}
    Click Element                   ${AreaRestritaMedicos.checkboxTodosPacientes}

clico em "Ativos" meus pacientes
    Wait Until Element Is Visible   ${AreaRestritaMedicos.checkboxPacientesAtivos}
    Click Element                   ${AreaRestritaMedicos.checkboxPacientesAtivos}

clico em "Inativos" meus pacientes
   Wait Until Element Is Visible    ${AreaRestritaMedicos.checkboxPacientesInativos}
   Click Element                    ${AreaRestritaMedicos.checkboxPacientesInativos}

Alteração de dados pessoais do Medico
# Meu perfil
    Click Element                   ${AreaRestritaMedicos.meuPerfilMedico}

# # #CENÁRIO 12: Alteração de dados pessoais do Medico
clico em "MEU PERFIL" 
    Wait Until Element Is Visible              xpath=${AreaRestritaMedicos.meuPerfilMedico}
    Click Element              xpath=${AreaRestritaMedicos.meuPerfilMedico}

clico em alterar e salvo
    Wait Until Element Is Visible              ${AreaRestritaMedicos.btnAlterar}
    Click Element              ${AreaRestritaMedicos.btnAlterar}

realiza a alteração com sucesso  
    Wait Until Element Is Visible              ${AreaRestritaMedicos.btnSalvarAlteracao}
    Click Element              ${AreaRestritaMedicos.btnSalvarAlteracao}
