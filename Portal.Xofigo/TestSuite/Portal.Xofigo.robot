*** Settings ***
Resource        ../Resources/Main.robot
Test Setup      Abrir Navegador
Test Teardown   Fechar Navegador

*** Test Case ***
CENÁRIO 01: Login
    [Documentation]     Este teste valida o login do Admin com sucesso
    [Tags]              Desenvolvimento

    Dado    que o usuário está na página inicial do Xofigo
    Quando  seleciona entrar como Admin
    E       preenche e-mail e senha
    E       clica no botão entrar
    Então   realiza login com sucesso


CENÁRIO 02: Gerar Relatório
    [Documentation]     Este teste valida baixar relatório
    [Tags]

    Dado    que o usuário está logado com perfil Admin
    Quando  clica na opção relatório
    E       realiza pesquisa
    E       clica no botão "Baixar Excel"
    Então   gera relatório com sucesso

CENÁRIO 03: Cadastrar Novo Médico
    [Documentation]     Este teste valida o cadastro do médico
    [Tags]
    Quando  clico no Novo Médico
    E       preenche os dados do médico e clica em enviar
    Então   realiza cadastro do médico com sucesso

CENÁRIO 04: Cadastrar Novo Paciente
    [Documentation]     Este teste valida o cadastro do paciente
    [Tags]

    Quando   clico no Novo Paciente
    E        preenche os dados do paciente e clica em enviar
    Então    realiza cadastro do paciente com sucesso


CENÁRIO 05: Consultar Paciente
    [Documentation]     Este teste valida a consulta do paciente
    [Tags]

    Quando   estou em consultar Paciente
    E        preenche dados da pesquisa
    Então    realiza busca de paciente com sucesso


CENÁRIO 06: Consultar Médico
    [Documentation]     Este teste valida a consultar do médico
    [Tags]

    Quando   estou em consultar Médico
    E        preenche dados da pesquisa do médico
    Então    realiza busca de médico com sucesso

CENÁRIO 07: Cadastro Novo Admin
    [Documentation]     Este teste valida Novo Admin
    [Tags]

    Quando   clico no Novo Admin
    E        preenche os dados do admin e clica em enviar
    Então    realiza cadastro do admin com sucesso

CENÁRIO 08: Quero me cadastrar Paciente
    [Documentation]     Este teste cadastra um novo paciente
    [Tags]

    Quando   clico em quero me cadastrar paciente home
    E        preencher os dados do quero me cadastrar paciente e clica em enviar
    Então    realiza cadastro em quero me cadastrar paciente com sucesso

CENÁRIO 09: Quero me cadastrar Médico
    [Documentation]     Este teste cadastra um novo médico
    [Tags]

    Quando   clico em quero me cadastrar medico home
    E        preencher os dados do quero me cadastrar medico e clica em enviar
    Então    realiza cadastro em quero me cadastrar medico com sucesso

CENÁRIO 10: Novo Centro de Medicina Nuclear Admin
    [Documentation]     Este teste cria Novo Centro de Medicina Nuclear Admin
    [Tags]
    
    Dado     que esteja na area restrita para admin
    Então    o botão "Novo centro de medicina nuclear" estar habilitado

CENARIO 11: Acesso Minha Area Medico Restrita
    [Documentation]     Este teste acessa Minha Area Medico
    [Tags]
    Dado     acesso a minha area medico
    Quando   preencher os campos email e senha e clica em enviar
    E        Consulta por todos os meus pacientes
    E        Alteração de dados pessoais do Medico
    Então    acesso a Area Restrita Medico 


CENÁRIO 12: Alteração de dados pessoais do Medico
    [Documentation]     Este teste altera os dados do medico
    [Tags]
    Dado     acesso a minha area medico
    Quando   preencher os campos email e senha e clica em enviar
    E        clico em "MEU PERFIL" 
    E        clico em alterar e salvo
    Então    realiza a alteração com sucesso 

CENARIO 13: Acessar cancer de prostata do paciente
    [Documentation]     Este teste Acessa cancer de prostata do paciente
    [Tags]
    Dado      Acessar Perfil Paciente cp 
    Então     clico em cancer de prostata 

CENARIO 14: Acessar materiais de programa do paciente
    [Documentation]     Este teste Acessa materiais de programa do paciente
    [Tags]
    Dado       fazer login paciente MD
    Então      abre a tela verifica campos e fazer os Downloads

CENARIO 15: Acessar Paciente Meu perfil do paciente
    [Documentation]     Este teste Acessar Paciente Meu perfil do paciente
    [Tags]
    Dado      Acessar Perfil Paciente
    Então     clico meu perfil verifico os dados do paciente


CENARIO 16: Acessar Esqueci ou Alterar minha senha do paciente
    [Documentation]     Este teste Acessar Esqueci ou Alterar minha senha do paciente
    [Tags]
    Dado     clico em esqueci minha senha
    Quando   preencho o email cadastrado 
    Então    email será enviado com sucesso

CENARIO 17: Admin - Upload de documentos
    
    Dado     que esteja na area restrita para admin
    Então    o botão "Upload de documentos" estar habilitado