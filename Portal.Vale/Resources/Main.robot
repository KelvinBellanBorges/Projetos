*** Settings ***
#   Este arquivo contém as funcionalidades comuns entre as suítes dos testes
Resource    ./BDDpt-BR.robot
Resource    ./Comum.robot
Resource    ./Locators.robot
Resource    ./ConfigServer.robot
Resource    ./Variables.robot

Resource    ./PageObjects/NovoPedido.robot
Resource    ./PageObjects/AcompanhamentoPedido.robot
Resource    ./PageObjects/Common.robot
Resource    ./PageObjects/Medicamentos.robot
Resource    ./PageObjects/Negativos.robot

