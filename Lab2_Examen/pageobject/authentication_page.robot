# pageobject/authentication_page.robot

***Settings***
Library    SeleniumLibrary
Variables  ../pageobject/locator.py
Variables  ../pageobject/variables.py     # Très important d'importer les variables ici aussi pour les TIMEOUTs

***Keywords***
Input Email Address
    [Arguments]    ${email}
    [Documentation]    Saisit l'adresse email dans le champ correspondant
    Input Text    ${LoginPageLocators.EMAIL_FIELD}    ${email}

Input Password
    [Arguments]    ${password}
    [Documentation]    Saisit le mot de passe dans le champ correspondant
    Input Text    ${LoginPageLocators.PASSWORD_FIELD}    ${password}

Click Submit Button
    [Documentation]    Clique sur le bouton de soumission
    Click Element    ${LoginPageLocators.SUBMIT_BUTTON}

Verify Login Page Elements Are Displayed
    [Documentation]    Vérifie que tous les éléments de la page de login sont visibles
    Wait Until Page Contains Element    ${LoginPageLocators.EMAIL_FIELD}    timeout=${TIMEOUT_MEDIUM}
    Page Should Contain Element         ${LoginPageLocators.PASSWORD_FIELD}
    Page Should Contain Element         ${LoginPageLocators.SUBMIT_BUTTON}

Login With Credentials
    [Arguments]    ${email}    ${password}
    [Documentation]    Effectue une connexion complète avec email et mot de passe
    Input Email Address    ${email}
    Input Password         ${password}
    Click Submit Button
    Wait Until Location Contains    /customers.html    timeout=${TIMEOUT_MEDIUM}