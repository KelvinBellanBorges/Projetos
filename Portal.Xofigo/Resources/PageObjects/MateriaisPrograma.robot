*** Settings ***
Library     SeleniumLibrary
 
*** Keywords ***
fazer login paciente MD
    AcessarPerfilPaciente.acesso a minha area paciente
    AcessarPerfilPaciente.acesso a Area Restrita paciente
    Sleep                                      5

abre a tela verifica campos e fazer os Downloads
    Click                                      ${MateriaisPrograma.matDigital}
    Wait Until Element Is Visible              ${MateriaisPrograma.msgMatDigital}
 
    Click Element                              ${MateriaisPrograma.dow2}
    Switch Window                              New
    Close Window                               
    Switch Window

    Click Element                              ${MateriaisPrograma.dow3}
    Switch Window                              New
    Close Window
    Switch Window

    Click Element                              ${MateriaisPrograma.dow4}
    Switch Window                              New
    Close Window
    Switch Window
    
    Click Element                              ${MateriaisPrograma.dow5}
    Switch Window                              New
    Close Window
    Switch Window

    Click Element                              ${MateriaisPrograma.dow6}
    Switch Window                              New
    Close Window
    Switch Window
    Sleep                                     2

#  NEXT
    Click Element                              ${MateriaisPrograma.nextDireita}
    Click Element                              ${MateriaisPrograma.nextDireita}
    Sleep                                      2
    Click Element                              ${MateriaisPrograma.dow7}
    Switch Window                              New
    Close Window
    Switch Window

    Click Element                              ${MateriaisPrograma.nextDireita}  
    Sleep                                      2
    Click Element                              ${MateriaisPrograma.dow8}
    Switch Window                              New
    Close Window
    Switch Window
    
    Click Element                              ${MateriaisPrograma.nextDireita}
    Sleep                                      2
    Click Element                              ${MateriaisPrograma.dow9}
    Switch Window                              New
    Close Window
    Switch Window
    Sleep                                      2

    Click Element                              ${MateriaisPrograma.nextDireita}
    Sleep                                      2
    Click Element                              ${MateriaisPrograma.nextDireita}
    Click Element                              ${MateriaisPrograma.dow10}
    Switch Window                              New
    Close Window
    Switch Window
    
    Click Element                              ${MateriaisPrograma.nextDireita}
    Sleep                                      2
    Click Element                              ${MateriaisPrograma.dow11}
    Switch Window                              New
    Close Window
    Switch Window