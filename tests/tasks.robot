*** Settings ***

Documentation    Suite de testes de cadastro de tarefas

Resource    ../resources/base.resource

Test Setup       Start session
Test Teardown    Finish session

*** Test Cases ***
Deve poder cadastrar uma nova tarefa
    ${task}    Set Variable    Estudar mais sobre XPath
    
    Remove task form database    ${task}
    
    Do login

    Create a new task    ${task}
    Should have task     ${task}

Deve poder remover uma tarefa indesejada
    [Tags]    remove

    ${task}    Set Variable    Estudar React

    Remove task form database    ${task}

    Do login
    Create a new task    ${task}
    Should have task     ${task}

    Remove task by name                 ${task}
    Wait Until Page Does Not Contain    ${task}

Deve poder concluir uma tarefa
    [Tags]    done

    ${task}    Set Variable    Estudar Appium

    Remove task form database    ${task}

    Do login
    Create a new task    ${task}
    Should have task     ${task}

    Finish task            ${task}
    Task should be done    ${task}