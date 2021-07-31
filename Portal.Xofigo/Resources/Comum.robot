*** Settings ***
#   Este arquivo contém as funcionalidades comuns entre as suítes dos testes
Library     SeleniumLibrary
Library     OperatingSystem
Library     String
Library     Collections
Library     DebugLibrary
Library     FakerLibrary       locale=pt-BR
Library     DateTime



*** Keywords ***
Abrir Navegador
    ${download_folder}    Set Variable    ${CURDIR}${/}Downloads
    Set Global Variable    ${DOWNLOAD_DIR}    ${download_folder}
    ${prefs}    Create Dictionary    download.default_directory=${DOWNLOAD_DIR}    safebrowsing.enabled=false
    ${options}=    Evaluate    sys.modules['selenium.webdriver.chrome.options'].Options()    sys
    Call Method    ${options}    add_argument    --disable-notifications
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    ${driver}=    Create Webdriver    ${BROWSER}    options=${options}
    Go To    ${URL}
    # Open Browser    ${url}    chrome
    Maximize Browser Window
    Set Selenium Timeout    10 seconds


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


Click
    [Arguments]  ${locator}
    # Wait Until Element Is Not Visible       ${DadosClinicos.imgLoadDadosClinicos}        ${TIMEOUT}
    ${status}  Run Keyword And Return Status  Wait Until Element Is Visible  ${locator}  ${TIMEOUT}
    IF  """${status}"""=="True"
        Click Element    ${locator}
    ELSE
        ${progress}  Run Keyword And Return Status  Wait Until Element Is Enabled  ${locator}  ${TIMEOUT}
        IF  """${progress}"""=="True"
          Click Element    ${locator}
        END
    END

Input
  [Arguments]  ${locator}  ${text}
  # Wait Until Element Is Not Visible       ${DadosClinicos.imgLoadDadosClinicos}        ${TIMEOUT}
  ${status}  Run Keyword And Return Status  Wait Until Element Is Visible  ${locator}  ${TIMEOUT}
  IF  """${status}"""=="True"
      Input Text    ${locator}  ${text}
  ELSE
      ${progress}  Run Keyword And Return Status  Wait Until Element Is Enabled  ${locator}  ${TIMEOUT}
      IF  """${progress}"""=="True"
          Input Text    ${locator}  ${text}
      END
  END


New Email
      ${string}  Generate Random String
      ${email}=  Catenate  ${string}@mailinator.com
      [Return]  ${email}
