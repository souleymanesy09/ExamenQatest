# testcases/login_tests.robot

***Settings***
Resource    ../resources/common_keywords.robot
Resource    ../pageobject/authentication_page.robot
Library     SeleniumLibrary
Variables   ../pageobject/variables.py

***Test Cases***
1001 Home Page Should Load
    [Documentation]    Vérifie que la page d'accueil se charge correctement et contient les éléments attendus.
    Open Browser To CRM Page
    Title Should Be    Customer Service
    Page Should Contain Element    ${CommonElements.SIGN_IN_LINK}
    Close CRM Browser

1002 Login Successfully With Valid Credentials
    [Documentation]    Teste la connexion réussie avec des identifiants valides.
    Open Browser To CRM Page
    Click Element               ${CommonElements.SIGN_IN_LINK}
    Login With Credentials      ${VALID_EMAIL}    ${VALID_PASSWORD}
    Wait Until Location Contains    /customers.html    timeout=${TIMEOUT_MEDIUM}
    Title Should Be    Customers
    Page Should Contain    Our Happy Customers
    Close CRM Browser

1003 Login Should Fail With Missing Credentials
    [Documentation]    Teste la connexion échouée lorsque les identifiants sont manquants.
    Open Browser To CRM Page
    Click Element               ${CommonElements.SIGN_IN_LINK}
    Click Element               ${LoginPageLocators.SUBMIT_BUTTON}
    Wait Until Location Contains    /login.html    timeout=${TIMEOUT_MEDIUM}
    Page Should Contain    Login
    ${current_url}=    Get Location
    Should Not Contain    ${current_url}    /customers.html
    Close CRM Browser

1004 Should Be Able To Log Out
    [Documentation]    Vérifie que l'utilisateur peut se déconnecter avec succès.
    Open Browser To CRM Page
    Click Element               ${CommonElements.SIGN_IN_LINK}
    Login With Credentials      ${VALID_EMAIL}    ${VALID_PASSWORD}
    Wait Until Location Contains    /customers.html    timeout=${TIMEOUT_MEDIUM}
    Click Element               ${CommonElements.LOGOUT_LINK}
    # MODIFICATION : Vérifier que l'on arrive sur la page de déconnexion
    Wait Until Location Contains    /sign-out.html    timeout=${TIMEOUT_MEDIUM}
    # NOUVELLE ÉTAPE : Cliquer sur le lien "Customer Service" pour retourner à l'accueil
    Click Element               link:Customer Service
    # MODIFICATION : Vérifier que l'on est bien de retour sur la page d'accueil
    Wait Until Location Contains    /index.html    timeout=${TIMEOUT_MEDIUM}
    Page Should Contain Element    ${CommonElements.SIGN_IN_LINK}
    Close CRM Browser

1005 "Remember Me" Checkbox Should Persist Email Address
    [Documentation]    Vérifie que l'email est pré-rempli après déconnexion si "Remember Me" est coché.
    Open Browser To CRM Page
    Click Element               ${CommonElements.SIGN_IN_LINK}
    Input Email Address         ${VALID_EMAIL}
    Input Password              ${VALID_PASSWORD}
    Select Checkbox             ${LoginPageLocators.REMEMBER_ME_CHECKBOX}
    Click Element               ${LoginPageLocators.SUBMIT_BUTTON}
    Wait Until Location Contains    /customers.html    timeout=${TIMEOUT_MEDIUM}
    Click Element               ${CommonElements.LOGOUT_LINK}
    # MODIFICATION : Vérifier que l'on arrive sur la page de déconnexion
    Wait Until Location Contains    /sign-out.html    timeout=${TIMEOUT_MEDIUM}
    # NOUVELLE ÉTAPE : Cliquer sur le lien "Customer Service" pour retourner à l'accueil
    Click Element               link:Customer Service
    # MODIFICATION : Vérifier que l'on est bien de retour sur la page d'accueil
    Wait Until Location Contains    /index.html    timeout=${TIMEOUT_MEDIUM}
    Click Element               ${CommonElements.SIGN_IN_LINK}
    Wait Until Page Contains Element    ${LoginPageLocators.EMAIL_FIELD}    timeout=${TIMEOUT_MEDIUM}
    Textfield Value Should Be    ${LoginPageLocators.EMAIL_FIELD}    ${VALID_EMAIL}
    Close CRM Browser

Verify CRM Login Page Is Displayed After Clicking Sign In
    [Documentation]    Vérifie l'affichage correct des éléments de la page de connexion après avoir cliqué sur 'Sign In'.
    Open Browser To CRM Page
    Title Should Be    Customer Service
    Page Should Contain Element    ${CommonElements.SIGN_IN_LINK}
    Click Element               ${CommonElements.SIGN_IN_LINK}
    Verify Login Page Elements Are Displayed
    Close CRM Browser