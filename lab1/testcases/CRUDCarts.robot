*** Settings ***
Resource    ../ressources/keywords.robot
Suite Setup    Initialiser Connexion
Suite Teardown    Nettoyer Connexion

*** Test Cases ***
Test CRUD Cart Complet
    [Tags]    CRUD
    # Création
    ${CART_ID}    Creer Cart Et Logger    ${CART_TEST}
    
    # Lecture
    ${cart}    Recuperer Cart Et Logger    ${CART_ID}
    Should Be Equal As Strings    ${cart["date"]}    2020-03-02T00:00:00.000Z
    Should Be Equal As Numbers    ${cart["products"][0]["quantity"]}    4

    # Modification
    ${result}    Modifier Cart Et Logger    ${CART_ID}    ${UPDATE_CART}
    Should Be Equal As Numbers    ${result}    1

    # Vérification
    ${cart_updated}    Recuperer Cart Et Logger    ${CART_ID}
    Should Be Equal As Strings    ${cart_updated["date"]}    2020-03-03T00:00:00.000Z
    Should Be Equal As Numbers    ${cart_updated["products"][0]["quantity"]}    5

    # Suppression
    ${result}    Supprimer Cart Et Logger    ${CART_ID}
    Should Be Equal As Numbers    ${result}    1
Test Creation Cart Sans UserId (Non Passant)
    [Tags]    cart    non_passant
    Initialiser Connexion
    ${result}=    Run Keyword And Ignore Error    Creer Cart Et Logger    ${CART_SANS_USERID}
    Should Be Equal As Strings    ${result[0]}    FAIL
    Should Be Equal    ${result[1]}    ${None}
    Nettoyer Connexion