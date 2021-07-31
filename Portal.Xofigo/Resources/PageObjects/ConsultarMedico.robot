*** Settings ***
Library     SeleniumLibrary


*** Keywords ***
estou em consultar Médico
    LoginPage.efetuar Login
    Click                           ${ConsultaMedico.DashMedicos}

preenche dados da pesquisa do médico
    Input                           ${ConsultaMedico.buscarMedico}  ${NomeMedico}

realiza busca de médico com sucesso
    Wait Until Element Is Visible  ${ConsultaMedico.Medico}
