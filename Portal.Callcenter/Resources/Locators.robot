*** Variable ***
${LOADING}      xpath=//*[@id="__next"]/div[2]/div
# Cadastrar beneficiario/HOME
&{cadastro}     inpCPF=cardHolderNumber
...             bntPesquisar=//button[contains(.,'Pesquisar')]
...             txtBene=//*[text()='Nome do Beneficiário']
...             inpNome=beneficiario_nome
...             inpNomeResponsavel=question_responsible_name
...             inpCpfResponsavel=question_responsible_document
...             inpCelular=beneficiario_endereco_cel
...             inpDtNascimento=beneficiario_dt_nascimento
...             inpSexo=beneficiario_tp_sexo
...             inpEmail=beneficiario_email_1
...             inpCep=beneficiario_endereco_cep
...             inpCidade=cidade
...             ckbSMS=//span[text()='Por SMS']/../input
...             ckbEmail=//span[text()='Por e-mail']
...             ckbTermo1=//input[@name='term0']/../span[2]
...             ckbTermo2=//input[@name='term1']/../span[2]
...             ckbTermo3=//input[@name='term2']/../span[2]
...             ckbTermo4=//input[@name='check_is_confirmation_responsable']/../span[2]
...             btnVoltar=//button[text()='Voltar']
...             btnEditar=//button[text()='Editar']
...             btnNext=//button[text()='Avançar']
## Confirmação de Edição.
...             btnSimEdicao=//div[text()='Deseja efetuar atualização do cadastro?']/..//button[text()='Sim']
...             btnNaoEdicao=//div[text()='Deseja efetuar atualização do cadastro?']/..//button[text()='Não']
## Medicamentos
&{adesao}
...             txtTresiba=//p[contains(text(), 'Tresiba')]
...             txtVictoza=//p[contains(text(), 'Victoza')]
...             txtSaxenda=//p[contains(text(), 'Saxenda')]
...             txtXultophy=//p[contains(text(), 'Xultophy')]
...             txtOzempic=//p[contains(text(), 'Ozempic')]
...             txtFiasp=//p[contains(text(), 'Fiasp® Flextouch®/Fiasp® Penfill® + NovoPen Echo®')]
...             txtNorditropin=//p[contains(text(), 'Norditropin Nordiflex')]
...             txtNovoFine=//p[contains(text(), 'NovoFine')]
...             txtRybelsus=//p[contains(text(), 'Rybelsus')]
## Inputs do medicamento
...             inpCRM=(//*[@id='question_prescriber_crm'])[{index}]
...             inpUF=(//*[@id='question_prescriber_state'])[{index}]
...             inpMedico=(//*[@id='question_prescriber_name'])[{index}]
...             btnAdicionar=//button[text()='Adicionar']
...             btnFinalizar=//button[text()='Finalizar']
## Confirmação de adesão.
...             btnSimAdesao=//div[text()='Confirma a adesão?']/..//button[text()='Sim']
...             btnNaoAdesao=//div[text()='Confirma a adesão?']/..//button[text()='Não']
## Rede Credenciada
&{rede_credenciada}
...             btnRedeCredenciada=//a[@href='/accreditedchain']
...             inpRCEstado=state
...             inpRCCidade=city
...             inpRCBairro=neighborhoods
...             textResultados=//table//td/..
