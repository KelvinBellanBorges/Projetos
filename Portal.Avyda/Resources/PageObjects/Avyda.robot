*** Settings ***
Library     SeleniumLibrary

*** Variables ***

# Input                                    ${}
# Click
# Capture Page Screenshot
# Input                                    ${Beneficiario.txtCPF}                                    ${cpfNovo}


*** Keywords ***


que acesso o Portal Avyda
    Wait Until Element Is Visible  ${avyda.btnConheca}

acesso a opção Conheça a Solução
    Click  ${avyda.btnConheca}

acesso a opção Saiba Mais
    # Sleep  60s
    Click  ${avyda.btnSaibaMaisConheca}

é possível iniciar o video de apresentação
    Select Frame  ${avyda.iframeVideo}
    Click  ${avyda.btnReproduzir}
    Unselect Frame
    Capture Page Screenshot

é possível escolher a opção Assistir Mais Tarde
    Select Frame  ${avyda.iframeVideo}
    Click  ${avyda.btnAssitirMaisTarde}
    Unselect Frame
    ${names}    Get Window Names
    Log  ${names}
    Should Contain  ${names}  loginPopup 

é possível escolher a opção compartilhar
    Select Frame  ${avyda.iframeVideo}
    Click  ${avyda.btnCompartilhar}

acessar o link para compartilhamento
    Click  ${avyda.lnkYouTube}
    Unselect Frame
    Capture Page Screenshot
   
acessar o link para o facebook
    Click  ${avyda.btnFacebook}
    Unselect Frame
    ${names}    Get Window Titles
    Log  ${names}
    Should Contain  ${names}  Facebook 

acessar o link para o twitter
    Click  ${avyda.btnTwitter}
    FOR  ${i}  IN RANGE  0  10
        ${names}    Get Window Titles
        ${status}  Run Keyword And Return Status    Should Contain  ${names}  Publicar um novo Tweet / Twitter
        Exit For Loop If    ${status}
        Sleep    2s  Aguardando tela carregar.
    END
    Unselect Frame
    Log  ${names}
    Should Contain  ${names}  Publicar um novo Tweet / Twitter 

acessar o link para mais opções
    Click  ${avyda.btnMais}
    Unselect Frame
    ${names}    Get Window Titles
    Log  ${names}
    Should Contain  ${names}  20 Anos Transformando Vidas - YouTube

acesso a opção Assinaturas
    # Sleep  60s
    Click  ${avyda.menuAssinaturas}  #id=plansAndConditions

é exibido planos e condições
    Wait Until Element Is Visible  ${avyda.lblPlanosCondicoes}

acesso a opção Quem Somos
    Click    ${avyda.menuQuemSomos}

acesso a opção Saiba Mais da Area Quem Somos
    Click    ${avyda.btnSaibaMaisConheca}

é exibido FAQ do portal
    Wait Until Element Is Visible  ${avyda.iframeVideo}

acesso a opção Corretor
    Click  ${avyda.menuCorretor}

acesso a opçao saiba mais da area de corretores
    Click    ${avyda.btnSaibaMaisCorretores}

é exibido tela de conteúdo para corretores
    ${url}=   Get Location
    Should Contain  ${url}  http://avydahomo.epharma.br/broker
    
acesso a opção Veja As Vantagens
    Click    ${avyda.btnVantagensCorretor}

é exibido tela de vantagens para corretores
    ${url}=   Get Location
    Should Contain  ${url}  http://avydahomo.epharma.br/broker#oneProduct



acesso a opção Saiba Mais da Especialidade Psicólogos
    Click   ${avyda.btnSaibaPsicologos}
    

é exibido tela de detalhes da Area de Psicólogos
    ${url}=   Get Location
    Should Contain  ${url}  http://avydahomo.epharma.br/areas#psychologists
  

cadastro dados válidos
    Input                        ${avyda.inpNome}   jose lucena
    Input                        ${avyda.inpEmail}  teste@gmail.com
    Execute JavaScript   window.scrollTo(0, document.body.scrollHeight)
    Wait Until Element Is Visible    ${avyda.inpTelefone}
    Run Keyword And Ignore Error  Scroll Element Into View    xpath=//button[text()='FALE CONOSCO']
    FOR  ${i}  IN RANGE  0  10
        ${status}  Run Keyword And Return Status    Press Keys  xpath=${avyda.inpTelefone}   HOME+61523698741+TAB
        Exit For Loop If    ${status}
        Sleep  3
        Execute JavaScript   window.scrollTo(0, document.body.scrollHeight)
        Run Keyword And Ignore Error  Scroll Element Into View    xpath=//button[text()='FALE CONOSCO']
    END
    FOR  ${i}  IN RANGE  0  4
        ${txt}  Get Text  ${avyda.inpTelefone}
        IF  len($txt) == 0
            Run Keyword And Ignore Error  Press Keys  xpath=${avyda.inpTelefone}   HOME+615236987411+TAB
            Sleep  2
        ELSE
            Exit For Loop
        END
    END
    Click                        ${avyda.btnCadastrar}   
  


é exibido mensagem de sucesso
    Wait Until Element Is Visible  ${avyda.msgSucessoCadastro}  
    Click   ${avyda.btnOK}

acesso a opção Saiba Mais da Especialidade Farmacêuticos
    Click   ${avyda.btnSaibaFarmaceuticos}
    


é exibido tela de detalhes da Area de Farmacêuticos
    ${url}=   Get Location
    Should Contain  ${url}  http://avydahomo.epharma.br/areas#pharmaceuticals
    


acesso a opção Saiba Mais da Especialidade Nutricionistas
    Click   ${avyda.btnSaibaNutricionistas}
    


é exibido tela de detalhes da Area de Nutricionistas
    ${url}=   Get Location
    Should Contain  ${url}  http://avydahomo.epharma.br/areas#nutritionists
    

acesso a opção Saiba Mais da Especialidade Assistentes Sociais
    Click   ${avyda.btnSaibaAssistentesSociais}
    

é exibido tela de detalhes da Area de Assistentes Sociais   
    ${url}=   Get Location
    Should Contain  ${url}  http://avydahomo.epharma.br/areas#socialWorkers


acesso a opção Saiba Mais da Especialidade Educadores Físicos
    Click   ${avyda.btnSaibaEducadores}


é exibido tela de detalhes da Area de Educadores Físicos
    ${url}=   Get Location
    Should Contain  ${url}  http://avydahomo.epharma.br/areas#physicalEducators


acesso a opção Saiba Mais da Area Urgências Odontológicas
    Click   ${avyda.btnSaibaUrgencias}


é exibido tela Saiba Mais de Urgência Odontológica
    ${url}=   Get Location
    Should Contain  ${url}  http://avydahomo.epharma.br/dentistry

acesso a opção Saiba Mais da Area Clínicas Credenciadas
    Click   ${avyda.btnSaibaClinicas}


é exibido tela de Rede Credenciada
    ${url}=   Get Location
    Should Contain  ${url}  http://avydahomo.epharma.br/#contact

acesso a opção Saiba Mais da Area Laboratórios Credenciados
    Click   ${avyda.btnSaibaLabotaorios}


acesso a opção Saiba Mais da Área de Medicamentos Grátis
    Click   ${avyda.btnSaibaMedGratis}


acesso a opção Saiba Mais Sobre Nós
    Click   ${avyda.btnSaibaNos}


é exibido tela Sobre Nós
    ${url}=   Get Location
    Should Contain  ${url}  http://avydahomo.epharma.br/#whoWeAre


acesso a opção Saiba Mais da Area Seja Um Parceiro
    Click   ${avyda.btnSaibaMaisCorretores}

acesso a opção Quero ter Avyda
    Click   ${avyda.lblQueroTerAvyda}

##Ações da parte de acesso.
acessa a opção de Acesso
    Go To  http://acessohomo.avyda.com.br/entrar

acessa a opção Acesso
    Go To  http://acessohomo.avyda.com.br/entrar
    Input    ${acesso.inpCpf}    265.135.990-40
    Input    ${acesso.inpSenha}    qdbrgn
    Click    ${acesso.btnEntre}
   
acessa a opção orientação imediata
    Click    ${acesso.btnOrientacao}

é Exibido uma tela com informações de numeros para contato
    Wait Until Element Is Visible  ${acesso.lblSeuNumero}
    Element Should Be Visible  ${acesso.lblSeuNumero}        
    
acessa a opção médico por video    
    Click    ${acesso.btnMedico}

acessa a opção Solicitar chamada  
    Wait Until Element Is Visible  ${acesso.lblDicas}  
    Click    ${acesso.btnSolicitarChamada}

é Exibido uma mensagem de sucesso
    Wait Until Element Is Visible  ${acesso.msgSucesso} 
    Element Should Be Visible  ${acesso.msgSucesso}

acessa a opção Não tenho senha / Esqueci minha senha
    Click    ${acesso.btnNaoTenhoSenha}
    Wait Until Element Is Visible  ${acesso.lblRecuperacaoSenha}
    Input    ${acesso.inpFoneSenha}    11912123422
    Click    ${acesso.btnEnviar}

é Exibido uma mensagem de senha enviada ao seu email ou telefone    
    Wait Until Element Is Visible  ${acesso.msgSucessoS}  45
    Element Should Be Visible  ${acesso.msgSucessoS}

acessa a opção marcar consulta
    Click    ${acesso.btnConsulta}

acessa a opção encontrar medicamentos
    Click    ${acesso.btnMedicamentos}

informa o medicamento para busca
    Input    ${acesso.inpMedicamentos}    AAS
    Click    ${acesso.btnBuscarM}

é Exibido uma lista de apresentações do Medicamento buscado
    Wait Until Element Is Visible  ${acesso.msgApresentacao} 
    Element Should Be Visible  ${acesso.msgApresentacao}

acessa a opção encontrar farmacia
    Click    ${acesso.btnFarmacia}

informa a região de pesquisa
    Wait Until Element Is Visible  ${acesso.msgEncontre}
    Click    ${acesso.btnEstado}

acessa a opção urgência odontológica
    Click    ${acesso.btnUrgencia}

é Exibido uma tela com informações de numeros para contato de urgência
    Wait Until Element Is Visible  ${acesso.lblUrgenciaOdonto}
    Element Should Be Visible  ${acesso.lblUrgenciaOdonto}

preenche as informações e solicita consulta
    
    Click   ${acesso.cmbComboEspecialidade}
    Input   ${acesso.cmbComboEspecialidade}  Cardi
    Press Keys  None  RETURN  
    Input    id:localityInput    São Paulo SP
    Sleep  2s
    Press Keys  None  \ue015 
    Press Keys  None  RETURN
    Sleep  2s
    Wait Until Element Is Visible  ${acesso.btnSolicitarConsulta}
    Click    ${acesso.btnSolicitarConsulta}
    

escolhe data, horario e agenda a consulta
    Wait Until Element Is Visible  ${acesso.btnDataHora}
    Sleep  2s
    Click    ${acesso.btnDataHora}
    Scroll Element Into View  ${acesso.btnAgendarC}
    Click    ${acesso.btnAgendarC}

marca opção li e concordo com as informações e solicita agendamento
    Wait Until Element Is Visible  ${acesso.chkLieConcordo}
    Click    ${acesso.chkLieConcordo} 
    Wait Until Element Is Visible  ${acesso.btnSolicitaAgendamento}
    Click    ${acesso.btnSolicitaAgendamento}

é Exibido uma mensagem de Tudo Certo
    Wait Until Element Is Visible  ${acesso.msgTudoCerto} 
    Element Should Be Visible  ${acesso.msgTudoCerto}

informa a região para pesquisar uma farmacia
    Wait Until Element Is Visible  ${acesso.cmbEstadoFarmacia}
    Click    ${acesso.cmbEstadoFarmacia}
    Press Keys  None  Sao 
    Press Keys  None  RETURN
    Wait Until Element Is Visible  ${acesso.cmbCidadeFarmacia}
    Click    ${acesso.cmbCidadeFarmacia}
    Press Keys  None  Sao Pa 
    Press Keys  None  RETURN
    Wait Until Element Is Visible  ${acesso.cmbBairroFarmacia}
    Click    ${acesso.cmbBairroFarmacia}
    Press Keys  None  Centro 
    Press Keys  None  RETURN
    Wait Until Element Is Visible  ${acesso.btnBuscarFarm}
    Click    ${acesso.btnBuscarFarm}
    Wait Until Element Is Visible  ${acesso.btnMapa}
    Sleep  2s
    Click    ${acesso.btnMapa}
    Sleep  2s
    Click    ${acesso.btnLista}

acessa a opção Marcar exame
    Click    ${acesso.btnExame}

é Exibido uma lista de farmacias com mapa disponivel
    Wait Until Element Is Visible  ${acesso.lblDrogaria}
    Element Should Be Visible  ${acesso.lblDrogaria}

seleciona receita e escolhe local de exame
    Wait Until Element Is Enabled  ${acesso.inpImagemReceita}
    # Click    ${acesso.inpImagemReceita}
    Choose File  id:imgInp  ${EXECDIR}${/}Portal.Avyda${/}Data${/}Teste.jpg
    Scroll Element Into View  ${acesso.btnEnviarImagem}
    Click    ${acesso.btnEnviarImagem}
        
é Exibido uma mensagem de Solicitação recebida
    Wait Until Element Is Visible  ${acesso.msgSolicitacaoRecebida}
    Element Should Be Visible  ${acesso.msgSolicitacaoRecebida}
    # Execute JavaScript window.scrollTo(0, document.body.scrollHeight)

acessa a opção Consulte online na home page
    Run Keyword and Ignore Error  Scroll Element Into View  ${acesso.btnConsultaonline}
    # Click    ${acesso.btnConsultaonline}

é direcionado para as opções do portal
    acessa a opção Acesso