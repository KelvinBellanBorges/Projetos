*** Settings ***

*** Variables ***
${ambiente}=  %{AMBIENTE}

#Ambiente
${URL}      https://portalvale${ambiente}.epharma.com.br/start

#Beneficicario
${CPF_INVALIDO}                          121.212.121-21

#DadosClinicos
${ARQUIVO_RECEITA_FRENTE}               ${EXECDIR}\\Portal.Vale\\Data\\Teste.jpg
${UF_CRM}                                SP
${NUMERO_CRM}                            30828
${NOME_MEDICO}                           LUIZ CARLOS SILVEIRA MONTEIRO
${DATA_RECEITA}                          04/04/2021
${DIAGNOSTICO}                           Teste

#EnderecoEntrega
${CEP}                                   06321-490
${NOVO_CEP}                              06160-180
${LOGRADOURO}                            AVENIDA SANTO ESTEVAN
${NOVO_LOGRADOURO}                       Rua Juan Vicente
${NUMERO}                                77
${COMPLEMENTO}                           jgggggg
${BAIRRO}                                Vila Silviânia
${NOVO_BAIRRO}                           Bandeiras
${UF_ENTREGA}                            SP
${CIDADE}                                SAO PAULO
${NOVA_CIDADE}                           OSASCO
${EMAIL}                                 qualidade@epharma.com.br
${TELEFONE_RESIDENCIAL}                  (55) 3196-5888
${TELEFONE_CELULAR}                      (11) 96233-1867
${TELEFONE_COMERCIAL}                    (11) 4689-8686

#Produto
${PRODUTO_1}                     AAS PROTECT - ACIDO ACETILSALICILICO - Comp rev lib enterica 100mg cx 30 - R$ 17,17
${PRODUTO_2}                     ABLOK - ATENOLOL - Comp 100mg bl 30 - R$ 43,36

#Finalização
${CONFERENCIA_PRODUTO}                   FLUTAMIDA - FLUTAMIDA (GENERICO) BLAUSIEGEL: Comp 250mg cx 20

${TIMEOUT}      30

*** Keywords ***
