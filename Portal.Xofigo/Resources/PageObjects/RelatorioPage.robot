*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem


*** Keywords ***
que o usuário está logado com perfil Admin
    LoginPage.efetuar Login

clica na opção relatório
    Wait Until Element Is Visible     ${Relatorio.imgRelatorio}   10
    Click Image                       ${Relatorio.imgRelatorio}

realiza pesquisa
    Wait Until Element Is Visible    ${Relatorio.divBuscar}
    Click Element                    ${Relatorio.selectOrigem}
    Click Element                    ${Relatorio.valueOrigem}
    Input Text                       ${Relatorio.inpDtInicio}   ${DTINICIO}
    Click Element                    ${Relatorio.formBuscar}
    Click Element                    ${Relatorio.selectUF}
    Click Element                    ${Relatorio.valueUF}
    Sleep                            10
    Click Element                    ${Relatorio.selectCidade}
    Click Element                    ${Relatorio.valueCidade}
    Click Button                     ${Relatorio.btnBuscar}

clica no botão "Baixar Excel"
    Wait Until Element Is Visible     ${Relatorio.btnBaixar}       10
    Click Element                     ${Relatorio.btnBaixar}

gera relatório com sucesso
    ${data}  Get Current Date  result_format=%d%m%Y
    FOR  ${INDEX}  IN RANGE  0  30
        ${files}=	List Files In Directory  ${DOWNLOAD_DIR}
        ${status}  Run Keyword and Return Status  List Should Contain Value  ${files} 	Pacientes Cadastrados Portal Pró Estar_${data}.xlsx
        Exit for loop if  ${status}==True
        SLeep  1s
        Run Keyword If  ${INDEX}==29  Fail  O looping chegou ao final 
    END
    Remove Files  ${DOWNLOAD_DIR}\\Pacientes Cadastrados Portal Pró Estar_${data}.xlsx
