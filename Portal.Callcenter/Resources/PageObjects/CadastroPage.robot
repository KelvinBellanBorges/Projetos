*** Settings ***
Resource          ../Main.robot

*** Keywords ***
preencho as informações pessoais
    [Arguments]    ${email}=${PESSOA.email}
    ...    ${celular}=${PESSOA.telefone}
    ...    ${dt_nascimento}=${PESSOA.nascimento}
    ...    ${mark_termos}=True
    ...    ${cep_validation}=False
    ...    ${all_invalid}=False
    IF    ${all_invalid}
        Input    ${cadastro.inpCelular}    419853379
        Input    ${cadastro.inpDtNascimento}    32/02/9000
        Select From List By Label    ${cadastro.inpSexo}    ${PESSOA.sexo}
        Input    ${cadastro.inpEmail}    ${PESSOA.cpf}@getnada
        Input    ${cadastro.inpCep}    81130
        Click Element    ${cadastro.ckbEmail}
        Click    ${cadastro.ckbTermo1}
        Click    ${cadastro.ckbTermo2}
        Click    ${cadastro.ckbTermo3}
    ELSE
        Input    ${cadastro.inpNome}    ${PESSOA.nome}
        Input    ${cadastro.inpCelular}    ${celular}
        Input    ${cadastro.inpDtNascimento}    ${dt_nascimento}
        Select From List By Label    ${cadastro.inpSexo}    ${PESSOA.sexo}
        Input    ${cadastro.inpEmail}    ${email}
        IF    ${cep_validation}
            Input    ${cadastro.inpCep}    81130260
            ${cidade}    wait load element text    ${cadastro.inpCidade}
            Click    ${cadastro.inpCep}
            Repeat Keyword    20 times    Press Keys    None    BACKSPACE
            Input    ${cadastro.inpCep}    01153000
            ${cidade_nova}    wait load element text    ${cadastro.inpCidade}    ${cidade}
            Should Not Be Equal    ${cidade}    ${cidade_nova}
        ELSE
            Input    ${cadastro.inpCep}    81130260
            wait load element text    ${cadastro.inpCidade}
        END
        Click Element    ${cadastro.ckbEmail}
        Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
        IF    ${MENOR_IDADE}
            Input    ${cadastro.inpNomeResponsavel}    ${PESSOA.mae}
            Input    ${cadastro.inpCpfResponsavel}    ${PESSOA.cpf_mae}
        END
        IF    ${mark_termos}
            IF    ${MENOR_IDADE}
                Click    ${cadastro.ckbTermo4}
            END
            Click    ${cadastro.ckbTermo1}
            Click    ${cadastro.ckbTermo2}
            Click    ${cadastro.ckbTermo3}
        END
    END
    Click    ${cadastro.btnNext}

preencho as informações pessoais com email inválido
    preencho as informações pessoais    email=${PESSOA.cpf}@getnada

preencho as informações pessoais com celular inválido
    preencho as informações pessoais    celular=419783399

preencho as informações pessoais com data de nascimento inválida
    preencho as informações pessoais    dt_nascimento=16/03/9000

preencho as informações pessoais sem marcas os termos
    preencho as informações pessoais    mark_termos=False

preencho as informações pessoais totalmete inválidas
    preencho as informações pessoais    all_invalid=True

preencho as informações pessoais verificando consulta de CEP
    preencho as informações pessoais    cep_validation=True

que possua um cpf cadastrado e com adesão a um medicamento
    que possua um novo CPF
    pesquido por ele
    preencho as informações pessoais
    realiaso a adesão do medicamento "Tresiba"
    finalizo o cadastro
    deve ser retornado a mensagem "Adesão realizada com sucesso!"

avanço para a listagem de medicamentos
    Click    ${cadastro.btnNext}
    Wait Until Element Is Visible    ${adesao.txtTresiba}

atualizo os dados
    Wait Until Element Is Visible    ${cadastro.btnEditar}
    ${celular}    Get Element Attribute    ${cadastro.inpCelular}    value
    Click    ${cadastro.inpCelular}
    Repeat Keyword    20 times    Press Keys    None    BACKSPACE
    Input    ${cadastro.inpCelular}    11996778899
    Set Test Variable    ${OLD_TELEFONE}    ${celular}

salvo a alteração dos dados
    Click    ${cadastro.btnEditar}
    Wait Until Page Contains    Deseja efetuar atualização do cadastro?
    Click    ${cadastro.btnSimEdicao}
    Wait Until Element Is Visible    ${LOADING}
    Wait Until Element Is Not Visible    ${LOADING}    90

cadastro deve ser alterado com sucesso
    Click    ${cadastro.btnVoltar}
    preenche o cpf
    pesquido por ele
    Wait Until Element Is Visible    ${cadastro.btnEditar}
    ${celular_new}    Get Element Attribute    ${cadastro.inpCelular}    value
    Should Not Be Equal    ${OLD_TELEFONE}    ${celular_new}
    Should Be Equal    ${celular_new}    (11)99677-8899

dever server exibido mensagens de aviso nos campos obrigatórios
    Wait Until Page Contains    Nome obrigatório
    Wait Until Page Contains    Número de celular obrigátorio
    Wait Until Page Contains    Data de nascimento obrigatória
    Wait Until Page Contains    Sexo obrigatório
    Wait Until Page Contains    E-mail obrigatório
    Wait Until Page Contains    Cep obrigatório
    Wait Until Page Contains    Aceite Obrigatório
