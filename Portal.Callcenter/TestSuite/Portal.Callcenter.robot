*** Settings ***
Resource        ../Resources/Main.robot
Test Setup      Abrir Navegador
Test Teardown   Fechar Navegador

*** Test Case ***
CENÁRIO 01: CPF Novo - Cadastro e Adesão com CPF Valido
    [Tags]              CALLCENTER

    Dado    que possua um novo CPF
    E       pesquido por ele
    E       preencho as informações pessoais
    E       realiaso a adesão do medicamento "Tresiba"
    Quando  finalizo o cadastro
    Então   deve ser retornado a mensagem "Adesão realizada com sucesso!"

CENÁRIO 02: CPF já Cadastrado - Adesão de Novos Medicamentos
    [Tags]              CALLCENTER

    Dado    que possua um cpf cadastrado e com adesão a um medicamento
    E       preenche o cpf
    E       pesquido por ele
    E       avanço para a listagem de medicamentos
    E       realiaso a adesão do medicamento "Victoza"
    Quando  finalizo o cadastro
    Então   deve ser retornado a mensagem "Adesão realizada com sucesso!"

CENÁRIO 03: CPF já Cadastrado - Atualização de Dados Pessoais
    [Tags]              CALLCENTER

    Dado    que possua um cpf cadastrado e com adesão a um medicamento
    E       preenche o cpf
    E       pesquido por ele
    Quando  atualizo os dados
    E       salvo a alteração dos dados
    Então   deve ser retornado a mensagem "Dados alterados com sucesso"
    E       cadastro deve ser alterado com sucesso

CENÁRIO 04: CPF Novo - Cadastrado sem preencher campos obrigatórios
    [Tags]              CALLCENTER

    Dado    que possua um novo CPF
    E       pesquido por ele
    Quando  tendo avançar sem preecher os campos obrigatórios
    Então   dever server exibido mensagens de aviso nos campos obrigatórios

CENÁRIO 05: CPF Novo - Cadastro com CPF Invalido
    [Tags]              CALLCENTER

    Dado    que possua um novo CPF inválido
    Quando  clica no botão pesquisar
    Então   deve ser retornado a mensagem de erro "Número de CPF inválido"

CENÁRIO 06: CPF Novo - Cadastro e Adesão de usuário menor de idade
    [Tags]              CALLCENTER

    Dado    que possua um novo CPF de uma pessoa menor de idade
    E       pesquido por ele
    E       preencho as informações pessoais
    E       realiaso a adesão do medicamento "Tresiba"
    Quando  finalizo o cadastro
    Então   deve ser retornado a mensagem "Adesão realizada com sucesso!"

CENÁRIO 07: CPF Novo - Cadastro com e-mail Invalido
    [Tags]              CALLCENTER

    Dado    que possua um novo CPF
    E       pesquido por ele
    Quando  preencho as informações pessoais com email inválido
    Então   deve ser retornado a mensagem de erro "E-mail inválido"

CENÁRIO 08: CPF Novo - Cadastro com celular invalido
    [Tags]              CALLCENTER

    Dado    que possua um novo CPF
    E       pesquido por ele
    Quando  preencho as informações pessoais com celular inválido
    Então   deve ser retornado a mensagem de erro "Número de celular inválido"

CENÁRIO 09: CPF Novo - Cadastro com Data de Nascimento Invalida
    [Tags]              CALLCENTER

    Dado    que possua um novo CPF
    E       pesquido por ele
    Quando  preencho as informações pessoais com data de nascimento inválida
    Então   deve ser retornado a mensagem de erro "Data de nascimento inválida"

CENÁRIO 10: CPF Novo - Cadastro sem preencher os termos obrigatórios.
    [Tags]              CALLCENTER

    Dado    que possua um novo CPF
    E       pesquido por ele
    Quando  preencho as informações pessoais sem marcas os termos
    Então   deve ser retornado a mensagem de erro "Aceite Obrigatório"

CENÁRIO 11: CPF Novo - Consulta de CEP Automático
    [Tags]              CALLCENTER

    Dado    que possua um novo CPF
    E       pesquido por ele
    Quando  preencho as informações pessoais verificando consulta de CEP
    E       realiaso a adesão do medicamento "Tresiba"
    E       finalizo o cadastro
    Então   deve ser retornado a mensagem "Adesão realizada com sucesso!"

CENÁRIO 12: Adesão com CRM Invalido
    [Tags]              CALLCENTER

    Dado    que possua um novo CPF
    E       pesquido por ele
    E       preencho as informações pessoais
    Quando  realiaso a adesão do medicamento "Tresiba" com CRM invalido
    Então   deve ser retornado a mensagem de erro "Para o CRM 0 e estado SP não foi encontrado nenhum registro válido"

CENÁRIO 13: Adesão com CRM não encontrado
    [Tags]              CALLCENTER

    Dado    que possua um novo CPF
    E       pesquido por ele
    E       preencho as informações pessoais
    Quando  realiaso a adesão do medicamento "Tresiba" para um CRM que não existe
    Então   deve ser retornado a mensagem de erro "Para o CRM 0 e estado SP não foi encontrado nenhum registro válido"

CENÁRIO 14: Consulta Rede Credenciada
    [Tags]              CALLCENTER

    Dado    esteja na área de Rede Credenciada
    E       seleciono o estado "SAO PAULO"
    E       seleciono a cidade "ADAMANTINA"
    Quando  seleciono o bairro "CENTRO"
    Então   deve ser retornado as unidades encontradas

CENÁRIO 15: Tentar realizar um cadastro informando muitos campos inválidos.
    [Tags]              CALLCENTER

    Dado    que possua um novo CPF
    E       pesquido por ele
    Quando  preencho as informações pessoais totalmete inválidas
    Então   deve ser retornado a mensagem de erro "Nome obrigatório"
    E       deve ser retornado a mensagem de erro "Número de celular inválido"
    E       deve ser retornado a mensagem de erro "E-mail inválido"
    E       deve ser retornado a mensagem de erro "Cep inválido"