*** Settings ***
#   Este arquivo contém as funcionalidades comuns entre as suítes dos testes
Resource    ./BDDpt-BR.robot
Resource    ./Comum.robot
Resource    ./Locators.robot
Resource    ./ConfigServer.robot

Resource    ./PageObjects/HomePage.robot
Resource    ./PageObjects/LoginPage.robot
Resource    ./PageObjects/RegisterPage.robot
Resource    ./PageObjects/Coupons.robot

Library     ./libs/utilities.py
