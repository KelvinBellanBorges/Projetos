*** Settings ***
Library           SeleniumLibrary
Library           String

*** Keywords ***
que esteja na area restrita para admin
    LoginPage.efetuar Login
    Wait Until Element Is Visible    xpath=${AreaRestritaAdmin.btnNovoNuclear}

o botão "Novo centro de medicina nuclear" estar habilitado
    ${style}    Get Element Attribute    xpath=${AreaRestritaAdmin.btnNovoNuclear}    style
    IF  len($style) > 0
        Capture Page Screenshot
        Fail  Teste deve ser refatatorado quando a funcionalidade estiver concluída.
    END

o botão "Upload de documentos" estar habilitado
    ${style}    Get Element Attribute    xpath=${AreaRestritaAdmin.btnUpload}    style
    IF  len($style) > 0
        Capture Page Screenshot
        Fail  Teste deve ser refatatorado quando a funcionalidade estiver concluída.
    END
