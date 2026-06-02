*** Settings ***
Library    SeleniumLibrary
Suite Setup       Abrir Navegador
Suite Teardown    Fechar Navegador

*** Variables ***
${URL}        http://127.0.0.1:5500/medicamentos.html
${BROWSER}    chrome

*** Test Cases ***
CT-03.1 - Cadastro Medicamento com Sucesso
    Input Text      id=idosoId            1
    Input Text      id=nomeMedicamento    Dipirona
    Input Text      id=dosagem            500
    Input Text      id=horario            08:00
    Click Button    id=btnAssociar
    Wait Until Page Contains    Medicamento associado com sucesso

CT-03.2 - Validacao Dosagem Obrigatoria
    Input Text      id=idosoId            1
    Input Text      id=nomeMedicamento    Dipirona
    Input Text      id=dosagem            0
    Input Text      id=horario            08:00
    Click Button    id=btnAssociar
    Wait Until Page Contains    A dosagem deve ser maior que zero

*** Keywords ***
Abrir Navegador
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Fechar Navegador
    Close Browser