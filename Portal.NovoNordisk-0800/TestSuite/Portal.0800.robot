*** Settings ***
Resource        ../Resources/Main.robot
Test Setup      Abrir Navegador   Chrome
Test Teardown   Fechar Navegador
# Suite Setup     Gerar Dados Fake

*** Test Case ***
CENÁRIO 01: Cadastro com CPF válido
    [Documentation]     ..
    [Tags]              cen01  0800  Nordisk

    Dado     que o usuario acessa o Portal 0800
    Quando   Solicita Cadastro no programa
    E        informa um CPF Válido
    Então    É Permitido Que O Usuário Conclua Seu Cadastro
    E        será recebida mensagem de sucesso

CENÁRIO 02: Cadastro com CPF inválido
    [Documentation]     ..
    [Tags]              cen02  0800  Nordisk

    Dado     que o usuario acessa o Portal 0800
    Quando   Solicita Cadastro no programa
    E        informa um CPF inválido
    Então    é exibido mensagem de erro

CENÁRIO 03: Cadastro de usuário menor de idade
    [Documentation]     ..
    [Tags]              cen03  0800  Nordisk

    Dado     que o usuario acessa o Portal 0800
    Quando   Solicita Cadastro no programa
    E        informa dados de paciente menor de idade
    Então    devem ser informados os dados do responsável
    E        após informado o responsável o cadastro pode ser concluído
    E        será recebida mensagem de sucesso

CENÁRIO 04: Seleção de um único produto
    [Documentation]     ..
    [Tags]              cen04  0800  Nordisk

    Dado     que o usuario acessa o Portal 0800
    Quando   Solicita Cadastro no programa
    E        informa todos os dados obrigatórios
    Então    é permitido que seja feita uma adesão a medicação
    E        será recebida mensagem de sucesso


CENÁRIO 05: Cadastro com usuário existente (Atualização de dados)
    [Documentation]     ..
    [Tags]              cen05  0800  Nordisk

    Dado     que o usuario acessa o Portal 0800
    Quando   Solicita Cadastro no programa
    E        informa um CPF Válido ja cadastrado
    Então    É Permitido Que O Usuário atualize seu cadastro
    E        será recebida mensagem de atualização com sucesso

CENÁRIO 06: Cadastro com usuário inexistente (CPF e SENHA não cadastrados)
    [Documentation]     ..
    [Tags]              cen06  0800  Nordisk
       
    Dado     que o usuario acessa o Portal 0800
    Quando   ainda não possui cadastro e informa um CPF Válido e uma senha
    Então    será recebida mensagem informativa para a realização do cadastro

CENÁRIO 07: Cadastro de usuário maior de idade
    [Documentation]     ..
    [Tags]              cen07  0800  Nordisk
       
    Dado     que o usuario acessa o Portal 0800
    Quando   Solicita Cadastro no programa
    E        informa dados de paciente maior de idade
    Então    é permitido que seja feita uma adesão a medicação
    E        será recebida mensagem de sucesso

CENÁRIO 08: Validação do campo CRM por estado
    [Documentation]     ..
    [Tags]              cen08  0800  Nordisk
       
    Dado     que o usuario acessa o Portal 0800
    Quando   Solicita Cadastro no programa
    E        informa um CPF Válido
    E        é permitido que o usuário conclua seu cadastro
    E        informa um CRM e Estado válido
    E        o campo nome do médico deve ter valor

CENÁRIO 09: CRM inválido por estados
    [Documentation]     ..
    [Tags]              cen09  0800  Nordisk

    Dado     que o usuario acessa o Portal 0800
    Quando   Solicita Cadastro no programa
    E        informa um CPF Válido
    E        é permitido que o usuário conclua seu cadastro
    E        informa um CRM inválido
    Então    o campo nome do médico deve ficar vazio

CENÁRIO 10: Botão de redes credenciadas
    [Documentation]     ..
    [Tags]              cen10  0800  Nordisk
      
    Dado     que o usuario acessa o Portal 0800
    Quando   Solicita Cadastro no programa
    E        informa um CPF Válido
    E        é permitido que o usuário conclua seu cadastro
    E        solicita buscar redes credenciadas
    Então    não deve ser exibido nenhum ERRO 500

CENÁRIO 11: Adesão de um ou mais produtos com o mesmo cadastro
    [Documentation]     ..
    [Tags]              cen11  0800  Nordisk

    Dado     que o usuario acessa o Portal 0800
    Quando   Solicita Cadastro no programa
    E        informa um CPF Válido
    E        é permitido que o usuário conclua seu cadastro
    E        é permitido que seja feita uma adesão de mais de um Medicamento
    Então    será recebida mensagem de sucesso

# CENÁRIO 12: Adesão de todos os produtos no mesmo cadastro
# #     [Documentation]     ..
# #     [Tags]              cen12  0800  Nordisk
#
# #     # Dado     Condição
# #     # Quando   Ação
# #     # E        Ação
# #     # Então    Resultado

CENÁRIO 13: Atualizar cadastro sem marcar o check "Declaro, nos termos da lei, ser o responsável legal"
    [Documentation]     ..
    [Tags]              cen13  0800  Nordisk
       
    Dado     que o usuario acessa o Portal 0800
    Quando   Solicita Cadastro no programa
    E        informa dados de paciente menor de idade
    E        devem ser informados os dados do responsável sem o termo de aceite
    Então    é retornado um span de erro

CENÁRIO 14: Atualizar Cadastro sem marcar o check "Como deseja receber o acesso a sua área logada"
    [Documentation]     ..
    [Tags]              cen14  0800  Nordisk

    Dado     que o usuario acessa o Portal 0800
    Quando   Solicita Cadastro no programa
    E        informa todos os dados obrigatórios sem marcar a área logada
    Então    é retornado um span de erro da área logada

CENÁRIO 15: Avançar no cadastro se aprovar os termos de aceite
    [Documentation]     ..
    [Tags]              cen15  0800  Nordisk

    Dado     que o usuario acessa o Portal 0800
    Quando   Solicita Cadastro no programa
    E        informa um CPF válido sem marcar os termos de aceite
    Então    é exibido uma mensagem de erro do termo

CENÁRIO 16: Adesão de nenhum produto
    [Documentation]     ..
    [Tags]              cen16  0800  Nordisk

    Dado     que o usuario acessa o Portal 0800
    Quando   Solicita Cadastro no programa
    E        informa um CPF Válido
    E        é permitido que o usuário conclua seu cadastro
    E        sem aderir a nenhum produto
    Então    voltará para a página inicial

# CENÁRIO 17: Adesão de todos os produtos no mesmo cadastro
#     [Documentation]     ..
#     [Tags]              cen17  0800  Nordisk
#
#     Dado     que o usuario acessa o Portal 0800
#     Quando   Solicita Cadastro no programa
#     E        informa um CPF Válido
#     E        é permitido que o usuário conclua seu cadastro
#     E        é permitido que seja feita todas as adesões a medicações
