*** Settings ***
Library     SeleniumLibrary


*** Keywords ***
preenche e-mail e senha
    Input Text    ${Login.inpEmail}   ${USER_NAME}
    Input Text    ${Login.inpSenha}    ${PWD}

clica no botão entrar
    Click Element    ${Login.btnEntrar}

realiza login com sucesso
    Wait Until Element Is Visible    ${Login.btnInfo}
    Capture Page Screenshot

efetuar Login
    HomePage.seleciona entrar como Admin
    preenche e-mail e senha
    clica no botão entrar
