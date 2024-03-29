*** Settings ***
Resource    ../resource/addresses_resource.robot

*** Variables ***

# Utilizado para escrever variáveis estáticas, xpath, variáveis globais

*** Test Cases ***

Validação quantidade de elemementos
    ${response}    GET Endereço    quantidade=2
    GET Endereço - Validação Quantidade    quantidade=2    GET_RESPONSE=${response}

    ${response}    GET Endereço    quantidade=5
    GET Endereço - Validação Quantidade    quantidade=5    GET_RESPONSE=${response}

    ${response}    GET Endereço    quantidade=11
    GET Endereço - Validação Quantidade    quantidade=11    GET_RESPONSE=${response}

Validando em qual hemisfério a cidade está
    ${response}    GET Endereço    quantidade=5
    GET Endereço - Validação Localização    quantidade=5   GET_RESPONSE=${response}
