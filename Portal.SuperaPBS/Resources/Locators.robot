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
&{Home}       
...           btnValidarCupom=//*[contains(text(),'Valide aqui o seu cupom')]
...           btnFarmaciasParticipantes=//*[contains(text(),'Farmácias participantes')]
...           inpEstado=//div[text()='Estados']/..//input
...           inpMunicipio=//div[text()='Município']/..//input
...           inpBairro=//div[text()='Bairro']/..//input
...           btnBuscar=//button[text()='Buscar']
...           lblFarmacia=//span[text()='Veja as farmácias próximas a você:']/../div/p

# RegisterPage
&{Register}   
...           cmbPossuiCupom=hasCoupon
...           inpCPF=//input[@placeholder='CPF']
...           inpNrCoupon=//input[@placeholder='Número do cupom']
...           inpCRM=//input[@placeholder='CRM']
...           cmbUF=//div[text()='UF']/..//input
...           chkTermos=//label[text()='Declaro que li e aceito os ']/span
...           bntOK=//*[@id="root"]/div[1]/div[3]/div/form/div/div[2]/button/canvas
...           msgSuspensao=//strong[text()='O programa está suspenso temporariamente e será reativado em breve.']

# CouponsPage
&{Coupons}    
...           validaStatusBeneficio=//*[text()='Ativar benefício']/..//*[@for='checkbox']
...           validaStatusCoupon=//*[text()='Ativar posse de cupom']/..//*[@for='checkbox']
...           chkBeneficio=//*[text()='Ativar benefício']/..//*[@id='checkbox']/..
...           chkCoupon=//*[text()='Ativar posse de cupom']/..//*[@id='checkbox']/..
...           btnAreaRestrita=//*[contains(text(),'Acessar área restrita')]
...           lnkVoltar=//*[contains(text(),'Voltar para home')]
...           inputNrDistrital=//div[text()='Número Distrital']/..//input
...           inputQtdCupons=//input[@placeholder='Quantidade de cupons']
...           btnGerar=//button[text()='Gerar Cupons']
...           cmbCupom=//div[text()='Possui cupom?']/..//input

# LoginPage
&{Login}      
...           btnEntrar=//*[contains(text(),'Entrar')]
