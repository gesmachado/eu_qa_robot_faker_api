# Todo esse aquivo é uma SUITE DE TESTE / SCRIPT DE TESTE

*** Settings ***
Library               RequestsLibrary


*** Variables ***

# Utilizado para escrever variáveis estáticas, xpath, variáveis globais

*** Keywords ***

GET Endereço
    [Arguments]    ${quantidade}
    Create Session    alias=faker_api    url=https://fakerapi.it/api/v1

    ${RESPONSE}    GET On Session    alias=faker_api    url=/addresses?_quantity=${quantidade}
    
    Log To Console    ${RESPONSE.json()}

    [Return]    ${RESPONSE}

GET Endereço - Validação Quantidade
    [Arguments]    ${quantidade}    ${GET_RESPONSE}

    ${var}    Set Variable    ${GET_RESPONSE.json()['total']}    
    Log To Console    ${GET_RESPONSE.json()['total']}

    ${var}    Convert To String    ${var}

    Should Be Equal    ${quantidade}    ${var}

GET Endereço - Validação Localização
    [Arguments]    ${quantidade}    ${GET_RESPONSE}

    ${var}    Set Variable    ${GET_RESPONSE.json()['data']}    
    # Log To Console    ${GET_RESPONSE_ADDRESSE.json()['data']}

        

    FOR  ${i}  IN RANGE     ${quantidade}
        Log To Console    **** Elemento número ${i} ****
        # Log To Console    ${GET_RESPONSE.json()['data'][${i}]} 

        ${latitude}    Set Variable    ${GET_RESPONSE.json()['data'][${i}]['latitude']}
        ${longitude}    Set Variable    ${GET_RESPONSE.json()['data'][${i}]['longitude']}

        ${resp_latitude}    Validação Latitude    ${latitude}

        ${resp_longitude}    Validação Longitude    ${longitude}

        ${country}    Set Variable    ${GET_RESPONSE.json()['data'][${i}]['country']}


        Log To Console    ${country} - ${resp_latitude} - ${resp_longitude}
    END
    
Validação Latitude
    [Arguments]     ${latitude}
    
    IF    ${latitude}>0
        # Log To Console    Hemisfério Norte
        ${Return}    Set Variable     Hemisfério Norte
    ELSE IF    ${latitude}<0
        # Log To Console    Hemisfério Sul
        ${Return}    Set Variable    Hemisfério Sul
    ELSE
        # Log To Console    Em cima da Linha do Equador
        ${Return}    Set Variable    Em cima da Linha do Equador
    END

    [Return]    ${Return}

Validação Longitude
    [Arguments]     ${longitude}

        IF    ${longitude}>0
        # Log To Console    Hemisfério Oriental
        ${Return}    Set Variable     Hemisfério Oriental
    ELSE IF    ${longitude}<0
        # Log To Console    Hemisfério Ocidental
        ${Return}    Set Variable    Hemisfério Ocidental
    ELSE
        # Log To Console    Em cima do Meridianto de Greenwich
        ${Return}    Set Variable    Em cima do Meridianto de Greenwich
    END

    [Return]    ${Return}