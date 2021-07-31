*** Settings ***
Resource        ../Resources/Main.robot

Suite Setup     Configurar Ambiente
Test Setup      Abrir Navegador   Chrome
Test Teardown   Fechar Navegador

*** Test Case ***
CENÁRIO 01: Validar CPF já cadastrado sem informar cupom
    [Documentation]     Este teste valida se é exibida a mensagem de falha caso o CPF já tenha sido validado anteriormente
    ...                 e o usuário faça uma nova tentativa de validação sem a utilização de cupom.
    [Tags]              cen01  Homologação  Qualidade  Supera
    
    Dado    que o usuário está na página de validação de cupom
    Quando  seleciona "Não" no combobox "Possui cupom?"
    E       preenche o campo CPF com "552.534.668-00"
    E       preenche o campo CRM com "10203"
    E       seleciona "AM" no combobox "UF"
    E       marca o checkbox "Declaro que li e aceito os termos de consentimento"
    E       clica no botão "OK"
    Então   a label do botão "OK" muda para "Realizando cadastro"

CENÁRIO 02: Login na área restrita com credenciais válidas
    [Documentation]     Login com credenciais válidas
    [Tags]              cen02  Homologação  Qualidade  Supera

    Dado    que o usuário está na página de login
    Quando  preenche login e senha com credenciais válidas
    Então   é possível acessar a área restrita com sucesso

CENÁRIO 03: Login na área restrita com credenciais inválidas
    [Documentation]     Valida a tentativa de login com credenciais inválidas
    [Tags]              cen03  Homologação  Qualidade  Supera

    Dado    que o usuário está na página de login
    Quando  preencho o campo Usuário com "xxx"
    E       preencho o campo Senha com "${SENHA}"
    E       clico no botão "Entrar"
    Então   o login não deve ser realizado com sucesso
    E       será exibido a mensagem de erro "Falha na autenticação!"
    E       será exibido a mensagem de erro "Informação não encontrada"
    
CENÁRIO 04: Buscar farmácias participantes
    [Documentation]     Valida a busca de farmácias na rede.
    [Tags]              cen04  Homologação  Qualidade  Supera

    Dado    que o usuário está logado na área restrita
    E       esteja na area para consulta de farmácias
    Quando  informo o Estado "SAO PAULO" - "SP"
    E       informo o Município "SAO PAULO"
    E       informo o Bairro "BELA VISTA"
    E       clico em "Buscar"
    Então   será exibido a mensagem "Veja as farmácias próximas a você:"
    E       uma unidade sera encontrada

CENÁRIO 05: Gerar cupons
    [Documentation]     Valida a criação de cupons pelo sistema.
    [Tags]              cen05  Homologação  Qualidade  Supera

    Dado    que o usuário está logado na área restrita
    Quando  escolho o número distrital "101200"
    E       informo a quantia de "10" Cupon(s)
    E       clico em "Gerar Cupons"
    Então   será exibido a mensagem "Cupons gerados com sucesso!"
    E       será exibido a mensagem "Excelente, seus cupons já foram gerados e exportados via excel para seu gerenciamento."
    E       deve ser realizado o download automatico do excell com os cupons
    E       o arquivo deve conter a quantia de cupons gerados.

CENÁRIO 06: Validar cupom gerado
    [Documentation]     Valida o cupom gerado pelo sistema.
    [Tags]              cen06  Homologação  Qualidade  Supera

    Dado    que possua um código de Cupom
    E       que o usuário está na página de validação de cupom
    Quando  seleciona "Sim" no combobox "Possui cupom?"
    E       preenche o campo CPF com "random_cpf"
    E       preenche o campo Cupom com "${CUPOM}"
    E       preenche o campo CRM com "10203"
    E       seleciona "AM" no combobox "UF"
    E       marca o checkbox "Declaro que li e aceito os termos de consentimento"
    Então   clica no botão "OK"
    E       será exibido a mensagem "Cupom validado com sucesso!"
    E       será exibido a mensagem "busque a farmácia participante"
    E       será exibido a mensagem "mais próxima a você e boas compras :)"

CENÁRIO 07: Validar CPF já cadastrado com cupom válido
    [Documentation]     Valida que não é possível cadastrar um cupom já cadastrado
    [Tags]              cen07  Homologação  Qualidade  Supera

    Dado    que possua um código de Cupom
    E       que o usuário está na página de validação de cupom
    Quando  seleciona "Sim" no combobox "Possui cupom?"
    E       preenche o campo CPF com "552.534.668-00"
    E       preenche o campo Cupom com "${CUPOM}"
    E       preenche o campo CRM com "10203"
    E       seleciona "AM" no combobox "UF"
    E       marca o checkbox "Declaro que li e aceito os termos de consentimento"
    Então   clica no botão "OK"
    E       será exibido a mensagem de erro "Falha na validação de cupom"
    E       será exibido a mensagem de erro "Seu cupom já foi validado"
    
CENÁRIO 08: Validar cupom já cadastrado com CPF válido
    [Documentation]     Valida cupom já cadastrado ao informar um CPF válido.
    [Tags]              cen08  Homologação  Qualidade  Supera

    Dado    que possua um código de Cupom
    E       que o usuário está na página de validação de cupom
    Quando  seleciona "Sim" no combobox "Possui cupom?"
    E       preenche o campo CPF com "random_cpf"
    E       preenche o campo Cupom com "${CUPOM}"
    E       preenche o campo CRM com "10203"
    E       seleciona "AM" no combobox "UF"
    E       marca o checkbox "Declaro que li e aceito os termos de consentimento"
    Então   clica no botão "OK"
    E       será exibido a mensagem "Cupom validado com sucesso!"
    E       será exibido a mensagem "busque a farmácia participante"
    E       será exibido a mensagem "mais próxima a você e boas compras :)"

CENÁRIO 09: Validar cupom já cadastrado com CPF já cadastrado
    [Documentation]     Valida cupom já cadastrado ao informar um CPF válido.
    [Tags]              cen09  Homologação  Qualidade  Supera

    Dado    que o usuário está na página de validação de cupom
    Quando  seleciona "Sim" no combobox "Possui cupom?"
    E       preenche o campo CPF com "552.534.668-00"
    E       preenche o campo Cupom com "1012002BP6KYU"
    E       preenche o campo CRM com "10203"
    E       seleciona "AM" no combobox "UF"
    E       marca o checkbox "Declaro que li e aceito os termos de consentimento"
    Então   clica no botão "OK"
    E       será exibido a mensagem de erro "Falha na validação de cupom"
    E       será exibido a mensagem de erro "Seu cupom já foi validado"

CENÁRIO 10: Configurações de Regras: ativar posse de cupom
    [Documentation]     Valida se é possível ativar o combobox de posse de cupom
    [Tags]              cen10  Homologação  Qualidade  Supera

    Dado    que o usuário está logado na área restrita
    Quando  ativo a posse do cupom
    Então   é possível visualizar o combobox "Possui cupom?" na tela de validação

CENÁRIO 11: Configurações de Regras: desativar posse de cupom
    [Documentation]     Valida se é possível desativar o combobox de posse de cupom
    [Tags]              cen11  Homologação  Qualidade  Supera

    Dado    que o usuário está logado na área restrita
    Quando  desativo a posse do cupom
    Então   não é possível visualizar o combobox "Possui cupom?" na tela de validação

CENÁRIO 12: Configurações de Regras: ativar benefício
    [Documentation]     Valida se é possível ativar o benefício
    [Tags]              cen12  Homologação  Qualidade  Supera

    Dado    que o usuário está logado na área restrita
    Quando  verifico se o benefício está ativado
    Então   acesso a tela de validação de cupom e visualizo os campos de validação

CENÁRIO 13: Configurações de Regras: desativar benefício
    [Documentation]     Valida se é possível desativar o benefício
    [Tags]              cen13  Homologação  Qualidade  Supera

    Dado    que o usuário está logado na área restrita
    Quando  verifico se o benefício está desativado
    Então   acesso a tela de validação de cupom e visualizo a mensagem "O programa está suspenso temporariamente e será reativado em breve."
