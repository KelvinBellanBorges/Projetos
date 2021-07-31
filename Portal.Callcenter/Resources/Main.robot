*** Settings ***
#######################################################
#               Libraries  #
#######################################################
Library         SeleniumLibrary  timeout=0:00:30
Library         OperatingSystem
Library         String
Library         Collections
Library         DebugLibrary
Library         FakerLibrary  locale=pt-BR
Library         DateTime
Library         ./Libs/temp_mail.py
#######################################################
#               Resources  #
#######################################################
Resource        ./BDDpt-BR.robot
Resource        ./Comum.robot
Resource        ./Locators.robot
Resource        ./Variables.robot
#######################################################
#               Page Objects  #
#######################################################
Resource        ./PageObjects/Geradores.robot
Resource        ./PageObjects/AdesaoPage.robot
Resource        ./PageObjects/CadastroPage.robot
Resource        ./PageObjects/HomePage.robot
Resource        ./PageObjects/RedeCredenciadaPage.robot
