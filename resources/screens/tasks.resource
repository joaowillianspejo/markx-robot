*** Settings ***

Documentation    Elementos e ações da tela de tarefas

Library    AppiumLibrary

*** Variables ***

${new_task_input}    xpath=//android.widget.EditText[contains(@text, "nova tarefa")]
${create_button}     xpath=//*[@resource-id="createTask"]

*** Keywords ***

Create a new task
    [Arguments]    ${task_name}

    Wait Until Element Is Visible    ${new_task_input}    5

    Input Text       ${new_task_input}    ${task_name}
    Click Element    ${create_button}

Should have task
    [Arguments]    ${task_name}

    Wait Until Page Contains Element
    ...    xpath=//*[@resource-id="taskText"][@text="${task_name}"]
    ...    10
   
Remove task by name
    [Arguments]    ${task_name}

    Click Element    xpath=//*[@resource-id="taskText"][@text="${task_name}"]/../..//*[@resource-id="removeTask"]

    ${yes_button}    Set Variable    xpath=//android.widget.Button[@text="SIM"]

    Wait Until Element Is Visible    ${yes_button}    5
    Click Element                    ${yes_button}

Finish task
    [Arguments]    ${task_name}

    Click Element    xpath=//*[@resource-id="taskText"][@text="${task_name}"]/..

Task should be done
    [Arguments]    ${task_name}

    Wait Until Element Is Visible    xpath=//*[@resource-id="taskText"][@text="${task_name}"]/..//android.widget.ImageView