*** Settings ***
Library     SeleniumLibrary

*** Variables ***

*** Keywords ***
É Permitido Que O Usuário atualize seu cadastro
    Input                          ${DadosPessoais.inpEmail}             ${EMAIL}
    Execute JavaScript             window.scrollTo(0, document.body.scrollHeight)
    Click                          ${DadosPessoais.chkEmail}
    Input                          ${DadosPessoais.inpCpfResponsavel}    ${CPF_MAIOR}
    Click                          ${DadosPessoais.chkAceitePaciente}
    Click                          ${DadosPessoais.btnAtualizarCadastro}

é permitido que o usuário conclua seu cadastro
    Click                          ${TermosAceite.btnAvancar}
    Input                          ${DadosPessoais.inpNome}            ${NOME}
    Click                          ${DadosPessoais.chkNaoInformar}
    Input                          ${DadosPessoais.inpDtNascimento}    ${DTNASCIMENTO_MAIOR}
    Input                          ${DadosPessoais.inpTelefone}        ${TELEFONE_CELULAR}
    Input                          ${DadosPessoais.inpEmail}           ${EMAIL}
    Input                          ${DadosPessoais.inpCep}             ${CEP}
    Execute JavaScript             window.scrollTo(0, document.body.scrollHeight)
    Click                          ${DadosPessoais.chkEmail}
    Click                          ${DadosPessoais.btnAvancar}

será recebida mensagem de sucesso
    Wait Until Element Is Visible  ${DetalhesMedicamentos.btnTresiba}
    Execute JavaScript             window.scrollTo(0, document.body.scrollHeight)
    Wait Until Element Is Visible  ${DetalhesMedicamentos.btnConcluir}
    Capture Page Screenshot
    Run Keyword And Ignore Error    Scroll Element Into View       ${DetalhesMedicamentos.btnConcluir}
    Execute JavaScript             window.scrollTo(0, document.body.scrollHeight)
    Click                          ${DetalhesMedicamentos.btnConcluir}
    Capture Page Screenshot
    Wait Until Element Is Visible  ${pageHome.btnCadastro}
    Element Should Be Visible      ${pageHome.btnCadastro}


será recebida mensagem de atualização com sucesso
    Wait Until Element Is Visible  ${DadosPessoais.txtMsgAtualizacaoCadastro}
    Click                          ${DadosPessoais.btnOKAtualizaCadastro}

informa dados de paciente menor de idade
    Click                          ${TermosAceite.chkAceite}
    Click                          ${TermosAceite.chkAceite2}
    Click                          ${TermosAceite.chkAceite3}
    Input                          ${TermosAceite.inpCpf}              ${CPF}
    Click                          ${TermosAceite.btnAvancar}
    Input                          ${DadosPessoais.inpNome}            ${NOME}
    Click                          ${DadosPessoais.chkNaoInformar}
    Input                          ${DadosPessoais.inpDtNascimento}    ${DTNASCIMENTO_MENOR}
    Input                          ${DadosPessoais.inpTelefone}        ${TELEFONE_CELULAR}
    Input                          ${DadosPessoais.inpEmail}           ${EMAIL}
    Input                          ${DadosPessoais.inpCep}             ${CEP}
    Execute JavaScript             window.scrollTo(0, document.body.scrollHeight)
    Click                          ${DadosPessoais.chkEmail}

informa dados de paciente maior de idade
    Click                          ${TermosAceite.chkAceite}
    Click                          ${TermosAceite.chkAceite2}
    Click                          ${TermosAceite.chkAceite3}
    Input                          ${TermosAceite.inpCpf}              ${CPF_MAIOR}
    Click                          ${TermosAceite.btnAvancar}
    Input                          ${DadosPessoais.inpNome}            ${NOME}
    Click                          ${DadosPessoais.chkNaoInformar}
    Input                          ${DadosPessoais.inpDtNascimento}    ${DTNASCIMENTO_MAIOR}
    Input                          ${DadosPessoais.inpTelefone}        ${TELEFONE_CELULAR}
    Input                          ${DadosPessoais.inpEmail}           ${EMAIL}
    Input                          ${DadosPessoais.inpCep}             ${CEP}
    Execute JavaScript             window.scrollTo(0, document.body.scrollHeight)
    Click                          ${DadosPessoais.chkEmail}
    Click                          ${DadosPessoais.btnAvancar}

devem ser informados os dados do responsável
    Input                          ${DadosPessoais.inpCpfResponsavel}    ${CPF_MAIOR}
    Input                          ${DadosPessoais.inpNomeResponsavel}   ${NOME_MEDICO}
    Click                          ${DadosPessoais.chkAceitePaciente}

após informado o responsável o cadastro pode ser concluído
    Click                          ${DadosPessoais.btnAvancar}

informa todos os dados obrigatórios
    Click                          ${TermosAceite.chkAceite}
    Click                          ${TermosAceite.chkAceite2}
    Click                          ${TermosAceite.chkAceite3}
    Input                          ${TermosAceite.inpCpf}              ${CPF}
    É Permitido Que O Usuário Conclua Seu Cadastro

devem ser informados os dados do responsável sem o termo de aceite
    Input                          ${DadosPessoais.inpCpfResponsavel}    ${CPF_MAIOR}
    Input                          ${DadosPessoais.inpNomeResponsavel}   ${NOME_MEDICO}

é retornado um span de erro
    Click                          ${DadosPessoais.btnAvancar}
    Element Should Be Visible         ${DadosPessoais.msgErroTermoMenor}

informa todos os dados obrigatórios sem marcar a área logada
    Click                          ${TermosAceite.chkAceite}
    Click                          ${TermosAceite.chkAceite2}
    Click                          ${TermosAceite.chkAceite3}
    Input                          ${TermosAceite.inpCpf}              ${CPF_MAIOR}
    Click                          ${TermosAceite.btnAvancar}
    Input                          ${DadosPessoais.inpNome}            ${NOME}
    Click                          ${DadosPessoais.chkNaoInformar}
    Input                          ${DadosPessoais.inpDtNascimento}    ${DTNASCIMENTO_MAIOR}
    Input                          ${DadosPessoais.inpTelefone}        ${TELEFONE_CELULAR}
    Input                          ${DadosPessoais.inpEmail}           ${EMAIL}
    Input                          ${DadosPessoais.inpCep}             ${CEP}
    Execute JavaScript             window.scrollTo(0, document.body.scrollHeight)
    Click                          ${DadosPessoais.btnAvancar}

é retornado um span de erro da área logada
    Element Should Be Visible         ${DadosPessoais.msgErroAreaLogada}
