# pageobject/locator.py

class LoginPageLocators:
    EMAIL_FIELD = "id:email-id"
    PASSWORD_FIELD = "id:password"
    SUBMIT_BUTTON = "id:submit-id"
    REMEMBER_ME_CHECKBOX = "id:remember" # Basé sur l'inspection précédente de la page de login

class CustomersPageLocators:
    NEW_CUSTOMER_BUTTON = "id:new-customer"  # Corrigé précédemment
    CUSTOMER_TABLE = "id:customers"            # Corrigé précédemment
    CUSTOMER_TABLE_ROWS = "css:table#customers tbody tr" # Corrigé précédemment

class AddCustomerPageLocators:
    # CORRECTIONS BASÉES SUR VOTRE DERNIÈRE INSPECTION DÉTAILLÉE :
    ADD_CUSTOMER_EMAIL_FIELD = "id:EmailAddress" # Corrigé: id="EmailAddress"
    ADD_CUSTOMER_FIRST_NAME_FIELD = "id:FirstName" # Corrigé: id="FirstName"
    ADD_CUSTOMER_LAST_NAME_FIELD = "id:LastName"    # Corrigé: id="LastName"
    ADD_CUSTOMER_CITY_FIELD = "id:City"             # Corrigé: id="City"
    ADD_CUSTOMER_STATE_DROPDOWN = "id:StateOrRegion" # Corrigé: id="StateOrRegion"
    # Pour les boutons radio, Select Radio Button utilise le 'name' du groupe et la 'value' de l'option.
    # Nous stockons ici directement la 'value' des options.
    ADD_CUSTOMER_GENDER_MALE_RADIO = "male" # Valeur de l'input radio male
    ADD_CUSTOMER_GENDER_FEMALE_RADIO = "female" # Valeur de l'input radio female
    ADD_CUSTOMER_PROMOTION_CHECKBOX = "name:promos-name" # Corrigé: name="promos-name"
    ADD_CUSTOMER_SUBMIT_BUTTON = "xpath://button[text()='Submit']" # Corrigé: Pas d'ID, utilise XPath sur le texte du bouton
    ADD_CUSTOMER_CANCEL_BUTTON = "link:Cancel" # Corrigé: Pas d'ID, c'est un lien <a> avec le texte "Cancel"

class CommonElements:
    LOGOUT_LINK = "link:Sign Out" # Basé sur l'inspection précédente
    SIGN_IN_LINK = "id:SignIn" # Basé sur l'inspection précédente