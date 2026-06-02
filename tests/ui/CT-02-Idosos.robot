*** Settings ***
Library    SeleniumLibrary
Suite Setup       Abrir Navegador
Suite Teardown    Fechar Navegador

*** Variables ***
${URL}        http://127.0.0.1:5500/idosos.html
${BROWSER}    chrome

*** Test Cases ***
CT02.1 - Cadastro com Nome Valido
    Input Text      id=nome      Maria Silva
    Input Text      id=idade     65
    Click Button    id=btnSalvar
    Wait Until Page Contains    Idoso cadastrado com sucesso

CT02.2 - Nome com Numeros
    Input Text      id=nome      Maria123
    Input Text      id=idade     65
    Click Button    id=btnSalvar
    Wait Until Page Contains    O nome do idoso deve conter apenas caracteres alfabéticos.

CT02.3 - Nome Vazio
    Input Text      id=nome      ${EMPTY}
    Input Text      id=idade     65
    Click Button    id=btnSalvar
    Wait Until Page Contains    O nome do idoso é obrigatório.

CT02.4 - Nome Apenas Espacos
    Input Text      id=nome      ${SPACE}
    Input Text      id=idade     65
    Click Button    id=btnSalvar
    Wait Until Page Contains    O nome do idoso é obrigatório.

*** Keywords ***
Abrir Navegador
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Fechar Navegador
    Close Browser