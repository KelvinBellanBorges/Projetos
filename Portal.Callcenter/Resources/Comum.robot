*** Settings ***
Resource          ./Main.robot

*** Keywords ***
Abrir Navegador
    Gerar Dados Fake
    ${DOWNLOAD}    Set Variable    ${CURDIR}${/}Downloads
    Set Global Variable    ${DOWNLOAD}
    ${prefs}    Create Dictionary    download.default_directory=${DOWNLOAD}    safebrowsing.enabled=false
    ${options}=    Evaluate    sys.modules['selenium.webdriver.chrome.options'].Options()    sys
    Call Method    ${options}    add_argument    --disable-notifications
    Call Method    ${options}    add_argument    --windows-size(3840,2160)
    Call Method    ${options}    add_argument    --aggressive-cache-discard
    Call Method    ${options}    add_argument    --incognito
    Call Method    ${options}    add_argument    --start-maximized
    Call Method    ${options}    add_argument    --safebrowsing-disable-download-protection
    Call Method    ${options}    add_argument    --disable-web-security
    Call Method    ${options}    add_argument    --disable-logging
    Call Method    ${options}    add_argument    --enable-automation
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-infobars
    Call Method    ${options}    add_argument    --disable-browser-side-navigation
    Open Browser    ${URL}    Chrome    options=${options}

Fechar Navegador
    Capture Page Screenshot
    Close All Browsers
    
wait combo loading
    [Arguments]  ${locator}  ${old}=${EMPTY}
    ${txt}  Get Selected List Label    ${locator}
    IF  len($txt) == 0
        FOR  ${i}  IN RANGE  0  30
            ${txt}  Get Selected List Label    ${locator}
            Exit For Loop If    len($txt) > 0
            Sleep  2  Aguardando sistema carregar Cidade.
        END
    ELSE
        IF  len($old) > 0
            FOR  ${i}  IN RANGE  0  30
                ${txt}  Get Selected List Label    ${locator}
                Exit For Loop If    $txt != $old
                Sleep  2  Aguardando sistema carregar Cidade.
            END
        END
    END
    [Return]  ${txt}


wait load element text
    [Arguments]  ${locator}  ${old}=${EMPTY}
    ${txt}  Get Element Attribute    ${locator}    value
    IF  len($txt) == 0
        FOR  ${i}  IN RANGE  0  30
            ${txt}  Get Element Attribute    ${locator}    value
            Exit For Loop If    len($txt) > 0
            Sleep  2  Aguardando sistema carregar Cidade.
        END
    ELSE
        IF  len($old) > 0
            FOR  ${i}  IN RANGE  0  30
                ${txt}  Get Element Attribute    ${locator}    value
                Exit For Loop If    $txt != $old
                Sleep  2  Aguardando sistema carregar Cidade.
            END
        END
    END
    [Return]  ${txt}

Click
    [Arguments]    ${locator}
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}
    IF    ${status}
        Run Keyword And Ignore Error    Scroll Element Into View    ${locator}
        Click Element    ${locator}
            Capture Page Screenshot
    ELSE
        ${progress}    Run Keyword And Return Status    Wait Until Element Contains    ${locator}    ${TIMEOUT}
        IF    ${progress}
            Run Keyword And Ignore Error    Scroll Element Into View    ${locator}
            Click Element    ${locator}
            Capture Page Screenshot
        END
    END

Click And Wait
    [Arguments]    ${locator}    ${locator2}
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}
    IF    ${status}
        FOR    ${index}    IN RANGE    0    10
            Run Keyword And Ignore Error    Scroll Element Into View    ${locator}
            Click Element    ${locator}
            Capture Page Screenshot
            ${status}    Run Keyword and Return Status    Wait Until Element Is Visible    ${locator2}    10
            Exit For Loop If    ${status}
        END
    ELSE
        ${progress}    Run Keyword And Return Status    Wait Until Element Contains    ${locator}    ${TIMEOUT}
        IF    ${progress}
            FOR    ${index}    IN RANGE    0    10
                Run Keyword And Ignore Error    Scroll Element Into View    ${locator}
                Click Element    ${locator}
                Capture Page Screenshot
                ${status}    Run Keyword and Return Status    Wait Until Element Is Visible    ${locator2}    10
                Exit For Loop If    ${status}
            END
        END
    END

Input
    [Arguments]    ${locator}    ${text}
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}
    IF    ${status}
        Run Keyword And Ignore Error    Scroll Element Into View    ${locator}
        Press Keys    ${locator}    ${text}
        Capture Page Screenshot
    ELSE
        ${progress}    Run Keyword And Return Status    Wait Until Element Contains    ${locator}    ${TIMEOUT}
        IF    ${progress}
            Run Keyword And Ignore Error    Scroll Element Into View    ${locator}
            Press Keys    ${locator}    ${text}
            Capture Page Screenshot
        END
    END
