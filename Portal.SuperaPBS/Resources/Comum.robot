*** Settings ***
#   Este arquivo contém as funcionalidades comuns entre as suítes dos testes
Library     SeleniumLibrary
Library     OperatingSystem
Library     String
Library     Collections
Library     DebugLibrary
Library     FakerLibrary       locale=pt-BR
Library     DateTime
Library     DatabaseLibrary
# Library     SikuliLibrary

Resource    ./Main.robot


*** Keywords ***
Abrir Navegador
    [Arguments]             ${BROWSER}
    # Add Image Path          ${CURDIR}\\..\\Data\\
    Obter variáveis do ConfigServer             Portal.SuperaPBS
    ${USERNAME}  Set Variable If    $ambiente == 'homo'  ${USERNAME_HOMO}  ${USERNAME_QA}
    ${SENHA}  Set Variable If    $ambiente == 'homo'  ${SENHA_HOMO}  ${SENHA_QA}
    Set Suite Variable    ${USERNAME}
    Set Suite Variable    ${SENHA}
    IF  '${BROWSER}'=='Chrome'
        ${download_folder}  Set Variable  ${CURDIR}${/}Downloads
        Set Global Variable    ${DOWNLOAD_DIR}  ${download_folder}
        ${options}=   Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
        ${prefs}    Create Dictionary    download.default_directory=${DOWNLOAD_DIR}    safebrowsing.enabled=false
        Call Method   ${options}  add_argument  --disable-notifications
        Call Method    ${options}    add_experimental_option    prefs    ${prefs}
        # Call Method   ${options}  add_argument  --aggressive-cache-discard
        # Call Method   ${options}  add_argument  --incognito 
        # ${driver}=              Create Webdriver    ${BROWSER}      options=${options}
        Open Browser  ${URL}      headless${BROWSER}  options=${options}
    ELSE IF  '${BROWSER}'=='Firefox'
        Open Browser  ${URL}      ${BROWSER}
    END
    Maximize Browser Window
    Set Selenium Timeout       10 seconds

Fechar Navegador
    Capture Page Screenshot
    Close All Browsers

Remover Caracteres Especiais
    [Arguments]    ${arg1}
    ${arg1} =      Remove String     ${arg1}    .
    ${arg1} =      Replace String    ${arg1}    ç    c
    ${arg1} =      Replace String    ${arg1}    á    a
    ${arg1} =      Replace String    ${arg1}    é    e
    ${arg1} =      Replace String    ${arg1}    í    i
    ${arg1} =      Replace String    ${arg1}    ó    o
    ${arg1} =      Replace String    ${arg1}    ú    u
    ${arg1} =      Replace String    ${arg1}    â    a
    ${arg1} =      Replace String    ${arg1}    ê    e
    ${arg1} =      Replace String    ${arg1}    ô    o
    ${arg1} =      Replace String    ${arg1}    ã    a
    ${arg1} =      Replace String    ${arg1}    õ    o
    [Return]       ${arg1}

Colocar Data Formato Brasileiro
    [Arguments]    ${dtnasc}
    ${stringdt}    Convert To String    ${dtnasc}
    @{dt}          Split String         ${stringdt}    -
    ${data}        Catenate             ${dt[2]}       /           ${dt[1]}    /    ${dt[0]}
    ${data}        Remove String        ${data}        ${SPACE}
    [Return]       ${data}

Remover Caracteres Especiais de Telefone
    [Arguments]    ${tel}
    ${tel}         Remove String    ${tel}    ${SPACE}
    ${tel}         Remove String    ${tel}    -           (    )    /
    ${tel}         Get Substring    ${tel}    -11
    [Return]       ${tel}

# Keywords de conexão com o banco oracle
ConnectToOracleDatabase
    Obter variáveis do ConfigServer             Portal.SuperaPBS
    Connect To Database Using Custom Params     cx_Oracle    '${ORACLE_CONNECTION}'

# Keywords de conexão com o banco oracle
ConnectToSQLServerDatabase
    Obter variáveis do ConfigServer           Portal.SuperaPBS
    Connect To Database Using Custom Params   pymssql   '${SQLSRV.host}','${SQLSRV.user}', '${SQLSRV.pwd}', '${SQLSRV.db}'

que executo o select no banco Oracle
    ${script}     Get File  ../Resources/Database/Scripts/Oracle/ConsultaAssociacaoPlanoxLoja.sql
    ConnectToOracleDatabase
    ${Resultado}  Query     ${script}
    Disconnect From Database
    Log To Console    \nResultado da query: ${Resultado}

que executo o select no banco SQLServer
    ${script}     Get File  ../Resources/Database/Scripts/SQLServer/ePharmaQAEvents.sql
    ConnectToSQLServerDatabase
    ${Resultado}  Query    ${script}
    Disconnect From Database
    Log To Console    \nResultado da query: ${Resultado}


# Keywords para otimização das ações
Click
    [Arguments]  ${locator}
    # Wait Until Element Is Not Visible            ${homePage.loadingPage}                 ${TIMEOUT}
    ${status}  Run Keyword And Return Status  Wait Until Element Is Visible  ${locator}  ${TIMEOUT}
    IF  """${status}"""=="True"
        # Scroll Element Into View  ${locator}
        # Click Element    ${locator}
        FOR  ${index}  IN RANGE  0  10 
            # Scroll Element Into View  ${locator}
            ${status}  Run Keyword and Return Status  Click Element    ${locator}
            Exit For Loop If  """${status}"""=="True"
            Run keyword if    ${index}==9    Fail    Numero de tentativas excedido
        END
    ELSE
        ${progress}  Run Keyword And Return Status  Wait Until Element Is Enabled  ${locator}  ${TIMEOUT}
        IF  """${progress}"""=="True"  
            FOR  ${index}  IN RANGE  0  10 
                # Scroll Element Into View  ${locator}
                ${status}  Run Keyword and Return Status  Click Element    ${locator}
                Exit For Loop If  """${status}"""=="True"
                Run keyword if    ${index}==9    Fail    Numero de tentativas excedido
            END
        END
    END

Click And Wait
    [Arguments]  ${locator}  ${locator2}
    # Wait Until Element Is Not Visible            ${homePage.loadingPage}                 ${TIMEOUT}
    ${status}  Run Keyword And Return Status  Wait Until Element Is Visible  ${locator}  ${TIMEOUT}
    IF  """${status}"""=="True" 
        FOR  ${index}  IN RANGE  0  10 
            # Scroll Element Into View  ${locator}
            Run Keyword and Ignore Error  Click Element    ${locator}
            ${status}  Run Keyword and Return Status  Wait Until Element Is Visible  ${locator2}  10
            Exit For Loop If  """${status}"""=="True"
            Run keyword if    ${index}==9    Fail    Numero de tentativas excedido
        END
    ELSE
        ${progress}  Run Keyword And Return Status  Wait Until Element Is Enabled  ${locator}  ${TIMEOUT}
        IF  """${progress}"""=="True"
            FOR  ${index}  IN RANGE  0  10  
                # Scroll Element Into View  ${locator}
                Run Keyword and Ignore Error  Click Element    ${locator}
                ${status}  Run Keyword and Return Status  Wait Until Element Is Enabled  ${locator2}  10
                Exit For Loop If  """${status}"""=="True"
                Run keyword if    ${index}==9    Fail    Numero de tentativas excedido
            END
        END
    END

Input
    [Arguments]  ${locator}  ${text}
    # Wait Until Element Is Not Visible           ${homePage.loadingPage}                  ${TIMEOUT}
    ${status}  Run Keyword And Return Status  Wait Until Element Is Visible  ${locator}  ${TIMEOUT}
    IF  """${status}"""=="True"  
        # Scroll Element Into View  ${locator}
        Input Text    ${locator}  ${text}
    ELSE
        ${progress}  Run Keyword And Return Status  Wait Until Element Is Enabled  ${locator}  ${TIMEOUT}
        IF  """${progress}"""=="True"  
            # Scroll Element Into View  ${locator}
            Input Text    ${locator}  ${text}
        END
    END