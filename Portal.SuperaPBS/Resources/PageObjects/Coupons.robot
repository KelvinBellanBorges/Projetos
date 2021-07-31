*** Settings ***
Library     SeleniumLibrary
Library     ../libs/utilities.py
# Library     SikuliLibrary

*** Variable ***


*** Keywords ***
ativar beneficio
    Wait Until Element is Visible    ${Coupons.validaStatusBeneficio}
    ${elements}    Get Webelement    ${Coupons.validaStatusBeneficio}
    ${bg_color}    Call Method    ${elements}    value_of_css_property    background-color
    IF  """${bg_color}""" == "rgba(190, 190, 190, 1)"
        Click    ${Coupons.chkBeneficio}
    END

ativo a posse do cupom

    ativar beneficio
    Wait Until Element is Visible    ${Coupons.validaStatusCoupon}
    ${elements}    Get Webelement    ${Coupons.validaStatusCoupon}
    ${bg_color}    Call Method    ${elements}    value_of_css_property    background-color
    IF  """${bg_color}""" == "rgba(190, 190, 190, 1)"
        Click    ${Coupons.chkCoupon}
    END
    Click     xpath=${Coupons.lnkVoltar}
    Click And Wait    ${Home.btnValidarCupom}  ${Register.cmbPossuiCupom}

desativo a posse do cupom
    ativar beneficio
    Wait Until Element is Visible    ${Coupons.validaStatusCoupon}
    ${elements}    Get Webelement    ${Coupons.validaStatusCoupon}
    ${bg_color}    Call Method    ${elements}    value_of_css_property    background-color
    IF  """${bg_color}""" == "rgba(79, 190, 121, 1)"
        Click    ${Coupons.chkCoupon}
    END
    Click Element     xpath=${Coupons.lnkVoltar}

verifico se o benefício está ativado
    Wait Until Element is Visible    ${Coupons.validaStatusBeneficio}
    ${elements}    Get Webelement    ${Coupons.validaStatusBeneficio}
    ${bg_color}    Call Method    ${elements}    value_of_css_property    background-color
    IF  """${bg_color}""" == "rgba(190, 190, 190, 1)"
        Click    ${Coupons.chkBeneficio}
    END
    Click Element     xpath=${Coupons.lnkVoltar}

verifico se o benefício está desativado
    Wait Until Element is Visible    ${Coupons.validaStatusBeneficio}
    ${elements}    Get Webelement    ${Coupons.validaStatusBeneficio}
    ${bg_color}    Call Method    ${elements}    value_of_css_property    background-color
    IF  """${bg_color}""" == "rgba(79, 190, 121, 1)"
        Click    ${Coupons.chkBeneficio}
    END
    Click Element     xpath=${Coupons.lnkVoltar}

é possível acessar a área restrita com sucesso
    Click    xpath=${Home.btnValidarCupom}
    Wait Until Page Contains    Configurações de Regras:  ${TIMEOUT}

escolho o número distrital "${DISTRITO}"
    Set Test Variable    ${DISTRITO}
    Wait Until Element Is Visible    xpath=${Coupons.inputNrDistrital}
    Sleep  3s  Aguardando elemento carregar por completo...
    Press Keys    xpath=${Coupons.inputNrDistrital}  ${DISTRITO}+TAB
    Capture Page Screenshot

informo a quantia de "${QTD_CUPONS}" Cupon(s)
    Set Test Variable    ${QTD_CUPONS}
    Input Text    xpath=${Coupons.inputQtdCupons}  ${QTD_CUPONS}
    Capture Page Screenshot

clico em "Gerar Cupons"
    Click  xpath=${Coupons.btnGerar}
    Capture Page Screenshot

deve ser realizado o download automatico do excell com os cupons
    Wait File Download  ${DOWNLOAD_DIR}  .xlsx  Cupons_
    ${files}  Get All Files With Name Start With  ${DOWNLOAD_DIR}  .xlsx  Cupons_
    ${content}  Get All Lines From XLS  ${files[0]}
    Set Test Variable    ${content}
    Log  ${content}
    Clear Files In Path  ${DOWNLOAD_DIR}  .xlsx  Cupons_

o arquivo deve conter a quantia de cupons gerados.
    ${content_size}  Evaluate  len(${content})
    Should Be Equal    ${content_size}    ${${QTD_CUPONS}}

que possua um código de Cupom
    que o usuário está logado na área restrita
    escolho o número distrital "101200"
    informo a quantia de "1" Cupon(s)
    clico em "Gerar Cupons"
    será exibido a mensagem "Cupons gerados com sucesso!"
    será exibido a mensagem "Excelente, seus cupons já foram gerados e exportados via excel para seu gerenciamento."
    deve ser realizado o download automatico do excell com os cupons
    Set Test Variable    ${CUPOM}  ${content[0][0]}
    Go To  ${URL}
    