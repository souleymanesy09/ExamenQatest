***Settings***
Library    SeleniumLibrary
Variables  ../pageobject/locator.py
Variables  ../pageobject/variables.py     # S'assure que les variables de timeout sont importées

***Keywords***
Click New Customer Button
    [Documentation]    Clique sur le bouton "Nouveau client"
    Click Element    ${CustomersPageLocators.NEW_CUSTOMER_BUTTON}
    # CORRECTION CRUCIALE DE L'URL (Tiret dans 'add-customer')
    Wait Until Location Contains    /add-customer.html    timeout=${TIMEOUT_MEDIUM}
    Wait Until Page Contains    Add Customer    timeout=${TIMEOUT_SHORT}

Fill Customer Form
    [Arguments]    ${email}    ${firstName}    ${lastName}    ${city}    ${state}    ${gender}    ${promotion}=${False}
    [Documentation]    Remplit le formulaire d'ajout de client
    Input Text    ${AddCustomerPageLocators.ADD_CUSTOMER_EMAIL_FIELD}    ${email}
    Input Text    ${AddCustomerPageLocators.ADD_CUSTOMER_FIRST_NAME_FIELD}    ${firstName}
    Input Text    ${AddCustomerPageLocators.ADD_CUSTOMER_LAST_NAME_FIELD}    ${lastName}
    Input Text    ${AddCustomerPageLocators.ADD_CUSTOMER_CITY_FIELD}    ${city}
    Select From List By Value    ${AddCustomerPageLocators.ADD_CUSTOMER_STATE_DROPDOWN}    ${state}

    # Les arguments du keyword Select Radio Button sont le nom du groupe (gender) et la valeur du bouton
    Run Keyword If    '${gender}' == 'Male'    Select Radio Button    gender    ${AddCustomerPageLocators.ADD_CUSTOMER_GENDER_MALE_RADIO}
    Run Keyword If    '${gender}' == 'Female'   Select Radio Button    gender    ${AddCustomerPageLocators.ADD_CUSTOMER_GENDER_FEMALE_RADIO}

    Run Keyword If    ${promotion} == ${True}    Select Checkbox    ${AddCustomerPageLocators.ADD_CUSTOMER_PROMOTION_CHECKBOX}

Click Add Customer Submit Button
    [Documentation]    Soumet le formulaire d'ajout de client
    Click Button    ${AddCustomerPageLocators.ADD_CUSTOMER_SUBMIT_BUTTON}
    # Maintenant que nous avons l'URL exacte, nous allons l'utiliser.
    # L'application redirige vers customer-success.html (avec un tiret !)
    Wait Until Location Contains    /customer-success.html    timeout=${TIMEOUT_MEDIUM}     # Remettant TIMEOUT_MEDIUM
    # Vérifions le message de succès sur cette page
    Wait Until Page Contains    Success! New customer added.    timeout=${TIMEOUT_MEDIUM}

Click Add Customer Cancel Button
    [Documentation]    Annule l'ajout de client
    # CORRECTION CRUCIALE : C'est un LIEN, pas un BOUTON
    Click Link    ${AddCustomerPageLocators.ADD_CUSTOMER_CANCEL_BUTTON}
    Wait Until Location Contains    /customers.html    timeout=${TIMEOUT_MEDIUM}

Verify Multiple Customers Displayed
    [Documentation]    Vérifie qu'il y a plusieurs clients dans le tableau
    Page Should Contain    Our Happy Customers    # Vérification du texte sur la page
    Wait Until Page Contains Element    ${CustomersPageLocators.CUSTOMER_TABLE}    timeout=${TIMEOUT_MEDIUM}
    ${row_count}=    Get Element Count    ${CustomersPageLocators.CUSTOMER_TABLE_ROWS}
    Should Be True    ${row_count} > 1    msg=Le tableau clients devrait contenir plus d'un enregistrement