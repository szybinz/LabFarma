*** Settings ***
Library    SeleniumLibrary
Suite Setup       Dado que o usuário acessa a tela de associação de medicamentos
Suite Teardown    E fecha o navegador

*** Variables ***
${URL}    http://127.0.0.1:5500/medicamentos.html
${BROWSER}                chrome
${INPUT_IDOSO_ID}         id=idosoId
${INPUT_NOME}             id=nomeMedicamento
${INPUT_DOSAGEM}          id=dosagem
${INPUT_HORARIO}          id=horario
${BOTAO_ASSOCIAR}         id=btnAssociar
${MENSAGEM}               id=mensagemMedicamento

*** Test Cases ***
CT08 - Deve associar medicamento com dosagem no limite mínimo válido
    Dado que o usuário informa o id do idoso    5
    E informa o nome do medicamento    Dipirona
    E informa a dosagem    1
    E informa o horario    08:00
    Quando solicitar a associação
    Então o sistema deve apresentar a mensagem    Medicamento associado com sucesso

CTF08 - Deve bloquear dosagem igual a zero
    Dado que o usuário informa o id do idoso    5
    E informa o nome do medicamento    Dipirona
    E informa a dosagem    0
    E informa o horario    08:00
    Quando solicitar a associação
    Então o sistema deve apresentar a mensagem    A dosagem deve ser maior que zero.

*** Keywords ***
Dado que o usuário acessa a tela de associação de medicamentos
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    2s

Dado que o usuário informa o id do idoso
    [Arguments]    ${id}
    Input Text    ${INPUT_IDOSO_ID}    ${id}

E informa o nome do medicamento
    [Arguments]    ${nome}
    Input Text    ${INPUT_NOME}    ${nome}

E informa a dosagem
    [Arguments]    ${dosagem}
    Input Text    ${INPUT_DOSAGEM}    ${dosagem}

E informa o horario
    [Arguments]    ${horario}
    Input Text    ${INPUT_HORARIO}    ${horario}

Quando solicitar a associação
    Click Button    ${BOTAO_ASSOCIAR}

Então o sistema deve apresentar a mensagem
    [Arguments]    ${mensagem_esperada}
    Element Text Should Be    ${MENSAGEM}    ${mensagem_esperada}

E fecha o navegador
    Close Browser