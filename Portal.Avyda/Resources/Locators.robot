*** Settings ***

*** Variable ***
# Veja abaixo o padrão de nomenclatura dos locators de acordo com o tipo
# de elemento que está sendo referenciado. Crie um dicionário com o nome da Page
# em seguida, a variável deverá iniciar com o prefixo correspondente ao elemento,
# seguido de um label que ajude a identificar o componente:

# | Elemento     | Prefixo | Exemplo        |
# | combobox     | cmb     | cmbPossuiCupom |
# | checkbox     | chk     | chkTermos      |
# | radio button | rdb     | rdbPlano       |
# | text input   | inp     | inpCPF         |
# | message      | msg     | msgFalha       |
# | botao        | btn     | btnOrientacao  |
# | Label        | lbl     | lblNome        |

# Vamos manter todos os objetos no mesmo dicionário pois até este ponto da automação o portal é um html único que navega automaticamente a partir das escolhar do usuário.
&{avyda}
...    lblCorretores=id:BePartner
...    lblPlanosCondicoes=id:plansAndConditions
...    iframeVideo=//iframe[@title='Video']
...    btnConheca=//*[text()='CONHEÇA A SOLUÇÃO']
...    btnSaibaMaisConheca=//a[text()='SAIBA MAIS'][@href='/FAQ'][contains(@class,'kdIUoj')]
...    btnAssitirMaisTarde=//button[@title='Assistir mais tarde']
...    btnCompartilhar=//button[@aria-label='Compartilhar']
...    btnReproduzir=//button[@aria-label='Reproduzir']
...    lnkYouTube=//a[@title='Compartilhar link']
...    btnTwitter=//a[@title='Twitter']
...    btnFacebook=//a[@title='Facebook']
...    btnMais=//a[@title='Mais']
...    menuAssinaturas=//a[text()='Assinaturas'][@href='/#plansAndConditions']
...    menuQuemSomos=//a[text()='Quem Somos'][@href='/#whoWeAre']
...    menuCorretor=//a[text()='Corretor'][@href='/#BePartner']
...    btnSaibaMaisCorretores=//*[text()='SAIBA MAIS']/../..//a[@href='/broker']
...    btnVantagensCorretor=//a[text()='VEJA AS VANTAGENS'][@href='#oneProduct']
...    btnSaibaPsicologos=//a[text()='SAIBA MAIS'][@href='/areas#psychologists']
...    btnSaibaFarmaceuticos=//a[text()='SAIBA MAIS'][@href='/areas#pharmaceuticals']
...    btnSaibaNutricionistas=//a[text()='SAIBA MAIS'][@href='/areas#nutritionists']
...    btnSaibaAssistentesSociais=//a[text()='SAIBA MAIS'][@href='/areas#socialWorkers']
...    btnSaibaEducadores=//a[text()='SAIBA MAIS'][@href='/areas#physicalEducators']
...    inpNome=//input[@placeholder='Nome']
...    inpEmail=//input[@placeholder='E-mail']
...    inpTelefone=//input[@placeholder='Telefone']
...    btnCadastrar=//button[@type='submit']
...    msgSucessoCadastro=//*[text()='Envio dos dados realizados com sucesso']
...    btnOK=//*[text()='OK'][@type='button']
...    btnSaibaUrgencias=//a[text()='SAIBA MAIS'][@href='/dentistry']
...    btnSaibaLabotaorios=//img[@alt='Laboratórios']/..//a[text()='SAIBA MAIS'][@href='#contact']
...    btnSaibaClinicas=//img[@alt='Clínincas']/..//a[text()='SAIBA MAIS'][@href='#contact']
...    btnSaibaMedGratis=//a[text()='SAIBA MAIS'][@href='/FAQ'][contains(@class,'gKysdl')]
...    btnSaibaNos=//a[text()='SAIBA MAIS SOBRE NÓS']
...    lblQueroTerAvyda=//*[text()='QUERO TER ']

&{acesso}
...    btnOrientacao=//p[text()="Orientação "]
...    btnMedico=//p[text()="Médico "]
...    btnConsulta=//p[text()=" Consulta"]
...    btnMedicamentos=//p[text()=" Medicamentos"]
...    btnFarmacia=//p[text()=" Farmácia"]
...    btnUrgencia=//p[text()="Urgência "]
...    btnExame=//p[text()=" exame"]
...    inpCpf=id:cpf
...    inpSenha=id:password
...    btnEntre=//button[text()="Entre"]
...    lblSeuNumero=//h2[text()="Seu número Avyda é"]
...    msgSucesso=//div[contains(text(),'Sucesso!')]
...    btnSolicitarChamada=//button[text()="Solicitar chamada"]
...    lblDicas=//h2[text()="Dicas importantes"]
...    btnNaoTenhoSenha=//span[text()="Não tenho senha / Esqueci minha senha"]
...    lblRecuperacaoSenha=//h3[text()=" Recuperação de senha"]
...    inpFoneSenha=id:uid
...    btnEnviar=//span[text()=" Enviar"]
...    msgSucessoS=//div[contains(text(),'Sucesso !')]
...    inpMedicamentos=id:filter
...    btnBuscarM=//button[text()="Buscar"]
...    msgApresentacao=//h3[text()="Apresentação"]
...    msgEncontre=//h1[text()="Encontre a farmácia mais próxima de você"]
...    btnEstado=//option[text()="Escolha um estado"]
...    cmbSP=//option[text()="Sao Paulo"]
...    lblUrgenciaOdonto=//h1[text()="Aqui você resolve sua urgência odontológica"]
...    cmbComboEspecialidade=//input[@role="combobox"]
...    btnSolicitarConsulta=//a[text()="SOLICITAR CONSULTA"]
...    btnDataHora=(//span[@title='Selecionar Dia'])[1]
...    btnAgendarC=//button[text()="Agendar"]
...    chkLieConcordo=//strong[text()=' Li e concordo com as informações acima']
...    btnSolicitaAgendamento=//button[text()="Solicitar agendamento"]
...    msgTudoCerto=//div[text()="Tudo certo"]
...    msgEstad=//span[text()="1. Estado"]
...    cmbEstadoFarmacia=//span[text()='1. Estado']/../select
...    cmbCidadeFarmacia=//span[text()='2. Cidade']/../select
...    cmbBairroFarmacia=//span[text()='3. Bairro']/../select
...    btnBuscarFarm=//button[text()="Buscar"]
...    btnMapa=//button[text()="Mapa"]
...    btnLista=//button[text()="Lista"]
...    lblDrogaria=//h3[text()=" Drogaria Bifarma - Matriz Cd "]
...    btnEnviarImagem=//button[text()=" Enviar "]
...    inpImagemReceita=id:imgInp
...    msgSolicitacaoRecebida=//div[text()="Solicitação recebida"]
...    btnConsultaonline=//button[text()="CONSULTE ONLINE"]
...    msgComoPossoAjudar=//h2[text()="Como podemos ajudar hoje?"]
...    msgMensa=//strong[text()="PSICÓLOGOS"]