*** Settings ***
Library     SeleniumLibrary


*** Keywords ***
estou em consultar Paciente
    LoginPage.efetuar Login
    Click                           ${ConsultaPaciente.DashPacientes}

preenche dados da pesquisa
    Input                           ${ConsultaPaciente.buscarPaciente}  ${NomePaciente}

realiza busca de paciente com sucesso
    Wait Until Element Is Visible  ${ConsultaPaciente.Paciente}


buscar paciente
    estou em buscar Paciente
    preenche dados da pesquisa
