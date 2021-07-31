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

# HomePage
&{homePage}
...    inpJson=name:json
...    btnEnviar=//input[@value='enviar']
...    btnTitular=//*[@id='chooseBeneficiary']/a
...    btnNovoPedido=//*[text()='Novo Pedido']/..
...    btnAcompanhamentoPedido=//*[text()='Acompanhamento']/..
...    btnRedeFarmacias=//*[text()='Rede']/..
...    btnSugestaoMedicamentos=//*[text()='Sugestão']/..
...    loadingPage=id:requestLoading

# Novo Pedido
&{produtos}
##################################### Tela Produtos
...    lblNovoPedido=//*[text()='NOVO PEDIDO']
...    cmbProduto=id:select2-produtosPedido-container  #value1=7897595903693  #value2=7896241221853
...    produto1=//li[text()='${PRODUTO_1}']
...    produto2=//li[text()='${PRODUTO_2}']
...    inpQuantidade=id:quantidadeItem
...    btnIncluir=id:IncluiProduto
...    btnLimpar=id:LimpaProduto
...    btnVoltar=//*[@id='linhaProduto']//*[contains(text(),'Voltar')]
...    btnAvancar=//*[@id='linhaProduto']//*[contains(text(),'Avançar')]
...    lblProdutoSelecionado=id:GridProduto
...    lblPrecoDesconto=//*[text()='Preço com desconto:']/..
...    lblTotaldaCompra=//*[text()='Total da compra: ']/..
######################################## Tela Dados Clínicos
&{dadosClinicos}
...    inpUF=id:ufClinico
...    inpCrmMedico=codigoClinico
...    inpMedico=id:nomeClinico
...    inpPrescricaoFrente=id:frenteClinico
...    inpPrescricaoVerso=id:versoClinico
...    inpLaudo=id:laudoClinico
...    inpDataReceita=id:dataReceitaClinico
...    btnVoltar=//*[@id='linhaClinico']//*[contains(text(),'Voltar')]
...    btnAvancar=id:btnClinico
########################################## Tela Endereço Entrega
&{enderecoEntrega}
...    inpCEP=id:cepEnd
...    inpLogradouro=id:logradouroEnd
...    inpNumero=id:numeroEnd
...    inpComplemento=id:complementoEnd
...    inpBairro=id:bairroEnd
...    inpUF=id:ufEnd  #value="SP"
...    inpCidade=id:cidadeEnd  #value="SAO PAULO"
...    inpEmail=id:emailEnd
...    inpTelResidencial=id:telefoneResidencialEnd
...    inpTelCelular=id:telefoneCelularEnd
...    inpTelComercial=id:telefoneComercialEnd
...    btnVoltar=//*[@id='linhaEndereco']//*[contains(text(),'Voltar')]
...    btnAvancar=id:btnEndereco
############################################## Tela Finalização de Pedido
&{finalizacao}
...    lblbeneficiario=id:confiraBeneficiario
...    lblcpf=//*[text()='CPF: ']/..
...    lblProdutos=id:confiraProdutos
...    lblProduto=//*[text()='Produto:']/..
...    btnEditarProdutos=//*[@id='confiraProdutos']//*[text()='Editar']
...    lblTotaldaCompra=//*[text()='Total da compra: ']/..
...    lblDadosClinicos=id:confiraClinico
...    btnEditarDadosClinicos=//*[@id='confiraClinico']//*[text()='Editar']
...    lblCodPrescritor=//*[text()='Código do Prescritor: ']/..
...    lblEndEntrega=id:confiraEnderecoEntrega
...    btnEditarEndEntrega=//*[@id='confiraEnderecoEntrega']//*[text()='Editar']
...    lblCEP=//*[text()='CEP: ']/..
...    btnVoltar=//button[contains(text(),'Voltar')][contains(@onclick,'finalizado')]
...    btnFinalizar=id:btnFinalizar
##################################### Solicitação com sucesso
...    lblpedidoGerado=id:pedidoGerado
...    linkAcompanhaPedido=//a[text()='"Acompanhamento Pedido"']
...    btnMenu=//button[contains(text(),'Menu')]

# Acompanhamento de Pedidos
&{acompanhamentoPedido}
...    btnPedidoAnalise=//td[@data-stpedido='Em Análise']
...    btnPedidoCancelamento=//td[@data-stpedido='Pedido Cancelado App']
...    btnPedidoAprovado=//td[@data-stpedido='Aprovado']
...    colunaEmAnaliseDestaque=//*[@id='colunaSolicitacao'][not(contains(@class,'semOcorrencia'))]
...    colunaCancelamentoDestaque=//*[@id='colunaCancelamento'][not(contains(@class,'semOcorrencia'))]
...    colunaAprovadoDestaque=//*[@id='colunaSolicitacao'][not(contains(@class,'semOcorrencia'))]

# Sugestão de Medicamentos
&{sugestaoDeMedicamentos}
...    btnNovaSugestao=//*[text()='Avaliação de Inclusão de Medicamentos']/..
...    btnAcompanhamentoSugestao=//*[text()='Acompanhamento']/..
########################################### Nova Sugestão
...    btnCmbMedicamentos=//*[@id='select2-medicamentosSugestao-container']/../span[2]
...    cmbMedicamentos=id:select2-medicamentosSugestao-container
...    inpMedicamentos=//*[@class='select2-search__field']
...    opcaoAcarsan=//li[text()='ACARSAN-Líquido fr 80ml']
...    opcaoAcetofen=//li[text()='ACETOFEN-Comp 750mg cx 200']
...    btnIncluir=id:IncluiMedicamento
...    btnLimpar=id:LimpaMedicamento
...    btnEnviarSugestao=//button[@onclick="onClickEnviarSugestao('#medicamentos')"]
...    lblMedicamentoIncluso=//div[text()="ACARSAN Líquido fr 80ml"]
...    lblMedicamentoIncluso2=//div[text()="ACETOFEN Comp 750mg cx 200"]
...    btnRemoveMedicamento=id:RemoveItemMedicamento
...    msgEnviadoSucesso=//*[@id='sugestaoEnviada']//strong[text()='Sua sugestão foi enviada com sucesso!']
...    msgErroEnvio=//*[@id='sugestaoEnviada']//strong[text()='Atenção erro no envio da Sugestão']
&{negativos}
...    msgErro=//h1[contains(text(),'ATENÇÃO: Prezado Beneficiário')]
