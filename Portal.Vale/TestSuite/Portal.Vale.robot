*** Settings ***
Resource        ../Resources/Main.robot
Test Setup      Abrir Navegador   Chrome
Test Teardown   Fechar Navegador
Suite Setup     Gerar Dados Fake

*** Variables ***

*** Test Case ***
CENÁRIO 01: Login
    [Documentation]     ..
    [Tags]              cen01  Vale

    Dado     que acesso o Portal Vale
    Quando   Informo os dados válidos para acesso
    Então    é exibido menu principal do portal

CENÁRIO 02: Realizar um novo pedido
    [Documentation]     ..
    [Tags]              cen02  Vale

    Dado     que usuário acessou menu principal do portal
    Quando   acessa o menu de Novo Pedido
    E        informa o produto correspondente ao pedido
    E        informa os dados do prescritor
    E        informa os dados de entrega
    E        valida os dados inseridos na tela de finalização e confirma o pedido
    Então    deverá ser exibido tela de sucesso

CENÁRIO 03: Realizar um novo pedido com mais de um item
    [Documentation]     ..
    [Tags]              cen03  Vale

    Dado     que usuário acessou menu principal do portal
    Quando   acessa o menu de Novo Pedido
    E        informa o produto correspondente ao pedido em maior quantidade
    E        informa os dados do prescritor
    E        informa os dados de entrega
    E        valida os dados inseridos na tela de finalização e confirma o pedido
    Então    deverá ser exibido tela de sucesso

CENÁRIO 04: Realizar um novo pedido com itens diferentes
        [Documentation]     ..
        [Tags]              cen04  Vale

    Dado     que usuário acessou menu principal do portal
    Quando   acessa o menu de Novo Pedido
    E        informa produto diferentes correspondentes ao pedido
    E        informa os dados do prescritor
    E        informa os dados de entrega
    E        valida os dados inseridos na tela de finalização e confirma o pedido
    Então    deverá ser exibido tela de sucesso


CENÁRIO 05: Acompanhar pedido em análise
    [Documentation]     ..
    [Tags]              cen05  Vale

    Dado     que usuário acessou menu principal do portal
    Quando   acessa o menu de Acompanhamento de Pedido
    E        seleciona pedido com status "Em Análise"
    Então    é destacado status "Em Análise" na área de acompanhamento de pedido

CENÁRIO 06: Acompanhar pedido aprovado
    [Documentation]     ..
    [Tags]              cen06  Vale

    Dado     que usuário acessou menu principal do portal
    Quando   acessa o menu de Acompanhamento de Pedido
    E        seleciona pedido com status "Aprovado"
    Então    é destacado status "Aprovado" na área de acompanhamento de pedido


CENÁRIO 07: Acompanhar pedido não aprovado - Cancelado App
    [Documentation]     ..
    [Tags]              cen07  Vale

    Dado     que usuário acessou menu principal do portal
    Quando   acessa o menu de Acompanhamento de Pedido
    E        seleciona pedido com status "Pedido Cancelado App"
    Então    é destacado status "Cancelamento" na área de acompanhamento de pedido

CENÁRIO 08: Realizar uma sugestão de medicamento
    [Documentation]     ..
    [Tags]              cen08  Vale

    Dado     que usuário acessou menu principal do portal
    Quando   acessa o menu de Sugestão de Medicamento
    E        acessa o menu Nova Sugestão
    Então    inclui um produto listado na lista de produtos sugeridos
    E        envia a sugestão
    E        recebe mensagem de confirmação do envio

CENÁRIO 09: Realizar uma sugestão de um medicamento não listado
    [Documentation]     ..
    [Tags]              cen09  Vale

    Dado     que usuário acessou menu principal do portal
    Quando   acessa o menu de Sugestão de Medicamento
    E        acessa o menu Nova Sugestão
    Então    inclui um produto não listado na lista de produtos sugeridos
    E        envia a sugestão
    E        recebe mensagem de confirmação do envio

CENÁRIO 10: Realizar uma sugestão com mais de um medicamento
    [Documentation]     ..
    [Tags]              cen10  Vale

    Dado     que usuário acessou menu principal do portal
    Quando   acessa o menu de Sugestão de Medicamento
    E        acessa o menu Nova Sugestão
    Então    inclui produtos listados na lista de produtos sugeridos
    E        envia a sugestão
    E        recebe mensagem de confirmação do envio

CENÁRIO 11: Acompanhar sugestão de medicamento Aprovada
    [Documentation]     ..
    [Tags]              cen11  Vale

    Dado     que usuário acessou menu principal do portal
    Quando   acessa o menu de Sugestão de Medicamento
    E        acessa o menu Acompanhamento de Sugestão
    E        seleciona o pedido com status "Aprovada"
    Então    é destacado status "Aprovada" na área de acompanhamento da sugestão

CENÁRIO 12: Acompanhar sugestão de medicamento Recusada
    [Documentation]     ..
    [Tags]              cen12  Vale

    Dado     que usuário acessou menu principal do portal
    Quando   acessa o menu de Sugestão de Medicamento
    E        acessa o menu Acompanhamento de Sugestão
    E        seleciona o pedido com status "Recusada"
    Então    é destacado status "Recusada" na área de acompanhamento da sugestão

CENÁRIO 13: Acompanhar sugestão de medicamento Enviada
    [Documentation]     ..
    [Tags]              cen13  Vale

    Dado     que usuário acessou menu principal do portal
    Quando   acessa o menu de Sugestão de Medicamento
    E        acessa o menu Acompanhamento de Sugestão
    E        seleciona o pedido com status "Enviada"
    Então    é destacado status "Enviada" na área de acompanhamento da sugestão

CENÁRIO 14: Acompanhar sugestão de medicamento Em Analise
    [Documentation]     ..
    [Tags]              cen14  Vale

    Dado     que usuário acessou menu principal do portal
    Quando   acessa o menu de Sugestão de Medicamento
    E        acessa o menu Acompanhamento de Sugestão
    E        seleciona o pedido com status "Em Análise"
    Então    é destacado status "Em análise" na área de acompanhamento da sugestão

CENÁRIO 15: Login Negativo
    [Documentation]     ..
    [Tags]              cen15  Vale

    Dado     que acesso o Portal Vale
    Quando   Informo os dados inválidos para acesso
    Então    é exibido tela de alerta

CENÁRIO 16: Realizar uma sugestão de medicamento negativo
    [Documentation]     ..
    [Tags]              cen16  Vale

    Dado     que usuário acessou menu principal do portal
    Quando   acessa o menu de Sugestão de Medicamento
    E        acessa o menu Nova Sugestão
    E        envia a sugestão
    E        recebe mensagem de erro no envio da Sugestão