*** Settings ***
Library     RequestsLibrary


*** Variable ***
${ambiente}=  %{AMBIENTE}
${URL_CONFIG_SERVER}    http://configserverhomo.epharma.com.br
${URL}                  http://eph-${ambiente}-superapbs.azurewebsites.net/
${TIMEOUT}              30
${USERNAME_HOMO}  19ba0d11-27f4-4858-99b4-48473e797999
${SENHA_HOMO}  19ba0d11-27f4-4858-99b4-48473e797999
${USERNAME_QA}  79cf8db1-238a-403c-aff0-ab0f6e416577
${SENHA_QA}  79cf8db1-238a-403c-aff0-ab0f6e416577

*** Keywords ***
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

# Variáveis "appSettings"
