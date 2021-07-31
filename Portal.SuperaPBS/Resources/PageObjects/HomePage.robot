*** Settings ***
Library     SeleniumLibrary


*** Keywords ***
que o usuário está na página de validação de cupom
    Sleep  2s  Aguardando Elemento estar Carregado.
    Click    xpath=${Home.btnValidarCupom}
    Capture Page Screenshot

esteja na area para consulta de farmácias
    Go To  ${URL}
    Wait Until Element Is Visible    xpath=${Home.btnFarmaciasParticipantes}
    Click  xpath=${Home.btnFarmaciasParticipantes}
    Wait Until Element Is Visible    xpath=${Home.inpEstado}
    Capture Page Screenshot

informo o Estado "${ESTADO}" - "${SIGLA}"
    Press Keys  xpath=${Home.inpEstado}  ${ESTADO}+TAB
    Set Test Variable    ${ESTADO}  ${SIGLA}
    Wait Until Element Is Enabled    xpath=${Home.inpMunicipio}
    Capture Page Screenshot
    Sleep  2s  Aguardando Loading de Municipios

informo o Município "${MUNICIPIO}"
    Set Test Variable    ${MUNICIPIO}
    Press Keys  xpath=${Home.inpMunicipio}  ${MUNICIPIO}+TAB
    Wait Until Element Is Enabled    xpath=${Home.inpBairro}
    Capture Page Screenshot
    Sleep  2s  Aguardando Loading de bairros

informo o Bairro "${BAIRRO}"
    Set Test Variable    ${BAIRRO}
    Press Keys  xpath=${Home.inpBairro}  ${BAIRRO}+TAB
    Capture Page Screenshot

clico em "Buscar"
    Click  xpath=${Home.btnBuscar}
    
será exibido a mensagem "${MENSAGEM}"
    Wait Until Page Contains    ${MENSAGEM}
    Capture Page Screenshot

uma unidade sera encontrada
    ${text}  Get Text    xpath=${Home.lblFarmacia}
    IF  $ESTADO not in $text or $MUNICIPIO not in $text or $BAIRRO not in $text
        Capture Page Screenshot
        Fail  O Endereço da Farmácia não possue uma das informes (Bairro, Municipio ou Estado) do filtro realizado.
    END

Configurar Ambiente
    Abrir Navegador   Chrome
    que o usuário está logado na área restrita

    Wait Until Element is Visible    ${Coupons.validaStatusBeneficio}
    ${elements}    Get Webelement    ${Coupons.validaStatusBeneficio}
    ${bg_color}    Call Method    ${elements}    value_of_css_property    background-color
    IF  """${bg_color}""" != "rgba(79, 190, 121, 1)"
        Click    ${Coupons.chkBeneficio}
        Sleep  6s
    END

    Wait Until Element is Visible    ${Coupons.validaStatusCoupon}
    ${elements}    Get Webelement    ${Coupons.validaStatusCoupon}
    ${bg_color}    Call Method    ${elements}    value_of_css_property    background-color
    IF  """${bg_color}""" != "rgba(79, 190, 121, 1)"
        Click    ${Coupons.chkCoupon}
        Sleep  6s
    END

    Fechar Navegador