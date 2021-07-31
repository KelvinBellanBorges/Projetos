*** Settings ***
Resource        ../Resources/Main.robot
# Resource        ../PageObjects/Avyda.robot
# Resource        ../Portal.Avyda/TestSuite/Portal_Avyda.robot
Test Setup      Abrir Navegador   Chrome
Test Teardown   Fechar Navegador
Suite Setup     Gerar Dados Fake

*** Variables ***


*** Test Case ***
CENÁRIO 01: clicar no botão conheça a solução >> Saiba Mais >> dar play no video
    [Documentation]     ..
    [Tags]              Avyda  cen01

    Dado     que acesso o Portal Avyda
    Quando   acesso a opção Conheça a Solução
    E        acesso a opção Saiba Mais
    Então    é possível iniciar o video de apresentação

CENÁRIO 02: clicar no botão conheça a solução >> Saiba Mais >> assistir mais tarde e efetuar login no email
    [Documentation]     ..
    [Tags]              Avyda  cen02

    Dado     que acesso o Portal Avyda
    Quando   acesso a opção Conheça a Solução
    E        acesso a opção Saiba Mais
    Então    é possível escolher a opção Assistir Mais Tarde

CENÁRIO 03: clicar no botão conheça a solução >> Saiba Mais >> compartilhar >> clicar no link
    [Documentation]     ..
    [Tags]              Avyda  cen03

    Dado     que acesso o Portal Avyda
    Quando   acesso a opção Conheça a Solução
    E        acesso a opção Saiba Mais
    Então    é possível escolher a opção compartilhar
    E        acessar o link para compartilhamento

CENÁRIO 04: clicar no botão conheça a solução >> Saiba Mais >> compartilhar >> clicar icone facebook
        [Documentation]     ..
        [Tags]              Avyda  cen04

    Dado     que acesso o Portal Avyda
    Quando   acesso a opção Conheça a Solução
    E        acesso a opção Saiba Mais
    Então    é possível escolher a opção compartilhar
    E        acessar o link para o facebook


CENÁRIO 05: clicar no botão conheça a solução >> Saiba Mais >> compartilhar >> clicar icone twitter
    [Documentation]     ..
    [Tags]              Avyda  cen05

    Dado     que acesso o Portal Avyda
    Quando   acesso a opção Conheça a Solução
    E        acesso a opção Saiba Mais
    Então    é possível escolher a opção compartilhar
    E        acessar o link para o twitter

CENÁRIO 06: clicar no botão conheça a solução >> Saiba Mais >> compartilhar >> clicar em mais
    [Documentation]     ..
    [Tags]              Avyda  cen06

    Dado     que acesso o Portal Avyda
    Quando   acesso a opção Conheça a Solução
    E        acesso a opção Saiba Mais
    Então    é possível escolher a opção compartilhar
    E        acessar o link para mais opções


CENÁRIO 07: Clicar em Assinaturas e visualizar o conteúdo
    [Documentation]     ..
    [Tags]              Avyda  cen07

    Dado     que acesso o Portal Avyda
    Quando   acesso a opção Assinaturas
    Então    é exibido planos e condições

CENÁRIO 08: Clicar em Quem somos >> Saiba Mais
    [Documentation]     ..
    [Tags]              Avyda  cen08

    Dado     que acesso o Portal Avyda
    Quando   acesso a opção Quem Somos
    E        acesso a opção Saiba Mais da Area Quem Somos
    Então    é exibido FAQ do portal

CENÁRIO 09: Clicar em corretor >> Saiba Mais >> validar o conteúdo
    [Documentation]     ..
    [Tags]              Avyda  cen09

    Dado     que acesso o Portal Avyda
    Quando   acesso a opção Corretor
    E        acesso a opçao saiba mais da area de corretores
    Então    é exibido tela de conteúdo para corretores

CENÁRIO 10: Clicar em corretor >> Saiba Mais >> Veja as Vantagens >> Validar conteúdo
    [Documentation]     ..
    [Tags]              Avyda  cen10

    Dado     que acesso o Portal Avyda
    Quando   acesso a opção Corretor
    E        acesso a opçao saiba mais da area de corretores
    E        acesso a opção Veja As Vantagens
    Então    é exibido tela de vantagens para corretores

CENÁRIO 11: Clicar em Acesso >> esqueci minha senha
    [Documentation]     ..
    [Tags]              Avyda  cen11  Avyda

    Dado     que acesso o Portal Avyda
    Quando   acessa a opção de Acesso
    E        acessa a opção Não tenho senha / Esqueci minha senha
    Então    é Exibido uma mensagem de senha enviada ao seu email ou telefone

CENÁRIO 12: Clicar em Acesso >> efetuar login >> orientação imediata 
    [Documentation]     ..
    [Tags]              Avyda  cen12  Avyda

    Dado     que acesso o Portal Avyda
    Quando   acessa a opção Acesso
    E        acessa a opção orientação imediata
    Então    é Exibido uma tela com informações de numeros para contato

CENÁRIO 13: Clicar em Acesso >> efetuar login >> Médico por video
    [Documentation]     ..
    [Tags]              Avyda  cen13  Avyda

    Dado     que acesso o Portal Avyda
    Quando   acessa a opção Acesso
    E        acessa a opção médico por video
    E        acessa a opção Solicitar chamada
    Então    é Exibido uma mensagem de sucesso

CENÁRIO 14: Clicar em Acesso >> marcar consulta >> preencher cadastros
    [Documentation]     ..
    [Tags]              Avyda  cen14  Avyda

    Dado     que acesso o Portal Avyda
    Quando   acessa a opção Acesso
    E        acessa a opção marcar consulta
    E        preenche as informações e solicita consulta
    E        escolhe data, horario e agenda a consulta
    E        marca opção li e concordo com as informações e solicita agendamento
    Então    é Exibido uma mensagem de Tudo Certo

CENÁRIO 15: Clicar em Acesso >> encontrar medicamentos
    [Documentation]     ..
    [Tags]              Avyda  cen15  Avyda

    Dado     que acesso o Portal Avyda
    Quando   acessa a opção Acesso
    E        acessa a opção encontrar medicamentos
    E        informa o medicamento para busca
    Então    é Exibido uma lista de apresentações do Medicamento buscado

CENÁRIO 16: Clicar em Acesso >> encontrar fármacia
   [Documentation]     ..
   [Tags]              Avyda  cen16  Avyda

   Dado     que acesso o Portal Avyda
   Quando   acessa a opção Acesso
   E        acessa a opção encontrar farmacia
   E        informa a região para pesquisar uma farmacia
   Então    é Exibido uma lista de farmacias com mapa disponivel

CENÁRIO 17: Clicar em Acesso >> urgência Odontolágica
     [Documentation]     ..
     [Tags]              Avyda  cen17  Avyda

     Dado     que acesso o Portal Avyda
     Quando   acessa a opção Acesso
     E        acessa a opção urgência odontológica
     Então    é Exibido uma tela com informações de numeros para contato de urgência

CENÁRIO 18: Clicar em Acesso >> marcar exame
     [Documentation]     ..
     [Tags]              Avyda  cen18  Avyda

     Dado     que acesso o Portal Avyda
     Quando   acessa a opção Acesso
     E        acessa a opção Marcar exame
     E        seleciona receita e escolhe local de exame
     Então    é Exibido uma mensagem de Solicitação recebida

CENÁRIO 19: direcionamento para tela de login usando o botão Consulta online no home page
     [Documentation]     ..
     [Tags]              Avyda  cen19  Avyda

     Dado     que acesso o Portal Avyda
     Quando   acessa a opção Consulte online na home page
     Então    é direcionado para as opções do portal

CENÁRIO 24: Botão saiba mais do psicólogos da home page >> validar conteúdo
    [Documentation]     ..
    [Tags]              Avyda  cen24
    Dado     que acesso o Portal Avyda
    Quando   acesso a opção Saiba Mais da Especialidade Psicólogos
    Então    é exibido tela de detalhes da Area de Psicólogos

CENÁRIO 25: Botão saiba mais do psicólogos da home page >> efetuar cadastro 
    [Documentation]     ..
    [Tags]              Avyda  cen25

    Dado     que acesso o Portal Avyda
    Quando   acesso a opção Saiba Mais da Especialidade Psicólogos
    E        cadastro dados válidos
    Então    é exibido mensagem de sucesso


CENÁRIO 26: Botão saiba mais do farmacêuticos da home page >> validar conteúdo
    [Documentation]     ..
    [Tags]              Avyda  cen26

    Dado     que acesso o Portal Avyda
    Quando   acesso a opção Saiba Mais da Especialidade Farmacêuticos
    Então    é exibido tela de detalhes da Area de Farmacêuticos

CENÁRIO 27: Botão saiba mais do farmacêuticos da home page >> efetuar cadastro 
    [Documentation]     ..
    [Tags]              Avyda  cen27

    Dado     que acesso o Portal Avyda
    Quando   acesso a opção Saiba Mais da Especialidade Farmacêuticos
    E        cadastro dados válidos
    Então    é exibido mensagem de sucesso


CENÁRIO 28: Botão saiba mais do nutricionista da home page >> validar conteúdo
    [Documentation]     ..
    [Tags]              Avyda  cen28

    Dado     que acesso o Portal Avyda
    Quando   acesso a opção Saiba Mais da Especialidade Nutricionistas
    Então    é exibido tela de detalhes da Area de Nutricionistas

CENÁRIO 29: Botão saiba mais do nutricionista da home page >> efetuar cadastro 

    [Documentation]     ..
    [Tags]              Avyda  cen29

    Dado     que acesso o Portal Avyda
    Quando   acesso a opção Saiba Mais da Especialidade Nutricionistas
    E        cadastro dados válidos
    Então    é exibido mensagem de sucesso


CENÁRIO 30: Botão saiba mais do assistência social da home page >> validar conteúdo
    [Documentation]     ..
    [Tags]              Avyda  cen30

    Dado     que acesso o Portal Avyda
    Quando   acesso a opção Saiba Mais da Especialidade Assistentes Sociais
    Então    é exibido tela de detalhes da Area de Assistentes Sociais

CENÁRIO 31: Botão saiba mais do assistência social da home page >> efetuar cadastro 
    [Documentation]     ..
    [Tags]              Avyda  cen31

    Dado     que acesso o Portal Avyda
    Quando   acesso a opção Saiba Mais da Especialidade Assistentes Sociais
    E        cadastro dados válidos
    Então    é exibido mensagem de sucesso


CENÁRIO 32: Botão saiba mais do educador físico da home page >> validar conteúdo
    [Documentation]     ..
    [Tags]              Avyda  cen32

    Dado     que acesso o Portal Avyda
    Quando   acesso a opção Saiba Mais da Especialidade Educadores Físicos
    Então    é exibido tela de detalhes da Area de Educadores Físicos

CENÁRIO 33: Botão saiba mais do educador físico da home page >> efetuar cadastro 
    [Documentation]     ..
    [Tags]              Avyda  cen33

    Dado     que acesso o Portal Avyda
    Quando   acesso a opção Saiba Mais da Especialidade Educadores Físicos
    E        cadastro dados válidos
    Então    é exibido mensagem de sucesso


CENÁRIO 34: Botão saiba mais Urgência odontológicas da home page
    [Documentation]     ..
    [Tags]              Avyda  cen34

    Dado     que acesso o Portal Avyda
    Quando   acesso a opção Saiba Mais da Area Urgências Odontológicas
    Então    é exibido tela Saiba Mais de Urgência Odontológica

CENÁRIO 35: Botão saiba mais laboratórios credenciados da home page
    [Documentation]     ..
    [Tags]              Avyda  cen35

    Dado     que acesso o Portal Avyda
    Quando   acesso a opção Saiba Mais da Area Clínicas Credenciadas
    Então    é exibido tela de Rede Credenciada

CENÁRIO 36: Botão saiba mais clínicas credenciadas da home page
    [Documentation]     ..
    [Tags]              Avyda  cen36

    Dado     que acesso o Portal Avyda
    Quando   acesso a opção Saiba Mais da Area Laboratórios Credenciados
    Então    é exibido tela de Rede Credenciada

CENÁRIO 37: Botão saiba mais medicamento grátis na palma da mão da home page
    [Documentation]     ..
    [Tags]              Avyda  cen37

    Dado     que acesso o Portal Avyda
    Quando   acesso a opção Saiba Mais da Área de Medicamentos Grátis
    Então    é exibido FAQ do portal

CENÁRIO 38: botão saiba mais sobre nós na home page
    [Documentation]     ..
    [Tags]              Avyda  cen38

    Dado     que acesso o Portal Avyda
    Quando   acesso a opção Saiba Mais Sobre Nós
    Então    é exibido tela Sobre Nós

CENÁRIO 39: botão saiba mais seja um parceiro home page
    [Documentation]     ..
    [Tags]              Avyda  cen39

    Dado     que acesso o Portal Avyda
    Quando   acesso a opção Saiba Mais da Area Seja Um Parceiro
    Então    é exibido tela de conteúdo para corretores

CENÁRIO 40: Preencher o cadastro na opção quero ter avyda e cadastrar
    [Documentation]     ..
    [Tags]              Avyda  cen40

    Dado     que acesso o Portal Avyda
    Quando   acesso a opção Quero ter Avyda
    E        cadastro dados válidos
    Então    é exibido mensagem de sucesso
