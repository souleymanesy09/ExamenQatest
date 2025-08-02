***Settings***
Resource    ../resources/common_keywords.robot      # Importe les mots-clés d'ouverture/fermeture de navigateur
Resource    ../pageobject/authentication_page.robot     # Importe les mots-clés de connexion
Resource    ../pageobject/customers_page.robot      # Importe les mots-clés spécifiques aux clients
Library     SeleniumLibrary
Variables   ../pageobject/variables.py              # Importe les variables globales

# REMARQUE : Les mots-clés 'Open Browser To CRM Page' et 'Close CRM Browser'
# ne doivent PAS être définis ici. Ils sont importés via common_keywords.robot.

***Test Cases***
1005 Customers Page Should Display Multiple Customers
    [Documentation]    Vérifie que la page des clients affiche plusieurs enregistrements.
    [Tags]    Smoke    Customers
    Open Browser To CRM Page
    Click Element               ${CommonElements.SIGN_IN_LINK}
    Login With Credentials      ${VALID_EMAIL}    ${VALID_PASSWORD}
    Wait Until Location Contains    /customers.html    timeout=${TIMEOUT_MEDIUM}
    Verify Multiple Customers Displayed
    Close CRM Browser

1006 Should Be Able To Add New Customer
    [Documentation]    Teste la création d'un nouveau client avec des données valides.
    [Tags]    Functional    Customers
    Open Browser To CRM Page
    Click Element               ${CommonElements.SIGN_IN_LINK}
    Login With Credentials      ${VALID_EMAIL}    ${VALID_PASSWORD}
    Wait Until Location Contains    /customers.html    timeout=${TIMEOUT_MEDIUM}

    Click New Customer Button     # Ouvre le formulaire d'ajout
    Fill Customer Form          new.customer@example.com    Jean    Dupont    Paris    NY    Male    ${True}     # Remplit le formulaire
    Click Add Customer Submit Button     # Soumet le formulaire et gère déjà la vérification de la page de succès
    Page Should Contain Element    ${CommonElements.LOGOUT_LINK}     # Vérifie la présence du lien de déconnexion après l'ajout
    Close CRM Browser

1007 Should Be Able To Cancel Adding New Customer
    [Documentation]    Vérifie que l'ajout d'un nouveau client peut être annulé.
    [Tags]    Functional    Customers
    Open Browser To CRM Page
    Click Element               ${CommonElements.SIGN_IN_LINK}
    Login With Credentials      ${VALID_EMAIL}    ${VALID_PASSWORD}
    Wait Until Location Contains    /customers.html    timeout=${TIMEOUT_MEDIUM}

    Click New Customer Button     # Ouvre le formulaire d'ajout
    Fill Customer Form          cancel.customer@example.com    Marie    Durand    Lyon    NY    Female     # Remplit le formulaire
    Click Add Customer Cancel Button     # Annule l'ajout et gère le retour à la page clients
    Wait Until Location Contains    /customers.html    timeout=${TIMEOUT_MEDIUM}     # Vérifie le retour à la page des clients
    Title Should Be    Customers     # Le titre de la page doit être "Customers"
    Close CRM Browser