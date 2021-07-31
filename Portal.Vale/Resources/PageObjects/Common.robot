*** Settings ***
Library     SeleniumLibrary

*** Variables ***

# Input                                    ${}
# Click
# Capture Page Screenshot
# Input                                    id=${Beneficiario.txtCPF}                                    ${cpfNovo}


*** Keywords ***

que acesso o Portal Vale
    Wait Until Element Is Visible    ${homePage.inpJson}

Informo os dados válidos para acesso
    ${json_string}=  catenate
    ...    [
    ...        {
    ...            "Debug": true,
    ...            "UploadNative": false,
    ...            "IdPlano": 56921,
    ...            "Cartao": "54966148057",
    ...            "Cpf": "54966148057",
    ...            "Nome": "Titular",
    ...            "Sexo": "",
    ...            "Cep": "",
    ...            "DataNascimento": "",
    ...            "Email": "",
    ...            "GrauDep": "T"
    ...        }
    ...    ]
    Input                            ${homePage.inpJson}    ${json_string}
    Click                            ${homePage.btnEnviar}

é exibido menu principal do portal
    Wait Until Element Is Visible    ${homePage.btnNovoPedido}    ${TIMEOUT}
    Element Should Be Visible        ${homePage.btnNovoPedido}
    Element Should Be Visible        ${homePage.btnAcompanhamentoPedido}
    Element Should Be Visible        ${homePage.btnRedeFarmacias}
    # Element Should Be Visible        ${homePage.btnSugestaoMedicamentos}

que usuário acessou menu principal do portal
    que acesso o Portal Vale
    Informo os dados válidos para acesso
    é exibido menu principal do portal
