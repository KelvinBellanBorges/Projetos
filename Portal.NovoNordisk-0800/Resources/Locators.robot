*** Settings ***

*** Variable ***
# Veja abaixo o padrão de nomenclatura dos locators de acordo com o tipo
# de elemento que está sendo referenciado. Crie um dicionário com o nome da Page
# em seguida, a variável deverá iniciar com o prefixo correspondente ao elemento,
# seguido de um label que ajude a identificar o componente:

# | Elemento     | Prefixo | Exemplo        |
# | combobox     | cmb     | cmbPossuiCupom |
# | checkbox     | chk     | chkTermos      |
# | radio button | rdb     | rdbPlano       |
# | text input   | inp     | inpCPF         |
# | message      | msg     | msgFalha       |

# HomePage
&{pageHome}
...     btnCadastro=//button[contains(text(),'Cadastre-se')]
...     inpCPF=name:cpf
...     btnAcessar=//button[contains(text(),'Acessar')]
...     txtMsgInformativoCadastro=//*[contains(text(),'CPF não está cadastrado na nossa base. Para realizar o cadastro, só clicar no botão "Cadastre-se" ao lado')]
...     txtPageHome=//*[contains(text(),'Ainda não tenho cadastro no programa')]
# Identificação do Usuário e Termos de Adesão
&{TermosAceite}
...    chkAceite=name:adesao
...    chkAceite2=name:adesao2
...    chkAceite3=name:adesao3
...    inpCpf=name:cpf
...    btnAvancar=//button[contains(text(),'Avançar')]
...    msgErroCPF=//*[@ng-show="vm.exibeCpfInvalidoHome"]
...    msgErroAceite=//*[contains(text(),'Para se cadastrar precisamos que concorde com nosso regulamento e com o uso dos seus dados pessoais.')]

# Dados Pessoais Cadastro e Atualização
&{DadosPessoais}
...    inpCpf=name:cpf
...    inpNome=name:nome
...    chkMasculino=//input[@name='sexo'][@value='M']
...    chkFeminino=//input[@name='sexo'][@value='F']
...    chkNaoInformar=//input[@name='sexo'][@value='X']
...    inpDtNascimento=name:dataNascimento
...    inpTelefone=name:telefoneCelular
...    inpEmail=name:email
...    inpCep=name:cep
...    inpCidade=name:cidadeuf
...    chkSMS=//input[@name='aceiteAreaLogada'][@value='1']
...    chkEmail=//input[@name='aceiteAreaLogada'][@value='2']
...    btnVoltar=//*[contains(text(),'Voltar')]
...    btnAvancar=//button[contains(text(),'Avançar')]
...    btnAtualizarCadastro=//button[contains(text(),'Atualizar Cadastro')]
...    btnOKAtualizaCadastro=//button[contains(text(),'OK')]
...    txtMsgAtualizacaoCadastro=//*[contains(text(),'Atualização do Cadastro Realizado com Sucesso')]

########################Em caso de menor de idade
...    inpCpfResponsavel=name:cpfResponsavel
...    inpNomeResponsavel=name:nomeResponsavel
...    chkAceitePaciente=name:aceitePaciente
...    msgErroTermoMenor=//*[contains(text(),'Check obrigatório')]
...    msgErroAreaLogada=//*[contains(text(),'Informe a forma de recebimento do acesso.')]
# //*[@ng-show="vm.erroAceitePaciente"]

# Detalhes da Medicação (Adesão aos Medicamentos)
&{DetalhesMedicamentos}
#Tresiba
...    btnConcluir=//*[contains(text(),'Concluir')]
...    btnVoltar=//*[contains(text(),'Voltar')]
...    btnTresiba=//a[contains(text(),'Tresiba')]
...    inpCRMTresiba=//*[@ng-model="vm.tresiba.numeroCR"]
...    inpUfCRMTresiba=//*[@ng-model="vm.tresiba.uf"]
...    inpNomeCRMTresiba=//*[@ng-model="vm.tresiba.nome"]
...    btnPesquisarTresiba=//*[@ng-click="vm.pesquisarMedico(vm.produtos.tresiba)"]
...    btnConfirmarTresiba=//*[@ng-click="vm.tresiba.aderir = true; vm.salvar('tresiba')"]
...    modalSucesso=id:modalaAvisoConclusao
#Victoza
...    btnFecharModal=//*[@ng-click="vm.fecharModalMensagemConclusao()"]
...    chkdiabetes1=//input[@name='tipoDiabetes'][@value='1']
...    btnVictoza=//a[contains(text(),'Victoza')]
...    inpCRMVictoza=//*[@ng-model="vm.victoza.numeroCR"]
...    inpUfCRMVictoza=//*[@ng-model="vm.victoza.uf"]
...    inpNomeCRMVictoza=//*[@ng-model="vm.victoza.nome"]
...    btnPesquisarVictoza=//*[@ng-click="vm.pesquisarMedico(vm.produtos.victoza)"]
...    btnConfirmarVictoza=//*[@ng-click="vm.victoza.aderir = true; vm.salvar('victoza')"]
#Saxenda

...    btnSaxenda=//a[contains(text(),'Saxenda')]
...    inpCRMSaxenda=//*[@ng-model="vm.saxenda.numeroCR"]
...    inpUfCRMSaxenda=//*[@ng-model="vm.saxenda.uf"]
...    inpNomeCRMSaxenda=//*[@ng-model="vm.saxenda.nome"]
...    btnPesquisarSaxenda=//*[@ng-click="vm.pesquisarMedico(vm.produtos.saxenda)"]
...    btnConfirmarSaxenda=//*[@ng-click="vm.saxenda.aderir = true; vm.salvar('saxenda')"]
#Xultophy
...    btnXultophy=//a[contains(text(),'Xultophy')]
...    inpCRMXultophy=//*[@ng-model="vm.xultophy.numeroCR"]
...    inpUfCRMXultophy=//*[@ng-model="vm.xultophy.uf"]
...    inpNomeCRMXultophy=//*[@ng-model="vm.xultophy.nome"]
...    btnPesquisarXultophy=//*[@ng-click="vm.pesquisarMedico(vm.produtos.xultophy)"]
...    btnConfirmarXultophy=//*[@ng-click="vm.xultophy.aderir = true; vm.salvar('xultophy')"]
#Ozempic
...    btnOzempic=//a[contains(text(),'Ozempic')]
...    inpCRMOzempic=//*[@ng-model="vm.ozempic.numeroCR"]
...    inpUfCRMOzempic=//*[@ng-model="vm.ozempic.uf"]
...    inpNomeCRMOzempic=//*[@ng-model="vm.ozempic.nome"]
...    btnPesquisarOzempic=//*[@ng-click="vm.pesquisarMedico(vm.produtos.ozempic)"]
...    btnConfirmarOzempic=//*[@ng-click="vm.ozempic.aderir = true; vm.salvar('ozempic')"]
 #fiaspFlex
...    btnFiasp=//a[contains(text(),'Fiasp')]
...    inpCRMFiasp=//*[@ng-model="vm.fiaspFlex.numeroCR"]
...    inpUfCRMFiasp=//*[@ng-model="vm.fiaspFlex.uf"]
...    inpNomeCRMFiasp=//*[@ng-model="vm.fiaspFlex.nome"]
...    btnPesquisarFiasp=//*[@ng-click="vm.pesquisarMedico(vm.produtos.fiaspFlex)"]
...    btnConfirmarFiasp=//*[@ng-click="vm.fiaspFlex.aderir = true; vm.salvar('fiaspFlex')"]
...    chkdiabetes2=//input[@name='tipoDiabetes'][@value='2']

#Busca redes
&{BuscaRede}
...    btnBuscaRede=//*[contains(text(),'Buscar Redes Credenciadas')]
