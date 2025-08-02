*** Settings ***
Resource    ../ressources/keywords.robot
Suite Setup    Initialiser Connexion
Suite Teardown    Nettoyer Connexion

*** Test Cases ***
Test CRUD Category Complet
    [Tags]    CRUD
    # Création
    ${CATEGORY_ID}    Creer Category Et Logger    ${CATEGORY_TEST}
    
    # Lecture
    ${category}    Recuperer Category Et Logger    ${CATEGORY_ID}
    Should Be Equal As Strings    ${category["name"]}    men's clothing
    Should Be Equal As Strings    ${category["description"]}    Articles destinés aux hommes

    # Modification
    ${result}    Modifier Category Et Logger    ${CATEGORY_ID}    ${UPDATE_CATEGORY}
    Should Be Equal As Numbers    ${result}    1

    # Suppression
    ${result}    Supprimer Category Et Logger    ${CATEGORY_ID}
    Should Be Equal As Numbers    ${result}    1
