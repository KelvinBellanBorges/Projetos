*** Settings ***
Library     SeleniumLibrary

*** Variables ***

# Input                                    ${}
# Click
# Capture Page Screenshot
# Input                                    id=${Beneficiario.txtCPF}                                    ${cpfNovo}


*** Keywords ***


acessa o menu de Novo Pedido
    Click                            ${homePage.btnNovoPedido}

informa o produto correspondente ao pedido
    Wait Until Element Is Visible    ${produtos.lblNovoPedido}     ${TIMEOUT}
    Click And Wait                   ${produtos.cmbProduto}  ${produtos.produto1}
    Click                            ${produtos.produto1}
    Input                            ${produtos.inpQuantidade}  1
    CLick                            ${produtos.btnIncluir}
    Wait Until Element Is Visible    ${produtos.lblProdutoSelecionado}  ${TIMEOUT}
    Click                            ${produtos.btnAvancar}
  
informa os dados do prescritor
    Wait Until Element Is Visible   ${dadosClinicos.inpUF}                     ${TIMEOUT}
    Select From List By Value        ${dadosClinicos.inpUF}                     ${UF_CRM}
    Input                            ${dadosClinicos.inpCrmMedico}              ${NUMERO_CRM}
    Choose File                      ${dadosClinicos.inpPrescricaoFrente}       ${ARQUIVO_RECEITA_FRENTE}
    Wait Until Element Is Not Visible            ${homePage.loadingPage}                 ${TIMEOUT}
    Choose File                      ${dadosClinicos.inpPrescricaoVerso}        ${ARQUIVO_RECEITA_FRENTE}
    Wait Until Element Is Not Visible            ${homePage.loadingPage}                 ${TIMEOUT}
    Choose File                      ${dadosClinicos.inpLaudo}                  ${ARQUIVO_RECEITA_FRENTE}
    Input                            ${dadosClinicos.inpDataReceita}            ${DATA_RECEITA}
    Click And Wait                   ${dadosClinicos.btnAvancar}  ${enderecoEntrega.inpCEP}

informa os dados de entrega
    Input                            ${enderecoEntrega.inpCEP}               ${CEP}
    Wait Until Element Is Enabled    ${enderecoEntrega.inpLogradouro}        ${TIMEOUT}
    Input                            ${enderecoEntrega.inpLogradouro}        ${LOGRADOURO}
    Input                            ${enderecoEntrega.inpNumero}            ${NUMERO}
    Input                            ${enderecoEntrega.inpComplemento}       ${COMPLEMENTO}
    Input                            ${enderecoEntrega.inpBairro}            ${BAIRRO}
    Select From List By Value        ${enderecoEntrega.inpUF}                ${UF_ENTREGA}
    Wait Until Element Is Not Visible            ${homePage.loadingPage}                 ${TIMEOUT}
    Select From List By Value        ${enderecoEntrega.inpCidade}            ${CIDADE}
    Input                            ${enderecoEntrega.inpEmail}             ${EMAIL}
    Input                            ${enderecoEntrega.inpTelResidencial}    ${TELEFONE_RESIDENCIAL}
    Input                            ${enderecoEntrega.inpTelCelular}        ${TELEFONE_CELULAR}
    Input                            ${enderecoEntrega.inpTelComercial}      ${TELEFONE_COMERCIAL}
    Click                            ${enderecoEntrega.btnAvancar}
    ${status}  Run Keyword and Return Status  Wait Until Element Is Visible  id:cidadeEnd-error  30
    IF  ${status} == True
        Select From List By Value        ${enderecoEntrega.inpCidade}            ${CIDADE}
        Click                            ${enderecoEntrega.btnAvancar}
    END
    
valida os dados inseridos na tela de finalização e confirma o pedido
    Wait Until Element Is Visible    ${finalizacao.lblbeneficiario}    ${TIMEOUT}
    ${strCPF}    Get Text            ${finalizacao.lblcpf}
    Should Contain    ${strCPF}      54966148057
    Wait Until Element Is Visible    ${finalizacao.lblProdutos}
    Wait Until Element Is Visible    ${finalizacao.lblDadosClinicos}
    ${strCRM}    Get Text            ${finalizacao.lblCodPrescritor}
    Should Contain    ${strCRM}      ${NUMERO_CRM}
    Wait Until Element Is Visible    ${finalizacao.lblEndEntrega}
    ${strCEP}    Get Text            ${finalizacao.lblCEP}
    Should Contain    ${strCEP}      ${CEP}
    Click                            ${finalizacao.btnFinalizar}

deverá ser exibido tela de sucesso
    Wait Until Element Is Not Visible            ${homePage.loadingPage}                 ${TIMEOUT}
    Wait Until Element Is Visible    ${finalizacao.lblpedidoGerado}    ${TIMEOUT}
    Element Should Be Visible        ${finalizacao.linkAcompanhaPedido}
    Element Should Be Visible        ${finalizacao.btnMenu}

informa o produto correspondente ao pedido em maior quantidade
    Wait Until Element Is Visible    ${produtos.lblNovoPedido}     ${TIMEOUT}
    Click And Wait                   ${produtos.cmbProduto}  ${produtos.produto1}
    Click                            ${produtos.produto1}
    Input                            ${produtos.inpQuantidade}  5
    CLick                            ${produtos.btnIncluir}
    Wait Until Element Is Visible    ${produtos.lblProdutoSelecionado}
    Click                            ${produtos.btnAvancar}

informa produto diferentes correspondentes ao pedido
    Wait Until Element Is Visible    ${produtos.lblNovoPedido}     ${TIMEOUT}
    Click And Wait                   ${produtos.cmbProduto}  ${produtos.produto1}
    Click                            ${produtos.produto1}
    Input                            ${produtos.inpQuantidade}  1
    CLick                            ${produtos.btnIncluir}
    Click And Wait                   ${produtos.cmbProduto}  ${produtos.produto2}
    Click                            ${produtos.produto2}
    Input                            ${produtos.inpQuantidade}  1
    CLick                            ${produtos.btnIncluir}
    Wait Until Element Is Visible    ${produtos.lblProdutoSelecionado}
    Click                            ${produtos.btnAvancar}