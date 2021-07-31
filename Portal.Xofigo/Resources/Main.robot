*** Settings ***
#   Este arquivo contém as funcionalidades comuns entre as suítes dos testes
Resource    ./BDDpt-BR.robot
Resource    ./Comum.robot
Resource    ./Locators.robot
Resource    ./Variables.robot

Resource    ./PageObjects/HomePage.robot
Resource    ./PageObjects/LoginPage.robot
Resource    ./PageObjects/RelatorioPage.robot
Resource    ./PageObjects/NovoMedicoPage.robot
Resource    ./PageObjects/NovoPacientePage.robot
Resource    ./PageObjects/ConsultarPaciente.robot
Resource    ./PageObjects/ConsultarMedico.robot
Resource    ./PageObjects/NovoAdminPage.robot
Resource    ./PageObjects/QueroMeCadastrarPaciente.robot
Resource    ./PageObjects/QueroMeCadastrarMedico.robot
Resource    ./PageObjects/AlterarCRM.robot
Resource    ./PageObjects/NovoCentroMedicinaNuclear.robot
Resource    ./PageObjects/AreaRestritaMedicos.robot
Resource    ./PageObjects/AcessarPerfilPaciente.robot
Resource    ./PageObjects/MeuPerfilPaciente.robot
Resource    ./PageObjects/EsqueciAlterarPaciente.robot
Resource    ./PageObjects/CancerProstataPaciente.robot
Resource    ./PageObjects/MateriaisPrograma.robot


# Resource    ./Database/Oracle/oracledb.robot
# Resource    ./Database/SQLServer/sqlserver.robot