*** Settings ***
Library     SeleniumLibrary


*** Keywords ***
que o usuário está na página inicial do Xofigo
    Capture Page Screenshot
    
seleciona entrar como Admin
    Click Element    xpath=${Home.btnAdmin}
    Capture Page Screenshot
