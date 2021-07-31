*** Settings ***
Library     SeleniumLibrary

*** Variables ***

# Input                                    ${}
# Click
# Capture Page Screenshot
# Input                                    id=${Beneficiario.txtCPF}                                    ${cpfNovo}


*** Keywords ***

acessa o menu de Acompanhamento de Pedido
    Click    ${homePage.btnAcompanhamentoPedido}

seleciona pedido com status "${status}"
    IF  """${status}""" == "Em Análise"
        Click    ${acompanhamentoPedido.btnPedidoAnalise}
        ${status}  Run Keyword and Return Status  Wait Until Element Is Visible  //button[text()='Fechar']  30
        IF  ${status} == True
            Click                            //button[text()='Fechar']
        END
    END
    IF  """${status}""" == "Pedido Cancelado App"
        Click    ${acompanhamentoPedido.btnPedidoCancelamento}
        ${status}  Run Keyword and Return Status  Wait Until Element Is Visible  //button[text()='Fechar']  30
        IF  ${status} == True
            Click                            //button[text()='Fechar']
        END
    END
    IF  """${status}""" == "Aprovado"
        Click    ${acompanhamentoPedido.btnPedidoAprovado}
        ${status}  Run Keyword and Return Status  Wait Until Element Is Visible  //button[text()='Fechar']  30
        IF  ${status} == True
            Click                            //button[text()='Fechar']
        END
    END

é destacado status "${status}" na área de acompanhamento de pedido
    IF  """${status}""" == "Em Análise"
        Wait Until Element Is Visible    ${acompanhamentoPedido.colunaEmAnaliseDestaque}
    END
    IF  """${status}""" == "Cancelamento"
        Wait Until Element Is Visible    ${acompanhamentoPedido.colunaCancelamentoDestaque}
    END
    IF  """${status}""" == "Aprovado"
        Wait Until Element Is Visible    ${acompanhamentoPedido.colunaAprovadoDestaque}
    END
    IF  """${status}""" == "Aprovado"
        Wait Until Element Is Visible    ${acompanhamentoPedido.colunaAprovadoDestaque}
    END
