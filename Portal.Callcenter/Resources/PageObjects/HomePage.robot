*** Settings ***
Resource  ../Main.robot

*** Keywords ***
preenche novo cpf
    Click    ${cadastro.inpCPF}
    Input    ${cadastro.inpCPF}    ${PESSOA.cpf}

clica no botão pesquisar
    Click    ${cadastro.bntPesquisar}

entra na tela de cadastro
    Wait Until Element Is Visible    ${cadastro.txtBene}
    Capture Page Screenshot

que possua um novo CPF
    preenche novo cpf

preenche o cpf
    preenche novo cpf

pesquido por ele
    clica no botão pesquisar
    entra na tela de cadastro
    
deve ser retornado a mensagem "${MENSAGEM}"
    Wait Until Page Contains    ${MENSAGEM}
    
deve ser retornado a mensagem de erro "${MENSAGEM}"
    Wait Until Page Contains    ${MENSAGEM}

tendo avançar sem preecher os campos obrigatórios
    Click  ${cadastro.btnNext}
    Wait Until Element Is Not Visible    ${adesao.txtTresiba}

que possua um novo CPF inválido
    Input    ${cadastro.inpCPF}    44444444444

que possua um novo CPF de uma pessoa menor de idade
    Gerar Dados Fake  idade_max=17
    Input    ${cadastro.inpCPF}  ${PESSOA.cpf}
    Set Test Variable    ${MENOR_IDADE}  True