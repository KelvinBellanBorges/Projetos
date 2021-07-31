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
Library     ../Libs/pythonLibrary.py
Resource    ./Main.robot
***Variables***
# ${DRIVER}=   C:\\Automação\\epharma.AutomationFrontend\\webdrivers\\chromedriver.exe
*** Keywords ***
Abrir Navegador
    [Arguments]     ${BROWSER}
    Obter variáveis do ConfigServer             Portal.Bradesco
    IF  '${BROWSER}'=='Chrome'
        ${options}=   Evaluate    sys.modules['selenium.webdriver.chrome.options'].Options()    sys
        Call Method   ${options}  add_argument    --disable-notifications
        Call Method   ${options}  add_argument    --windows-size(3840,2160)
        Call Method   ${options}  add_argument    --aggressive-cache-discard
        Call Method   ${options}  add_argument    --incognito
        #Call Method   ${options}  add_argument    --headless
        # ${driver}=              Create Webdriver    ${BROWSER}      options=${options}
        Open Browser  ${URL}      ${BROWSER}  options=${options}
        #Execute Javascript  document.body.style.zoom="30%"
    ELSE IF  '${BROWSER}'=='Firefox'
        Open Browser  ${URL}      ${BROWSER}
    END
    Maximize Browser Window
    Gerar Dados Fake
    # Set Window Size    3840  2160  True
    # Set Window Size  ${3840}  ${2160}
    # Execute Javascript  window.resizeTo(3840, 2160)
    
    Set Selenium Timeout       45 seconds

Fechar Navegador
    Close All Browsers

Remover Banner
    ${element_xpath}=       Replace String      //*[contains(text(), 'A Novo Nordisk')]/../../../../../..        \"  \\\"
    Execute JavaScript  document.evaluate("${element_xpath}", document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).remove();

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
    Obter variáveis do ConfigServer             Portal.Bradesco
    Connect To Database Using Custom Params     cx_Oracle    '${ORACLE_CONNECTION}'

# Keywords de conexão com o banco oracle
ConnectToSQLServerDatabase
    Obter variáveis do ConfigServer           Portal.Bradesco
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
    Run Keyword And Ignore Error    Remover Banner
    # Wait Until Element Is Not Visible            ${homePage.loadingPage}                 ${TIMEOUT}
    ${status}  Run Keyword And Return Status  Wait Until Element Is Visible  ${locator}  ${TIMEOUT}
    IF  """${status}"""=="True"
        Run Keyword And Ignore Error    Scroll Element Into View  ${locator}
        Click Element    ${locator}
    ELSE
        ${progress}  Run Keyword And Return Status  Wait Until Element Contains  ${locator}  ${TIMEOUT}
        IF  """${progress}"""=="True"
            Run Keyword And Ignore Error    Scroll Element Into View  ${locator}
            Click Element    ${locator}
        END
    END

Click And Wait
    [Arguments]  ${locator}  ${locator2}
    # Wait Until Element Is Not Visible            ${homePage.loadingPage}                 ${TIMEOUT}
    ${status}  Run Keyword And Return Status  Wait Until Element Is Visible  ${locator}  ${TIMEOUT}
    IF  """${status}"""=="True"
        FOR  ${index}  IN RANGE  0  10
            Run Keyword And Ignore Error    Scroll Element Into View  ${locator}
            Click Element    ${locator}
            ${status}  Run Keyword and Return Status  Wait Until Element Is Visible  ${locator2}  10
            Exit For Loop If  """${status}"""=="True"
        END
    ELSE
        ${progress}  Run Keyword And Return Status  Wait Until Element Contains  ${locator}  ${TIMEOUT}
        IF  """${progress}"""=="True"
            FOR  ${index}  IN RANGE  0  10
                Run Keyword And Ignore Error    Scroll Element Into View  ${locator}
                Click Element    ${locator}
                ${status}  Run Keyword and Return Status  Wait Until Element Is Visible  ${locator2}  10
                Exit For Loop If  """${status}"""=="True"
            END
        END
    END

Input
    [Arguments]  ${locator}  ${text}
    # Wait Until Element Is Not Visible           ${homePage.loadingPage}                  ${TIMEOUT}
    ${status}  Run Keyword And Return Status  Wait Until Element Is Visible  ${locator}  ${TIMEOUT}
    IF  """${status}"""=="True"
        Run Keyword And Ignore Error    Scroll Element Into View  ${locator}
        Input Text    ${locator}  ${text}
    ELSE
        ${progress}  Run Keyword And Return Status  Wait Until Element Contains  ${locator}  ${TIMEOUT}
        IF  """${progress}"""=="True"
            Run Keyword And Ignore Error    Scroll Element Into View  ${locator}
            Input Text    ${locator}  ${text}
        END
    END
