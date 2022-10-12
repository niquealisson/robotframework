*** Settings ***
Library    SeleniumLibrary


*** Variables ***
#Dados do teste 
${NomeDaMusica}    180 Alok

#Variaveis de configuração
${URL}        https://www.youtube.com/
${Browser}    chrome

#Elementos
${Input_Pesquisa}     //input[@id="search"]
${Button_Pesquisa}    //button[@id="search-icon-legacy"]
${Primeiro}           (//yt-formatted-string[@class="style-scope ytd-video-renderer"])[1]
${Prova}              //yt-formatted-string[contains(text(),"Compartilhar")]

*** Keywords ***

Dado que eu acesso o youtube
    Open Browser     ${URL}               ${Browser}

Quando digito o nome da musica
    Input Text       ${Input_Pesquisa}    ${NomeDaMusica}

E clico no botão buscar
    Click Element    ${Button_Pesquisa}

E clico na primeira opção da lista
    Wait Until Element Is Visible         ${Primeiro}    10
    Click Element    ${Primeiro}

Então o video é executado
    Wait Until Element Is Visible         ${Prova}       10 
    Element Should Be Visible             ${Prova}
    Sleep                                 1s
    Close Browser

*** Test Cases ***
Cénario 1: Executar Video no Site do Youtube
    Dado que eu acesso o youtube 
    Quando digito o nome da musica
    E clico no botão buscar
    E clico na primeira opção da lista
    Então o video é executado
