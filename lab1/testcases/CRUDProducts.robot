*** Settings ***
Resource    ../ressources/keywords.robot
Variables    ../pageobject/variables.py
Suite Setup    Initialiser Connexion
Suite Teardown    Nettoyer Connexion

*** Test Cases ***
Test CRUD Product Complet
    [Tags]    CRUD
    # Création
    ${PRODUCT_ID}    Creer Produit Et Logger    ${PRODUCT_TEST}
    
    # Lecture
    ${product}    Recuperer Produit Et Logger    ${PRODUCT_ID}
    Should Be Equal As Strings    ${product["title"]}    Fjallraven - Foldsack No. 1 Backpack
    Should Be Equal As Numbers    ${product["price"]}    109.95
    Should Be Equal As Numbers    ${product["rating"]["rate"]}    3.9

    # Modification
    #${result}    Modifier Produit Et Logger    ${PRODUCT_ID}    ${UPDATE_PRODUCT}
    #Should Be Equal As Numbers    ${result}    1

    # Vérification
    ${product_updated}    Recuperer Produit Et Logger    ${PRODUCT_ID}
    #Should Be Equal As Numbers    ${product_updated["price"]}    99.95
    #Should Be Equal As Numbers    ${product_updated["rating"]["rate"]}    4.2

    # Suppression
    #${result}    Supprimer Produit Et Logger    ${PRODUCT_ID}
    #Should Be Equal As Numbers    ${result}    1

Test Creation Produit Sans Description (Non Passant)
    [Tags]    produit    negatif
    ${response}    Create Product    ${PRODUCT_SANS_DESCRIPTION}
    Should Be Equal As Integers    ${response.status_code}    400
    Log    Test réussi : le produit sans description a bien été rejeté.

Test Creation Produit Prix Négatif (Non Passant)
    [Tags]    produit    negatif
    ${status_code}    Create Product    ${PRODUCT_PRIX_NEGATIF}
    Should Be Equal As Strings    ${status_code}    400
    Log    Test réussi : le produit avec prix négatif a bien été rejeté.