*** Settings ***


*** Variable ***
# HomePage
&{Home}       btnAdmin=(//span[contains(.,'Admin')])[2]


# LoginPage
&{Login}      btnEntrar=(//input[contains(@value,'ENTRAR')])[1]
...           inpEmail=emailAdmin
...           inpSenha=senhaAdmin
...           btnInfo=info

# RelatorioPage
&{Relatorio}   imgRelatorio=//*[@id="DashRelatorios"]//child::img
...            selectOrigem=//select[@name="origemRelatorio"]
...            valueOrigem=//option[contains(text(),'Pacientes pré-cadastrados via site')]
...            divBuscar=//label[contains(.,'Buscar')]
...            inpDtInicio=filtroDtInicio
...            formBuscar=form-buscar
...            selectUF=ufRelatorio
...            valueUF=//*[@name='ufRelatorio']//option[text()='SP']
...            selectCidade=cidadeRelatorio
...            valueCidade=//select[@name="cidadeRelatorio"]//child::option[contains(text(),'SAO VICENTE')]
...            btnBuscar=//input[@value="Buscar"]
...            btnBaixar=//a[@class="bal"]

#NovoMedicoPage
&{NovoMedico}   btnNovo=//a[contains(.,'Novo médico')]
...             selectEspecialidade=especialidade
...             Especialidade=//select[@id="especialidade"]/option[contains(text(),'Urologista')]
...             inpCrm=crm
...             selectUF=uf
...             inpNome=nomeMedico
...             inpTelefone=telefone
...             inpEmail=emailMedico
...             inpSenha=senha
...             inpSenhaConfirma=senhaConfirma
...             inputTermo=aceitotermoMedico
...             btnEnviar=xpath=//*[@id="info"]/div/div/div/form/div/div[9]/input[1]
...             msgSucesso=//*[text()=' O seu cadastro foi realizado com sucesso!']
...             btnOK=//button[contains(.,'OK')]

#NovoPacientePage
&{NovoPaciente}   elementoVisivel=header
...               btnPaciente=//a[contains(.,'Novo paciente')]
...               NomePaciente=nomePacienteNovo
...               dtNasc=dataNascimentoPacienteNovo
...               telefone=telefone1PacienteNovo
...               selectUF=ufPacienteNovo
...               UF=//*[@id='ufPacienteNovo']//option[text()='SP']
...               selectCidade=cidadePacienteNovo
...               Cidade=//select[@id="cidadePacienteNovo"]/option[contains(text(),'SAO PAULO')]
...               email=emailPacienteNovo
...               pacienteCttNuclear=contatoMedicoNuclearPacienteNovo
...               crm=crmMedicoOncologistaPacienteNovo
...               uf=ufMedicoOncologistaPacienteNovo
...               termo=aceitotermoPacienteNovo
...               btnEnviar=//*[@id='aceitotermoPacienteNovo']/../../../.././/input[@value='Enviar']
...               btnOK=//button[contains(.,'OK')]
...               msgSucesso=//*[text()=' CADASTRO REALIZADO COM SUCESSO! ']

#ConsultaPacientePage
&{ConsultaPaciente}     DashPacientes=DashPaciente
...                     buscarPaciente=//input[@name='buscaNome']
...                     Paciente=//a[contains(.,'Vivian Teste')]

#ConsultaMedicaPage
&{ConsultaMedico}       DashMedicos=DashMedicos
...                     buscarMedico=//input[@name='textoPesquisa']
...                     Medico=//a[contains(.,'${NomeMedico}')]

#NovoAdminPage
&{NovoAdmin}            btnNovoAdmin=NovoAdmin
...                     NomeAdmin=nomeAdmin
...                     selectAdmin=tipoAdmin
...                     email=emailAdmin
...                     senha=senhaAdmin
...                     confirmaSenha=confirmaSenhaAdmin
...                     btnEnviarAdmin=//*[@id='confirmaSenhaAdmin']/../../../.././/input[@value='Enviar']
...                     msgSucesso=//*[contains(text(),'SUCESSO!')]
...                     btnOK=//button[contains(.,'OK')]

#QueroMeCadastrarPacientePage
&{QueroMeCadPaciente}   selectEspecialidade=especialidade
...                     inpNomePaciente=nomePaciente
...                     inpTelefone1=telefone1
...                     inpTelefone2=telefone2
...                     inpEmail=email
...                     inpCrmMedicoOncologista=crmMedicoOncologista
...                     ufMedicoOncologista=ufMedicoOncologista
...                     aceitoTermoPaciente=aceitotermo
...                     btnEnviar=//*[@id='aceitotermo']/../../../.././/input[@value='Enviar']
...                     qmcdMsgSucesso=//*[text()=' O seu pré-cadastro foi realizado com sucesso!']
...                     qmcdBtnOK=//button[contains(.,'OK')]

&{AreaRestritaAdmin}
...                     btnNovoNuclear=//a[contains(string(), 'Novo centro de') and contains(string(), 'medicina nuclear')]
...                     btnUpload=//a[contains(string(), 'Upload de') and contains(string(), 'documentos')]

#QueroMeCadastrarMedicoPage
&{QueroMeCadMedico}     qmcdMedico=radio-2
...                     selectEspecialidade=especialidade
...                     qmcdEspecialidade=//select[@id="especialidade"]/option[contains(text(),'Urologista')]
...                     inpNomeMedico=nomeMedico
...                     inpTelefone=telefone
...                     inpEmail=emailMedico
...                     inpSenha=senha
...                     inpSenhaConfirma=senhaConfirma
...                     qmcdCrm=crm
...                     qmcdSelectUF=uf
...                     qcmdAceitoTermoMedico=id:aceitotermoMedico
...                     btnEnviar=xpath=//input[@value="Enviar"]
...                     qmcdMsgSucesso=//*[text()=' O seu cadastro foi realizado com sucesso!']
...                     qmcdBtnOK=//button[contains(.,'OK')]


#Alterar CRM
&{AlterarCRM}           dashMedicos=DashMedicos
...                     btnMedico=xpath=//*[text()="Médicos"]
...                     inpBuscarMedico=xpath=//input[@name="textoPesquisa"]
...                     btnAtualizardados=xpath=//*[text()="Atualizar dados"]
...                     inpCrmMedico=xpath=//input[@id="crmMedico"]
...                     btnSalvarAlteraçao=xpath=//input[@value="Salvar"]
...                     btnAlteraçaoOK=xpath=//*[text()="OK"]
...                     inpAlterarNomeMedico=nomeMedico

#AreaRestritaMedicos
&{AreaRestritaMedicos}       btnMedico=xpath=//*[text()='Médico']
...                          emailMedico=xpath=//*[@id="emailMedico"]
...                          senhaMedico=xpath=//*[@id="senhaMedico"]
...                          btnentrarminhaareaMedico=xpath=//*[@id="formMedico"]/div[1]/input[3]
...                          checkboxTodosPacientes=xpath=//*[@name="buscaTodos"]
...                          checkboxPacientesAtivos=xpath=//*[@name="buscaAtivos"]
...                          checkboxPacientesInativos=xpath=//*[@name="buscaInativos"]
...                          meuPerfilMedico=//a[text()='MEU PERFIL']
...                          btnAlterar=xpath=//input[@value="Alterar"]
...                          campoTelefone=xpath=//*[@id="telefone"]
...                          btnSalvarAlteracao=xpath=//input[@value="Salvar"]
...                          imgArearestritamsgSucesso=//*[text()=' Área restrita']
...                          imgMedicos=//*[text()='médicos']

#AcessarPerfilPaciente
&{AcessarPerfilPaciente}     btnPaciente=xpath=//*[text()='Paciente']
...                          emailPaciente=xpath=//*[@id="emailPaciente"]
...                          senhaPaciente=xpath=//*[@id="senhaPaciente"]
...                          btnentrarminhaareaPaciente=xpath=//*[@id="formPaciente"]/div[1]/input[3]
...                          imgArearestritamsgSucesso=//*[text()=' Área restrita']
...                          imgPaciente=//*[text()='pacientes']
...                          meuPerfilPaciente=xpath=//*[text()='MEU PERFIL']
...                          btnCancerdeProstata=xpath=//*[text()='CÂNCER DE PRÓSTATA']
...                          btnMateriaisdoPrograma=xpath=//*[text()='MATERIAIS DO PROGRAMA']

#MateriaisPrograma
&{MateriaisPrograma}         matDigital=linkPacienteMateriais
...                          msgMatDigital=//*[text()='Materiais digitais'] 
...                          dow2=xpath=//a[@href="/assets/documentos/Marketing/1/Teste Bayer 2.pdf"]
...                          dow3=xpath=//a[@href="/assets/documentos/Marketing/2/Teste Bayer 3.pdf"]
...                          dow4=xpath=//a[@href="/assets/documentos/Marketing/3/Teste Bayer 4.pdf"]
...                          dow5=xpath=//a[@href="/assets/documentos/Marketing/4/Teste Bayer 5.pdf"]
...                          dow6=xpath=//a[@href="/assets/documentos/Marketing/5/Teste Bayer 6.pdf"]
...                          dow7=xpath=//a[@href="/assets/documentos/Marketing/6/Teste Bayer 7.pdf"]
...                          dow8=xpath=//a[@href="/assets/documentos/Marketing/7/Teste Bayer 8.pdf"]
...                          dow9=xpath=//a[@href="/assets/documentos/Marketing/8/Teste Bayer 9.pdf"]
...                          dow10=xpath=//a[@href="/assets/documentos/Marketing/9/Teste Bayer 10.pdf"]
...                          dow11=xpath=//a[@href="/assets/documentos/Marketing/10/Teste Bayer 11.pdf"]
...                          nextDireita=xpath=//*[text()='Next']
...                          prevEsquerda=xpath=//*[text()='Prev']

#EsqueciSenhaPaciente
&{EsqueciSenhaPaciente} 
...                          btnEsqueciSenha=xpath=//*[@id="formPaciente"]/div[1]/p/a[2] 
...                          inputEmailCadastrado=xpath=/html/body/div/div/div[2]/input[1]
...                          btnOK=xpath=//*[text()='OK']
...                          btnCancelar=xpath=//*[text()='Cancelar']
...                          msgSucesso=xpath=//*[text()=' Email enviado com sucesso! ']

#NovoCentroMedicinaNuclearPage
# &{NCMN}         s

