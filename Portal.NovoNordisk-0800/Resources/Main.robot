*** Settings ***
#   Este arquivo contém as funcionalidades comuns entre as suítes dos testes
Resource    ./BDDpt-BR.robot
Resource    ./Comum.robot
Resource    ./Locators.robot
Resource    ./ConfigServer.robot
Resource    ./Variables.robot

Resource    ./PageObjects/DadosPessoais.robot
Resource    ./PageObjects/PageHome.robot
Resource    ./PageObjects/TermosAceite.robot
Resource    ./PageObjects/DetalhesMedicamentos.robot
Resource    ./PageObjects/BuscaRede.robot
