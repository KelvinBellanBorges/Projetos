*** Settings ***
Resource          ../Main.robot

*** Keywords ***
Gerar Dados Fake
    [Arguments]  ${idade_max}=80
    ${PESSOA}    Random Person  idade_max=${idade_max}
    Set Test Variable    ${PESSOA}

Random Person
    [Arguments]  ${idade_min}=18  ${idade_max}=80
    ${MENOR_IDADE}  Set Variable If    ${idade_max} < 18  True  False
    Set Test Variable    ${MENOR_IDADE}
    ${name}    FakerLibrary.first_name
    ${last_name}  FakerLibrary.last_name
    ${cpf}    FakerLibrary.cpf
    ${cpf}    Remove String    ${cpf}    .    -
    ${cpf_mae}    FakerLibrary.cpf
    ${cpf_mae}    Remove String    ${cpf_mae}    .    -
    ${cpf_pai}    FakerLibrary.cpf
    ${cpf_pai}    Remove String    ${cpf_pai}    .    -
    ${rg}    FakerLibrary.rg
    ${cidade}    FakerLibrary.city
    ${mae}    FakerLibrary.name female
    ${pai}    FakerLibrary.name male
    IF  ${idade_max} < 18
        ${idade_min}  Set Variable  ${5}
    END
    ${nascimento}    FakerLibrary.date of birth    minimum_age=${idade_min}    maximum_age=${idade_max}
    ${rua}    FakerLibrary.street name
    ${numero}    FakerLibrary.random int    min=100    max=9999
    ${telefone}    FakerLibrary.random int    min=100    max=999
    @{w}    Split String    '${nascimento}'    -
    ${nascimento}    Set Variable    ${w}[2]${w}[1]${w}[0]
    ${nascimento}    Remove String    ${nascimento}    '
    ${sexo}    FakerLibrary.random int    min=0    max=2
    
    IF  ${sexo} == 0
        ${sexo}  Set Variable  Masculino
    ELSE IF  ${sexo} == 1
        ${sexo}  Set Variable  Feminino
    ELSE
        ${sexo}  Set Variable  Não informado
    END

    &{pessoa}    Create Dictionary
    ...    nome=${name}${SPACE}${last_name}
    ...    cpf=${EMPTY}${cpf}
    ...    rg=${EMPTY}${rg}
    ...    nascimento=${nascimento}
    ...    telefone=${EMPTY}4199${telefone}7${telefone}
    ...    email=${cpf}@getnada.com
    ...    mae=${mae}
    ...    cpf_mae=${EMPTY}${cpf_mae}
    ...    pai=${pai}
    ...    cpf_pai=${EMPTY}${cpf_pai}
    ...    cidade=${cidade}
    ...    rua=${rua}
    ...    numero=${EMPTY}${numero}
    ...    mail=${cpf}@getnada.com
    ...    sexo=${EMPTY}${sexo}
    Log    ${pessoa}
    [Return]    ${pessoa}
