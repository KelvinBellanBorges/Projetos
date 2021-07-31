*** Settings ***

*** Variables ***
${ambiente}=  %{AMBIENTE}

#Ambiente
${URL}      http://adesao-nordisk${ambiente}.epharma.com.br/#/

#DadosPessoais
${CPF_INVALIDO}                          121.212.121-21
${CPF_JA_CADASTRADO}                     363.900.728-05
${DTNASCIMENTO_MAIOR}                    31/05/1989
${DTNASCIMENTO_MENOR}                    10/02/2008
${CEP}                                   06321-490
${EMAIL}                                 teste@epharma.com.br
${TELEFONE_CELULAR}                      (11) 96233-1867

#DetalhesMedicamentos
${UF_CRM}                                SP
${NUMERO_CRM}                            30828
${NOME_MEDICO}                           LUIZ CARLOS SILVEIRA MONTEIRO
${NUMERO_CRM_INVÁLIDO}                   11.111
${TIMEOUT}      60

*** Keywords ***
