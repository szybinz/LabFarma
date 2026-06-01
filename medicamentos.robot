*** Settings ***
Library    SeleniumLibrary

Suite Setup       Dado que o usuário acessa a tela de associação de medicamentos
Suite Teardown    E fecha o navegador

*** Variables ***
${URL}                    file:///C:/Users/makio/LabFarma/medicamentos.html
${BROWSER}                chrome
${INPUT_IDOSO_ID}         id=idosoId
${INPUT_NOME}             id=nomeMedicamento
${INPUT_DOSAGEM}          id=dosagem
${INPUT_HORARIO}          id=horario
${BOTAO_ASSOCIAR}         id=btnAssociar
${MENSAGEM}               id=mensagemMedicamento

*** Test Cases ***
CT03 - Deve associar medicamento com ID de idoso válido
    Dado que o usuário informa o id do idoso    5
    E informa o nome do medicamento    Paracetamol
    E informa a dosagem    500
    E informa o horario    14:30
    Quando solicitar a associação
    Então o sistema deve apresentar a mensagem    Medicamento associado com sucesso

CTF03 - Deve bloquear associação com ID de idoso vazio
    Dado que o usuário informa o id do idoso    ${EMPTY}
    E informa o nome do medicamento    Paracetamol
    E informa a dosagem    500
    E informa o horario    14:30
    Quando solicitar a associação
    Então o sistema deve apresentar a mensagem    Todos os campos (idosoId, nomeMedicamento, horario) são obrigatórios.

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

CT13 - Deve bloquear associação sem nome do medicamento
    Dado que o usuário informa o id do idoso    5
    E informa o nome do medicamento    ${EMPTY}
    E informa a dosagem    500
    E informa o horario    14:30
    Quando solicitar a associação
    Então o sistema deve apresentar a mensagem    Todos os campos (idosoId, nomeMedicamento, horario) são obrigatórios.

CTF13 - Deve associar medicamento com todos os campos preenchidos corretamente
    Dado que o usuário informa o id do idoso    5
    E informa o nome do medicamento    Amoxicilina
    E informa a dosagem    250
    E informa o horario    12:00
    Quando solicitar a associação
    Então o sistema deve apresentar a mensagem    Medicamento associado com sucesso

*** Keywords ***
Dado que o usuário acessa a tela de associação de medicamentos
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

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