*** Settings ***
Library     SeleniumLibrary

*** Variables ***

*** Keywords ***
é permitido que seja feita uma adesão a medicação
    Click                          ${DetalhesMedicamentos.btnTresiba}
    Input                          ${DetalhesMedicamentos.inpCRMTresiba}          ${NUMERO_CRM}
    Select From List By Value      ${DetalhesMedicamentos.inpUfCRMTresiba}        ${UF_CRM}
    FOR  ${index}  IN RANGE  0  5
        Click                           ${DetalhesMedicamentos.btnPesquisarTresiba}
        Wait Until Element is Not Visible  id:loading-bar  ${TIMEOUT}
        Run Keyword And Ignore Error    Scroll Element Into View        ${DetalhesMedicamentos.btnConfirmarTresiba}
        Click                           ${DetalhesMedicamentos.chkdiabetes1}
        ${status}  Run Keyword and Return Status  Element Should Be Enabled  ${DetalhesMedicamentos.btnConfirmarTresiba}
        Exit For Loop IF  ${status} == True

    END
    Run Keyword And Ignore Error    Scroll Element Into View        //*[@ng-click="vm.setPanel(vm.produtos.victoza); vm.pesquisarPrecoFixo(vm.produtos.victoza)"]
    Click    ${DetalhesMedicamentos.btnConfirmarTresiba}
    Wait Until Element Is Visible  ${DetalhesMedicamentos.modalSucesso}  ${TIMEOUT}
    Element Should Be Visible      ${DetalhesMedicamentos.modalSucesso}
    Wait Until Element Is Visible  ${DetalhesMedicamentos.btnFecharModal}  ${TIMEOUT}
    Click                          ${DetalhesMedicamentos.btnFecharModal}

informa um CRM inválido
    Click                          ${DetalhesMedicamentos.btnVictoza}
    Input                          ${DetalhesMedicamentos.inpCRMVictoza}          ${NUMERO_CRM_INVÁLIDO}
    Select From List By Value      ${DetalhesMedicamentos.inpUfCRMVictoza}        ${UF_CRM}
    #FOR  ${index}  IN RANGE  0  5
        Run Keyword And Ignore Error    Scroll Element Into View        ${DetalhesMedicamentos.btnConfirmarVictoza}
        Click                           ${DetalhesMedicamentos.btnPesquisarVictoza}
        Wait Until Element is Not Visible  id:loading-bar  60
        # Scroll Element Into View        ${DetalhesMedicamentos.btnConfirmarVictoza}
        # Click                           ${DetalhesMedicamentos.chkdiabetes1}
        # ${status}  Run Keyword and Return Status  Element Should Be Enabled  ${DetalhesMedicamentos.btnConfirmarVictoza}
        # Exit For Loop IF  ${status} == True

#    END

o campo nome do médico deve ficar vazio
    Wait Until Element is Not Visible  id:loading-bar  ${TIMEOUT}
    Sleep  5
#     ${text}   Get Text   ${DetalhesMedicamentos.inpNomeCRMVictoza}
# #    ${Value}   Get Value   ${DetalhesMedicamentos.inpNomeCRMVictoza}
#     Should Be Equal As Strings      ${text}    ${EMPTY}
    Element Should Be Disabled      ${DetalhesMedicamentos.btnConfirmarVictoza}

informa um CRM e Estado válido
    Click                          ${DetalhesMedicamentos.btnTresiba}
    Input                          ${DetalhesMedicamentos.inpCRMTresiba}          ${NUMERO_CRM}
    Select From List By Value      ${DetalhesMedicamentos.inpUfCRMTresiba}        ${UF_CRM}
    FOR  ${index}  IN RANGE  0  5
        Click                           ${DetalhesMedicamentos.btnPesquisarTresiba}
        Wait Until Element is Not Visible  id:loading-bar  ${TIMEOUT}
        Run Keyword And Ignore Error    Scroll Element Into View        ${DetalhesMedicamentos.btnConfirmarTresiba}
        Click                           ${DetalhesMedicamentos.chkdiabetes1}
        ${status}  Run Keyword and Return Status  Element Should Be Enabled  ${DetalhesMedicamentos.btnConfirmarTresiba}
        Exit For Loop IF  ${status} == True

    END

o campo nome do médico deve ter valor
    FOR  ${index}  IN RANGE  0  5
            Click                           ${DetalhesMedicamentos.btnPesquisarTresiba}
            Wait Until Element is Not Visible  id:loading-bar  ${TIMEOUT}
            Execute Javascript  window.scrollTo(0,document.body.scrollHeight)
            Run Keyword And Ignore Error    Scroll Element Into View        ${DetalhesMedicamentos.btnConfirmarTresiba}
            Click                           ${DetalhesMedicamentos.chkdiabetes1}
            ${status}  Run Keyword and Return Status  Element Should Be Enabled  ${DetalhesMedicamentos.btnConfirmarTresiba}
            Exit For Loop IF  ${status} == True

    END
    Run Keyword And Ignore Error    Scroll Element Into View        //*[@ng-click="vm.setPanel(vm.produtos.victoza); vm.pesquisarPrecoFixo(vm.produtos.victoza)"]
    Run Keyword And Ignore Error    Remover Banner
    Element Should Be Enabled       ${DetalhesMedicamentos.btnConfirmarTresiba}
    # Click    ${DetalhesMedicamentos.btnConfirmarTresiba}
    # Wait Until Element is Not Visible  id:loading-bar  ${TIMEOUT}
    # Sleep  5
    # Element Should Be Enabled       ${DetalhesMedicamentos.btnConfirmarTresiba}

é permitido que seja feita uma adesão de mais de um Medicamento
#aderir tresiba
    Click                          ${DetalhesMedicamentos.btnTresiba}
    Input                          ${DetalhesMedicamentos.inpCRMTresiba}          ${NUMERO_CRM}
    Select From List By Value      ${DetalhesMedicamentos.inpUfCRMTresiba}        ${UF_CRM}
    FOR  ${index}  IN RANGE  0  5
            Click                           ${DetalhesMedicamentos.btnPesquisarTresiba}
            Wait Until Element is Not Visible  id:loading-bar  ${TIMEOUT}
            Execute Javascript  window.scrollTo(0,document.body.scrollHeight)
            Run Keyword And Ignore Error    Scroll Element Into View        ${DetalhesMedicamentos.btnConfirmarTresiba}
            Click                           ${DetalhesMedicamentos.chkdiabetes1}
            ${status}  Run Keyword and Return Status  Element Should Be Enabled  ${DetalhesMedicamentos.btnConfirmarTresiba}
            Exit For Loop IF  ${status} == True

    END
    Run Keyword And Ignore Error    Scroll Element Into View        //*[@ng-click="vm.setPanel(vm.produtos.victoza); vm.pesquisarPrecoFixo(vm.produtos.victoza)"]
    Click    ${DetalhesMedicamentos.btnConfirmarTresiba}
    Wait Until Element Is Visible  ${DetalhesMedicamentos.modalSucesso}  ${TIMEOUT}
    Element Should Be Visible      ${DetalhesMedicamentos.modalSucesso}
    Wait Until Element Is Visible  ${DetalhesMedicamentos.btnFecharModal}  ${TIMEOUT}
    Click                          ${DetalhesMedicamentos.btnFecharModal}
    Sleep   5
#Aderir Victoza

    Run Keyword And Ignore Error    Scroll Element Into View       ${DetalhesMedicamentos.btnConcluir}
    Wait Until Element Is Visible      ${DetalhesMedicamentos.btnConcluir}
    Click                          ${DetalhesMedicamentos.btnVictoza}
    Input                          ${DetalhesMedicamentos.inpCRMVictoza}          ${NUMERO_CRM}
    Select From List By Value      ${DetalhesMedicamentos.inpUfCRMVictoza}        ${UF_CRM}
    FOR  ${index}  IN RANGE  0  5
            Click                           ${DetalhesMedicamentos.btnPesquisarVictoza}
            Wait Until Element is Not Visible  id:loading-bar  ${TIMEOUT}
            Run Keyword And Ignore Error    Scroll Element Into View        ${DetalhesMedicamentos.btnConfirmarVictoza}
             ${status}  Run Keyword and Return Status  Element Should Be Enabled  ${DetalhesMedicamentos.btnConfirmarVictoza}
             Exit For Loop IF  ${status} == True

    END
    Run Keyword And Ignore Error    Scroll Element Into View        //*[@ng-click="vm.setPanel(vm.produtos.saxenda); vm.pesquisarPrecoFixo(vm.produtos.saxenda)"]
    Click                          ${DetalhesMedicamentos.btnConfirmarVictoza}
    Wait Until Element Is Visible  ${DetalhesMedicamentos.modalSucesso}  ${TIMEOUT}
    Element Should Be Visible      ${DetalhesMedicamentos.modalSucesso}
    Wait Until Element Is Visible  ${DetalhesMedicamentos.btnFecharModal}  ${TIMEOUT}
    Click                          ${DetalhesMedicamentos.btnFecharModal}

sem aderir a nenhum produto

    Wait Until Element Is Visible    //*[@ng-click="vm.setPanel(vm.produtos.fiaspFlex); vm.pesquisarPrecoFixo(vm.produtos.fiaspFlex)"]
    # Scroll Element Into View        //*[@ng-click="vm.setPanel(vm.produtos.fiaspFlex); vm.pesquisarPrecoFixo(vm.produtos.fiaspFlex)"]
    # Wait Until Element Is Visible    //*[@ng-click="vm.setPanel(vm.produtos.novofine); vm.pesquisarPrecoFixo(vm.produtos.novofine)"]
    # Scroll Element Into View        //*[@ng-click="vm.setPanel(vm.produtos.novofine); vm.pesquisarPrecoFixo(vm.produtos.novofine)"]
    Execute JavaScript             window.scrollTo(0, document.body.scrollHeight)
    # Wait Until Element Is Visible    ${DetalhesMedicamentos.btnTresiba}
    # Click Element                        ${DetalhesMedicamentos.btnTresiba}
    Run Keyword And Ignore Error    Scroll Element Into View         ${DetalhesMedicamentos.btnVoltar}
    Wait Until Element Is Visible    ${DetalhesMedicamentos.btnVoltar}   ${TIMEOUT}
    Click Element                        ${DetalhesMedicamentos.btnConcluir}

é permitido que seja feita todas as adesões a medicações
    Click                          ${DetalhesMedicamentos.btnTresiba}
    Input                          ${DetalhesMedicamentos.inpCRMTresiba}          ${NUMERO_CRM}
    Select From List By Value      ${DetalhesMedicamentos.inpUfCRMTresiba}        ${UF_CRM}
    FOR  ${index}  IN RANGE  0  5
        Click                           ${DetalhesMedicamentos.btnPesquisarTresiba}
        Wait Until Element is Not Visible  id:loading-bar  ${TIMEOUT}
        Run Keyword And Ignore Error    Scroll Element Into View        ${DetalhesMedicamentos.btnConfirmarTresiba}
        Click                           ${DetalhesMedicamentos.chkdiabetes1}
        ${status}  Run Keyword and Return Status  Element Should Be Enabled  ${DetalhesMedicamentos.btnConfirmarTresiba}
        Exit For Loop IF  ${status} == True

        END
        Run Keyword And Ignore Error    Scroll Element Into View        //*[@ng-click="vm.setPanel(vm.produtos.victoza); vm.pesquisarPrecoFixo(vm.produtos.victoza)"]
        Click    ${DetalhesMedicamentos.btnConfirmarTresiba}
        Wait Until Element Is Visible  ${DetalhesMedicamentos.modalSucesso}  ${TIMEOUT}
        Element Should Be Visible      ${DetalhesMedicamentos.modalSucesso}
        Wait Until Element Is Visible  ${DetalhesMedicamentos.btnFecharModal}  ${TIMEOUT}
        Click                          ${DetalhesMedicamentos.btnFecharModal}
        Sleep   5
#Aderir Victoza

    Run Keyword And Ignore Error    Scroll Element Into View       ${DetalhesMedicamentos.btnConcluir}
    Wait Until Element Is Visible      ${DetalhesMedicamentos.btnConcluir}
    Click                          ${DetalhesMedicamentos.btnVictoza}
    Input                          ${DetalhesMedicamentos.inpCRMVictoza}          ${NUMERO_CRM}
    Select From List By Value      ${DetalhesMedicamentos.inpUfCRMVictoza}        ${UF_CRM}
    FOR  ${index}  IN RANGE  0  5
        Click                           ${DetalhesMedicamentos.btnPesquisarVictoza}
        Wait Until Element is Not Visible  id:loading-bar  ${TIMEOUT}
        Run Keyword And Ignore Error    Scroll Element Into View        ${DetalhesMedicamentos.btnConfirmarVictoza}
         ${status}  Run Keyword and Return Status  Element Should Be Enabled  ${DetalhesMedicamentos.btnConfirmarVictoza}
         Exit For Loop IF  ${status} == True

         END
        Run Keyword And Ignore Error     Scroll Element Into View        //*[@ng-click="vm.setPanel(vm.produtos.saxenda); vm.pesquisarPrecoFixo(vm.produtos.saxenda)"]
         Click    ${DetalhesMedicamentos.btnConfirmarVictoza}
         Wait Until Element Is Visible  ${DetalhesMedicamentos.modalSucesso}  ${TIMEOUT}
         Element Should Be Visible      ${DetalhesMedicamentos.modalSucesso}
         Wait Until Element Is Visible  ${DetalhesMedicamentos.btnFecharModal}  ${TIMEOUT}
         Click                          ${DetalhesMedicamentos.btnFecharModal}

#Aderir saxenda
    #
    # Scroll Element Into View       ${DetalhesMedicamentos.btnConcluir}
    # Wait Until Element Is Visible      ${DetalhesMedicamentos.btnConcluir}
    # Click                          ${DetalhesMedicamentos.btnSaxenda}
    # Input                          ${DetalhesMedicamentos.inpCRMSaxenda}          ${NUMERO_CRM}
    # Select From List By Value      ${DetalhesMedicamentos.inpUfCRMSaxenda}        ${UF_CRM}
    # Wait Until Element Is Visible   ${DetalhesMedicamentos.btnPesquisarSaxenda}
    #
    #
    #  FOR  ${index}  IN RANGE  0  5
    #     Click                           ${DetalhesMedicamentos.btnPesquisarSaxenda}
    #     Wait Until Element is Not Visible  id:loading-bar  60
    #     Scroll Element Into View        ${DetalhesMedicamentos.btnConfirmarSaxenda}
    #     ${status}  Run Keyword and Return Status  Element Should Be Enabled  ${DetalhesMedicamentos.btnConfirmarSaxenda}
    #     Exit For Loop IF  ${status} == True
    #
    #  END
    #    Wait Until Element Is Visible   ${DetalhesMedicamentos.btnConfirmarSaxenda}
    #    Execute JavaScript             window.scrollTo(0, document.body.scrollHeight)
    # # Scroll Element Into View        //*[@ng-click="vm.setPanel(vm.produtos.saxenda); vm.pesquisarPrecoFixo(vm.produtos.saxenda)"]
    #    Click    ${DetalhesMedicamentos.btnConfirmarSaxenda}
    #    Wait Until Element Is Visible  ${DetalhesMedicamentos.modalSucesso}  ${TIMEOUT}
    #    Element Should Be Visible      ${DetalhesMedicamentos.modalSucesso}
    #    Wait Until Element Is Visible  ${DetalhesMedicamentos.btnFecharModal}  ${TIMEOUT}
    #    Click                          ${DetalhesMedicamentos.btnFecharModal}

#Aderir Xultophy
   Run Keyword And Ignore Error     Scroll Element Into View       ${DetalhesMedicamentos.btnConcluir}
    Wait Until Element Is Visible      ${DetalhesMedicamentos.btnConcluir}
    Click                          ${DetalhesMedicamentos.btnXultophy}
    Input                          ${DetalhesMedicamentos.inpCRMXultophy}          ${NUMERO_CRM}
    Select From List By Value      ${DetalhesMedicamentos.inpUfCRMXultophy}        ${UF_CRM}
    Wait Until Element Is Visible   ${DetalhesMedicamentos.btnPesquisarXultophy}
    Run Keyword And Ignore Error    Scroll Element Into View        ${DetalhesMedicamentos.btnConfirmarXultophy}

    FOR  ${index}  IN RANGE  0  5
       Click                           ${DetalhesMedicamentos.btnPesquisarXultophy}
       Wait Until Element is Not Visible  id:loading-bar  60
       Run Keyword And Ignore Error    Scroll Element Into View        ${DetalhesMedicamentos.btnConfirmarXultophy}
       ${status}  Run Keyword and Return Status  Element Should Be Enabled  ${DetalhesMedicamentos.btnConfirmarXultophy}
       Exit For Loop IF  ${status} == True

    END
      Wait Until Element Is Visible   ${DetalhesMedicamentos.btnConfirmarXultophy}
      Execute JavaScript             window.scrollTo(0, document.body.scrollHeight)
   # Scroll Element Into View        //*[@ng-click="vm.setPanel(vm.produtos.saxenda); vm.pesquisarPrecoFixo(vm.produtos.saxenda)"]
      Click    ${DetalhesMedicamentos.btnConfirmarXultophy}
      Wait Until Element Is Visible  ${DetalhesMedicamentos.modalSucesso}  ${TIMEOUT}
      Element Should Be Visible      ${DetalhesMedicamentos.modalSucesso}
      Wait Until Element Is Visible  ${DetalhesMedicamentos.btnFecharModal}  ${TIMEOUT}
      Click                          ${DetalhesMedicamentos.btnFecharModal}
      Sleep     5
#Aderir Ozempic

    # Scroll Element Into View       ${DetalhesMedicamentos.btnConcluir}
    # Wait Until Element Is Visible      ${DetalhesMedicamentos.btnConcluir}
    Click                          ${DetalhesMedicamentos.btnOzempic}
    Input                          ${DetalhesMedicamentos.inpCRMOzempic}          ${NUMERO_CRM}
    Select From List By Value      ${DetalhesMedicamentos.inpUfCRMOzempic}        ${UF_CRM}
    Run Keyword And Ignore Error    Scroll Element Into View        ${DetalhesMedicamentos.btnConfirmarOzempic}
    Wait Until Element Is Visible   ${DetalhesMedicamentos.btnPesquisarOzempic}
    # Execute JavaScript             window.scrollTo(0, document.body.scrollHeight)

    FOR  ${index}  IN RANGE  0  5
       Click                           ${DetalhesMedicamentos.btnPesquisarOzempic}
       Wait Until Element is Not Visible  id:loading-bar  60
       Run Keyword And Ignore Error    Scroll Element Into View        ${DetalhesMedicamentos.btnConfirmarOzempic}
       ${status}  Run Keyword and Return Status  Element Should Be Enabled  ${DetalhesMedicamentos.btnConfirmarOzempic}
       Exit For Loop IF  ${status} == True

    END
      Wait Until Element Is Visible   ${DetalhesMedicamentos.btnConfirmarOzempic}
      Execute JavaScript             window.scrollTo(0, document.body.scrollHeight)
   # Scroll Element Into View        //*[@ng-click="vm.setPanel(vm.produtos.saxenda); vm.pesquisarPrecoFixo(vm.produtos.saxenda)"]
      Click    ${DetalhesMedicamentos.btnConfirmarOzempic}
      Wait Until Element Is Visible  ${DetalhesMedicamentos.modalSucesso}  ${TIMEOUT}
      Element Should Be Visible      ${DetalhesMedicamentos.modalSucesso}
      Wait Until Element Is Visible  ${DetalhesMedicamentos.btnFecharModal}  ${TIMEOUT}
      Click                          ${DetalhesMedicamentos.btnFecharModal}
      Sleep     5
#Aderir fiaspFlex
    Run Keyword And Ignore Error    Scroll Element Into View       ${DetalhesMedicamentos.btnConcluir}
    Wait Until Element Is Visible      ${DetalhesMedicamentos.btnConcluir}
    Click                          ${DetalhesMedicamentos.btnFiasp}
    Input                          ${DetalhesMedicamentos.inpCRMFiasp}          ${NUMERO_CRM}
    Select From List By Value      ${DetalhesMedicamentos.inpUfCRMFiasp}        ${UF_CRM}
    Wait Until Element Is Visible   ${DetalhesMedicamentos.btnPesquisarFiasp}
    Run Keyword And Ignore Error    Scroll Element Into View      ${DetalhesMedicamentos.btnPesquisarFiasp}
    FOR  ${index}  IN RANGE  0  5
       Click                           ${DetalhesMedicamentos.btnPesquisarFiasp}
       Wait Until Element is Not Visible  id:loading-bar  ${TIMEOUT}
       Run Keyword And Ignore Error    Scroll Element Into View        ${DetalhesMedicamentos.btnConfirmarFiasp}
       Click                           ${DetalhesMedicamentos.chkdiabetes2}
       ${status}  Run Keyword and Return Status  Element Should Be Enabled  ${DetalhesMedicamentos.btnConfirmarFiasp}
       Exit For Loop IF  ${status} == True
   #
  END

   #    Wait Until Element Is Visible   ${DetalhesMedicamentos.btnConfirmarFiasp}
   #    Execute JavaScript             window.scrollTo(0, document.body.scrollHeight)
   # # Scroll Element Into View        //*[@ng-click="vm.setPanel(vm.produtos.saxenda); vm.pesquisarPrecoFixo(vm.produtos.saxenda)"]
   #    Click    ${DetalhesMedicamentos.btnConfirmarFiasp}
   #    Wait Until Element Is Visible  ${DetalhesMedicamentos.modalSucesso}  ${TIMEOUT}
   #    Element Should Be Visible      ${DetalhesMedicamentos.modalSucesso}
   #    Wait Until Element Is Visible  ${DetalhesMedicamentos.btnFecharModal}  ${TIMEOUT}
   #    Click                          ${DetalhesMedicamentos.btnFecharModal}
   #    Sleep     5
