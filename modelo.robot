*** Settings *** 

Library  SeleniumLibrary

* Variables *
${input_name}         //input[@id="name"]
${input_phone}        //input[@id="phone"]
${input_email}        //input[@id="email"]
${input_password}     //input[@id="password"]
${textarea_address}   //textarea[@id="address"]
${button_submit}      //button[@name="submit"]


* Keywords *
Abrir Site
    Open Browser  https://itera-qa.azurewebsites.net/home/automation  chrome
preencher campos
    Input Text        ${input_name}          Nique
    Sleep             1s
    Input Text        ${input_phone}         7187878787
    Sleep             1s        
    Input Text        ${input_email}         nique@teste.com
    Sleep             1s
    Input Text        ${input_password}      123567
    Sleep             1s
    Input Text        ${textarea_address}    xxxxxxxxxxxxxxxxx

clicar em submit
    Click Element     ${button_submit}

fechar Navegador
    Close Browser

* Test Cases *
Cenário 1: Peencher formulario
    Abrir Site
    preencher campos
    clicar em submit
    fechar Navegador
