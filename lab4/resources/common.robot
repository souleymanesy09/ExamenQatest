*** Settings ***
Library         AppiumLibrary
Variables       ../po/variables.py
Variables       ../po/locator.py

*** Keywords ***
Open Application MyApp
    Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    automationName=${AUTOMATION_NAME}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    ...    noReset=true

Enter username
    Wait Until Page Contains Element    ${USERNAME}    10s
    Click Element                       ${USERNAME}
    Clear Text                          ${USERNAME}
    Input Text                          ${USERNAME}    johnd

Enter password
    Wait Until Page Contains Element    ${PASSWORD}    10s
    Click Element                       ${PASSWORD}
    Clear Text                          ${PASSWORD}
    Input Password                      ${PASSWORD}    m38rmF$

Log In
    Wait Until Page Contains Element    ${LOGIN}    10s
    Click Element                       ${LOGIN}
    Wait Until Page Contains Element    ${PAGE_FORM}    10s

Fill the Form
    Wait Until Element Is Visible    ${FORM_TITLE}     10s
    Click Element                    ${FORM_TITLE}
    Input Text                       ${FORM_TITLE}     Double Cheese Burger  

    Wait Until Element Is Visible    ${FORM_PRICE}     10s
    Click Element                    ${FORM_PRICE}
    Input Text                       ${FORM_PRICE}     2000 

    Wait Until Element Is Visible    ${FORM_DESCRIPTION}   10s
    Click Element                    ${FORM_DESCRIPTION}
    Input Text                       ${FORM_DESCRIPTION}   Meilleure offre du mois 

    Wait Until Element Is Visible    ${FORM_CATEGORIE}     10s
    Click Element                    ${FORM_CATEGORIE}
    Input Text                       ${FORM_CATEGORIE}     Burgers

    Wait Until Element Is Visible    ${FORM_URL}           10s
    Click Element                    ${FORM_URL}
    Input Text                       ${FORM_URL}           https://image.example.com/burger.png 

    Wait Until Element Is Visible    ${FORM_BUTTON_ADD}    10s
    Click Element                    ${FORM_BUTTON_ADD}

# NOUVEAU MOT-CLÉ, basé sur votre exemple d'image
Check Product
    Wait Until Page Contains Element    ${PRODUCTS_LIST_PAGE_TITLE}    5s
    Click Element                       ${EXISTING_PRODUCT_VISIBLE}
    
