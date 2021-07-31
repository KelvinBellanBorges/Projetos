*** Settings ***
Library     SeleniumLibrary

*** Keywords ***
solicita buscar redes credenciadas
    Wait Until Element Is Visible    ${BuscaRede.btnBuscaRede}
    Execute Javascript  window.scrollTo(0,document.body.scrollHeight)
    Run Keyword And Ignore Error    Scroll Element Into View        ${BuscaRede.btnBuscaRede}
    Click       ${BuscaRede.btnBuscaRede}
    # descomentar quando sistema estiver OK \/
    # Wait Until Element is Visible  id:loading-bar  60

não deve ser exibido nenhum ERRO 500
    ${titles}  Get Window Titles
    
    IF  len($titles) > 1
        Switch Window  NEW
        ${status}  Run Keyword And Return Status    Wait Until Page Contains    Ocorreu um erro interno.
        IF  ${status}
            Capture Page Screenshot
            Fail  Teste deve ser Refatorado quando fluxo estiver funcionando adequadamente.
        END
    END

