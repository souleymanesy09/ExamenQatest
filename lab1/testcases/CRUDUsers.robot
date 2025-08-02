*** Settings ***
Resource    ../ressources/keywords.robot
Suite Setup    Initialiser Connexion
Suite Teardown    Nettoyer Connexion

*** Test Cases ***
Test CRUD User Complet
    [Tags]    CRUD
    # Création
    ${USER_ID}    Creer User Et Logger    ${USER_TEST}
    
    # Lecture
    ${user}    Recuperer User Et Logger    ${USER_ID}
    Should Be Equal As Strings    ${user["name"]["firstname"]}    John
    Should Be Equal As Strings    ${user["address"]["city"]}    kilcoole

    # Modification
     #${result}    Modifier User Et Logger    ${USER_ID}    ${UPDATE_USER}
    # Should Be Equal As Numbers    ${result}    1

    # Vérification
     #${user_updated}    Recuperer User Et Logger    ${USER_ID}
     #Should Be Equal As Strings    ${user_updated["email"]}    john.doe@gmail.com
     #Should Be Equal As Strings    ${user_updated["address"]["city"]}    Dublin

    # Suppression
     #${result}    Supprimer User Et Logger    ${USER_ID}
     #Should Be Equal As Numbers    ${result}    1
 Test Creation User Sans Zipcode (Non Passant)
    [Tags]    user    negatif
    ${status_code}    Creer User Et Logger    ${USER_SANS_ZIPCODE}
    Should Be Equal As Strings    ${status_code}    400
    Log    Test réussi : l'utilisateur sans zipcode a bien été rejeté.

Test Creation User Sans Firstname (Non Passant)
    [Tags]    user    negatif
    ${erreur}=    Run Keyword And Expect Error    *    Creer User Et Logger    ${USER_SANS_FIRSTNAME}
    Log    Test réussi : l'utilisateur sans firstname a bien été rejeté.
