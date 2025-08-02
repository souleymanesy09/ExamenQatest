# resources/common_keywords.robot

***Settings***
Library    SeleniumLibrary
Variables  ../pageobject/variables.py  # Importe les variables globales

***Keywords***
Open Browser To CRM Page
    [Documentation]    Ouvre le navigateur et accède à la page CRM
    Open Browser    ${CRM_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5      # Ralentit un peu l'exécution pour la visibilité
    Set Selenium Implicit Wait    ${TIMEOUT_MEDIUM}     # Attente implicite pour la recherche d'éléments

Close CRM Browser
    [Documentation]    Ferme le navigateur CRM
    Close Browser