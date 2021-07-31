*** Settings ***
Library     SeleniumLibrary


*** Keywords ***
que o usuário está na página de login
    Click Element     xpath=${Coupons.btnAreaRestrita}

preenche login e senha com credenciais válidas
    SeleniumLibrary.Input Text        username    ${USERNAME}
    Input Password    password    ${SENHA}
    Click Element     xpath=${Login.btnEntrar}

que o usuário está logado na área restrita
    Click Element     xpath=${Coupons.btnAreaRestrita}
    SeleniumLibrary.Input Text        username    ${USERNAME}
    Input Password    password    ${SENHA}
    Click Element     xpath=${Login.btnEntrar}

preencho o campo Usuário com "${USERNAME}"
    SeleniumLibrary.Input Text        username    ${USERNAME}
    Capture Page Screenshot

preencho o campo Senha com "${PASSWORD}"
    SeleniumLibrary.Input Password        password    ${PASSWORD}
    Capture Page Screenshot

clico no botão "Entrar"
    Click Element     xpath=${Login.btnEntrar}
    Capture Page Screenshot
    
o login não deve ser realizado com sucesso
    Element Should Be Visible    username

