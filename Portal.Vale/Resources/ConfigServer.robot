*** Settings ***
Library     RequestsLibrary
Library     FakerLibrary        locale=pt_BR
Library     String
Resource    Comum.robot

*** Variable ***
${URL_CONFIG_SERVER}                   http://configserverhomo.epharma.com.br

*** Keywords ***
Gerar Dados Fake
    ${CARTAO}             Generate Random String    19    1234567890
    Set Suite Variable    ${CARTAO}
    ${CPF}                FakerLibrary.cpf
    Set Suite Variable    ${CPF}
    ${NAME}               FakerLibrary.Name
    ${NOME}               Remover Caracteres Especiais      ${NAME}
    Set Suite Variable    ${NOME}
    # ${CARTAO}             Convert To Bytes                  ${CARTAO}
    # ${CARTAO_BASE64}      b64encode                         ${CARTAO}
    Set Suite Variable    ${URL}            #${URL_AMBIENTE}${CARTAO_BASE64}
    #Set Suite Variable    ${CARTAO_BASE64}

Obter variáveis do ConfigServer
    [Arguments]     ${PROJETO}
    ${response}=    GET   ${URL_CONFIG_SERVER}/api/config/${PROJETO}

# Obter variáveis SQL Server
    ${SQLSRV_tmp}   Set Variable    ${response.json()}[connectionStrings][ePharmaSQLS][connectionString]
    ${SQLSRV_tmp}   Evaluate        '${SQLSRV_tmp}'.replace(' ','')
    ${SQLSRV_tmp}   Evaluate        '${SQLSRV_tmp}'.replace('=',' ')
    ${SQLSRV_tmp}   Evaluate        '${SQLSRV_tmp}'.replace(';',' ')
    ${SQLSRV_tmp}   Split String    ${SQLSRV_tmp}

    Set Suite Variable    &{SQLSRV}
    ...                   host=${SQLSRV_tmp[1]}
    ...                   db=${SQLSRV_tmp[3]}
    ...                   user=${SQLSRV_tmp[5]}
    ...                   pwd=${SQLSRV_tmp[7]}

# Obter connection string para conexão com OracleDB
    ${ORACLE_tmp}   Set Variable    ${response.json()}[connectionStrings][PBM_RET][connectionString]
    ${ORACLE_tmp}   Evaluate        '${ORACLE_tmp}'.replace('Data Source=','')
    ${ORACLE_tmp}   Evaluate        '${ORACLE_tmp}'.replace(' ','')
    ${ORACLE_tmp}   Evaluate        '${ORACLE_tmp}'.replace(';',' ')
    ${ORACLE_tmp}   Split String    ${ORACLE_tmp}
    ${user}         Set Variable    ${ORACLE_tmp[1]}
    ${user}         Split String    ${ORACLE_tmp[1]}    =
    ${pwd}          Set Variable    ${ORACLE_tmp[2]}
    ${pwd}          Split String    ${ORACLE_tmp[2]}    =

    Set Suite Variable    ${ORACLE_CONNECTION}    ${user[1]}/${pwd[1]}@${ORACLE_tmp[0]}
