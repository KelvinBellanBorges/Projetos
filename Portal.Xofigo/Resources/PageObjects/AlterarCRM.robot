*** Settings ***
Library     SeleniumLibrary
Library     String


*** Keywords ***
alterar CRM Geral
    LoginPage.efetuar Login
    Atualizar CRM filtrar médico
    Go To                                     ${URL}

filtrar médico
    Click                                     ${AlterarCRM.dashMedicos}
    Input Text                                ${AlterarCRM.inpBuscarMedico}        ${NomeMedico}

alterar CRM page
    Click Element                             ${AlterarCRM.btnAtualizardados}
    Input Text                                ${AlterarCRM.inpCrmMedico}              999991

Atualizar CRM filtrar médico
    ${Quantidade}                             Generate Random String               6    [NUMBERS]
    Set Test Variable                         ${Quantidade}
    ${NomeAleatorioMedico}                    Generate Random String               6    [LETTERS]
    Set Test Variable                         ${NomeAleatorioMedico}  
    filtrar médico                    
    Sleep  2
    Click Element                             //*[text()=' ${NomeMedico} '] 
    Sleep  2 
    Click Element                             ${AlterarCRM.btnAtualizardados}
    Input Text                                ${AlterarCRM.inpAlterarNomeMedico}      Medico Alatorio ${NomeAleatorioMedico}
    Input Text                                ${AlterarCRM.inpCrmMedico}              ${Quantidade}
    Click Element                             ${AlterarCRM.btnSalvarAlteraçao}
    Sleep  2
    Click Element                             ${AlterarCRM.btnAlteraçaoOK} 